/*
 * Copyright (c) 2017-2021, NVIDIA CORPORATION. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *  * Neither the name of NVIDIA CORPORATION nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#ifndef NVCOMP_SNAPPY_H
#define NVCOMP_SNAPPY_H

#include "nvcomp.h"

#include <cuda_runtime.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct
{
  int reserved;
} nvcompBatchedSnappyOpts_t;

static const nvcompBatchedSnappyOpts_t nvcompBatchedSnappyDefaultOpts = {0};

/**
 * @brief Get the amount of temp space required on the GPU for decompression.
 *
 * @param num_chunks The number of items in the batch.
 * @param max_uncompressed_chunk_size The size of the largest chunk when uncompressed.
 * @param temp_bytes The amount of temporary GPU space that will be required to
 * decompress.
 *
 * @return nvcompSuccess if successful, and an error code otherwise.
 */
nvcompStatus_t nvcompBatchedSnappyDecompressGetTempSize(
    size_t num_chunks, size_t max_uncompressed_chunk_size, size_t* temp_bytes);

/**
 * @brief Get the amount of temp space required on the GPU for decompression.
 *
 * @param num_chunks The number of items in the batch.
 * @param max_uncompressed_chunk_size The size of the largest chunk when uncompressed.
 * @param temp_bytes The amount of temporary GPU space that will be required to
 * decompress.
 * @param max_uncompressed_total_size  The total decompressed size of all the chunks. 
 * Unused in snappy.
 *
 * @return nvcompSuccess if successful, and an error code otherwise.
 */
nvcompStatus_t nvcompBatchedSnappyDecompressGetTempSizeEx(
    size_t num_chunks, size_t max_uncompressed_chunk_size, size_t* temp_bytes, size_t max_uncompressed_total_size );    

/**
 * @brief Compute uncompressed sizes.
 *
 * @param device_compresed_ptrs The pointers on the GPU, to the compressed chunks.
 * @param device_compressed_bytes The size of each compressed chunk on the GPU.
 * @param device_uncompressed_bytes The actual size of each uncompressed chunk.
 * @param batch_size The number of chunks in the batch.
 * @param stream The CUDA stream to operate on.
 *
 * @return nvcompSuccess if successful, and an error code otherwise.
 */
nvcompStatus_t nvcompBatchedSnappyGetDecompressSizeAsync(
    const void* const* device_compressed_ptrs,
    const size_t* device_compressed_bytes,
    size_t* device_uncompressed_bytes,
    size_t batch_size,
    cudaStream_t stream);

/**
 * @brief Perform decompression.
 *
 * @param device_compresed_ptrs The pointers on the GPU, to the compressed chunks.
 * @param device_compressed_bytes The size of each compressed chunk on the GPU.
 * @param device_uncompressed_bytes The size of each device_uncompressed_ptr[i] buffer.
 * @param device_actual_uncompressed_bytes The actual size of each uncompressed chunk
 * Can be nullptr if desired, in which case the actual_uncompressed_bytes is not reported.
 * @param batch_size The number of chunks in the batch.
 * @param device_temp_ptr The temporary GPU space, could be NULL in case temprorary space is not needed.
 * @param temp_bytes The size of the temporary GPU space.
 * @param device_uncompressed_ptr The pointers on the GPU, to where to uncompress each chunk (output).
 * @param device_statuses The pointers on the GPU, to where to uncompress each chunk (output).
 * Can be nullptr if desired, in which case error status is not reported.
 * @param stream The CUDA stream to operate on.
 *
 * @return nvcompSuccess if successful, and an error code otherwise.
 */
nvcompStatus_t nvcompBatchedSnappyDecompressAsync(
    const void* const* device_compresed_ptrs,
    const size_t* device_compressed_bytes,
    const size_t* device_uncompressed_bytes,
    size_t* device_actual_uncompressed_bytes,
    size_t batch_size,
    void* const device_temp_ptr,
    const size_t temp_bytes,
    void* const* device_uncompressed_ptr,
    nvcompStatus_t* device_statuses,
    cudaStream_t stream);

/**
 * @brief Get temporary space required for compression.
 *
 * @param batch_size The number of items in the batch.
 * @param max_chunk_size The maximum size of a chunk in the batch.
 * @param format_ops Snappy compression options.
 * @param temp_bytes The size of the required GPU workspace for compression
 * (output).
 *
 * @return nvcompSuccess if successful, and an error code otherwise.
 */
nvcompStatus_t nvcompBatchedSnappyCompressGetTempSize(
    size_t batch_size,
    size_t max_chunk_size,
    nvcompBatchedSnappyOpts_t format_ops,
    size_t* temp_bytes);

/**
 * @brief Get the maximum size any chunk could compress to in the batch. That
 * is, the minimum amount of output memory required to be given
 * nvcompBatchedSnappyCompressAsync() for each batch item.
 *
 * @param max_chunk_size The maximum size of a chunk in the batch.
 * @param format_ops Snappy compression options.
 * @param max_compressed_size The maximum compressed size of the largest chunk
 * (output).
 *
 * @return The nvcompSuccess unless there is an error.
 */
nvcompStatus_t nvcompBatchedSnappyCompressGetMaxOutputChunkSize(
    size_t max_chunk_size,
    nvcompBatchedSnappyOpts_t format_opts,
    size_t* max_compressed_size);

/**
 * @brief Perform compression.
 *
 * The caller is responsible for passing device_compressed_bytes of size
 * sufficient to hold compressed data
 *
 * @param device_uncompressed_ptr The pointers on the GPU, to uncompressed batched items.
 * @param device_uncompressed_bytes The size of each uncompressed batch item on the GPU.
 * @param max_uncompressed_chunk_bytes The size of the largest uncompressed chunk.
 * @param batch_size The number of chunks in the batch.
 * @param device_temp_ptr The temporary GPU workspace, could be NULL in case temprorary space is not needed.
 * @param temp_bytes The size of the temporary GPU workspace.
 * @param device_compressed_ptr The pointers on the GPU, to the output location for each compressed batch item (output).
 * @param device_compressed_bytes The compressed size of each chunk on the GPU (output).
 * @param format_ops Snappy compression options.
 * @param stream The CUDA stream to operate on.
 *
 * @return nvcompSuccess if successfully launched, and an error code otherwise.
 */
nvcompStatus_t nvcompBatchedSnappyCompressAsync(
    const void* const* device_uncompressed_ptr,
    const size_t* device_uncompressed_bytes,
    size_t max_uncompressed_chunk_bytes,
    size_t batch_size,
    void* device_temp_ptr,
    size_t temp_bytes,
    void* const* device_compressed_ptr,
    size_t* device_compressed_bytes,
    nvcompBatchedSnappyOpts_t format_ops,
    cudaStream_t stream);

#ifdef __cplusplus
}
#endif

#endif
