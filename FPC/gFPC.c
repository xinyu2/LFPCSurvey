/*
Copyright (c) 2009, The University of Texas at Austin.  All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

  * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
  * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
  * Neither the name of the University of Texas at Austin nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Author: Dr. Martin Burtscher
*/


#include <stdlib.h>
#include <stdio.h>
#include <assert.h>


#define ull unsigned long long

static const ull mask[8] =
{0x0000000000000000LL,
0x00000000000000ffLL,
0x000000000000ffffLL,
0x0000000000ffffffLL,
0x000000ffffffffffLL,
0x0000ffffffffffffLL,
0x00ffffffffffffffLL,
0xffffffffffffffffLL};


/*
The following function compresses a block of data with the passed configuration.

Inputs
------
num: the number of doubles in the input buffer (ibuf)
ibuf: a pointer to the input buffer
obuf: a pointer to the output buffer (must be large enough)
predsizem1: the fcm and dfcm predictor size in doubles (must be a power of two minus one)
fcm: a pointer to the fcm predictor table
dfcm: a pointer to the dfcm predictor table
hlshift, hrshift, dlshift, drshift: the hash function parameters

Output
------
The compressed data in obuf (the first four bytes specify the total number of bytes)
*/

static void CompressBlock(const int num, const ull * restrict const ibuf, unsigned char * restrict const obuf, const int predsizem1, ull * restrict const fcm, ull * restrict const dfcm, int hlshift, int hrshift, int dlshift, int drshift)
{
  register int i, o, out, hash, dhash, code, bcode, save;
  register ull val, lastval, stride, pred1, pred2, xor1, xor2;

  hash = 0;
  dhash = 0;
  lastval = 0;
  pred1 = 0;
  pred2 = 0;

  out = ((num + 1) >> 1) + 4;
  *((ull *)&obuf[out & -8]) = 0;
  o = 8;
  for (i = 0; i < num; i++) {
    val = ibuf[i];
    xor1 = val ^ pred1;
    fcm[hash] = val;
    hash = ((hash << hlshift) ^ (val >> hrshift)) & predsizem1;
    pred1 = fcm[hash];

    stride = val - lastval;
    xor2 = val ^ (lastval + pred2);
    lastval = val;
    dfcm[dhash] = stride;
    dhash = ((dhash << dlshift) ^ (stride >> drshift)) & predsizem1;
    pred2 = dfcm[dhash];

    code = 0;
    if (xor1 > xor2) {
      code = 0x8;
      xor1 = xor2;
    }
    bcode = 7;
    if (0 == (xor1 >> 56)) bcode = 6;
    if (0 == (xor1 >> 48)) bcode = 5;
    if (0 == (xor1 >> 40)) bcode = 4;
    if (0 == (xor1 >> 24)) bcode = 3;
    if (0 == (xor1 >> 16)) bcode = 2;
    if (0 == (xor1 >> 8)) bcode = 1;
    if (0 == xor1) bcode = 0;

    *((ull *)&obuf[out & -8]) |= xor1 << ((out & 0x7) << 3);
    *((ull *)&obuf[(out & -8) + 8]) = (xor1 >> (63 - ((out & 0x7) << 3))) >> 1;

    code |= bcode;
    out += bcode + (bcode >> 2);
    obuf[o >> 1] = save | code;
    save = code << 4;
    o++;
  }
  if (0 != (o & 1)) {
    obuf[o >> 1] = save;
  }

  *((int *)&obuf[0]) = out;  // number of (compressed) bytes
}


/*
The following function decompresses a block of data with the passed configuration.

Inputs
------
num: the number of compressed doubles in the input buffer (ibuf)
ibuf: a pointer to the input buffer
obuf: a pointer to the output buffer (must be large enough)
predsizem1: the fcm and dfcm predictor size in doubles (must be a power of two minus one)
fcm: a pointer to the fcm predictor table
dfcm: a pointer to the dfcm predictor table
hlshift, hrshift, dlshift, drshift: the hash function parameters

Output
------
The decompressed data in obuf
*/

static void DecompressBlock(const int num, const unsigned char * restrict const ibuf, ull * restrict const obuf, const int predsizem1, ull * restrict const fcm, ull * restrict const dfcm, int hlshift, int hrshift, int dlshift, int drshift)
{
  register int i, o, in, alt, hash, dhash, bcode, tmp;
  register ull val, lastval, stride, pred1, pred2, next;

  hash = 0;
  dhash = 0;
  lastval = 0;
  pred1 = 0;
  pred2 = 0;

  in = ((num + 1) >> 1) + 4;
  i = 8;
  alt = 4;
  for (o = 0; o < num; o++) {
    bcode = ibuf[i >> 1] >> alt;
    i++;
    alt ^= 4;

    val = *((ull *)&ibuf[in & -8]);
    next = *((ull *)&ibuf[(in & -8) + 8]);
    tmp = (in & 0x7) << 3;
    val >>= tmp;
    next <<= 63 - tmp;
    val |= next + next;

    if (0 != (bcode & 0x8))
      pred1 = pred2;
    bcode &= 0x7;
    val &= mask[bcode];
    in += bcode + (bcode >> 2);
    val ^= pred1;

    fcm[hash] = val;
    hash = ((hash << hlshift) ^ (val >> hrshift)) & predsizem1;
    pred1 = fcm[hash];

    stride = val - lastval;
    dfcm[dhash] = stride;
    dhash = ((dhash << dlshift) ^ (stride >> drshift)) & predsizem1;
    pred2 = val + dfcm[dhash];
    lastval = val;

    obuf[o] = val;
  }
}


static void Compress(const int predsizelg2, const int popsize, int blocksizelg2)
{
  register int i, j, cnt, min, mask, p1, p2;
  int num;
  register const int predsizem1 = (1 << predsizelg2) - 1;
  register const int blocksize = 1 << blocksizelg2;

  register int * restrict bytecount;
  register ull * restrict input;
  unsigned char * restrict inter[256];
  ull * restrict fcm[256], * restrict dfcm[256];

  register unsigned char * restrict hlshift, * restrict newhlshift;
  register unsigned char * restrict hrshift, * restrict newhrshift;
  register unsigned char * restrict dlshift, * restrict newdlshift;
  register unsigned char * restrict drshift, * restrict newdrshift;
  register ull sum, cur, * restrict fitness;

  // allocate configuration tables
  bytecount = (int *)calloc(popsize, sizeof(int));
  assert(NULL != bytecount);
  hlshift = (unsigned char *)calloc(popsize, sizeof(unsigned char));
  assert(NULL != hlshift);
  hrshift = (unsigned char *)calloc(popsize, sizeof(unsigned char));
  assert(NULL != hrshift);
  dlshift = (unsigned char *)calloc(popsize, sizeof(unsigned char));
  assert(NULL != dlshift);
  drshift = (unsigned char *)calloc(popsize, sizeof(unsigned char));
  assert(NULL != drshift);
  newhlshift = (unsigned char *)calloc(popsize, sizeof(unsigned char));
  assert(NULL != newhlshift);
  newhrshift = (unsigned char *)calloc(popsize, sizeof(unsigned char));
  assert(NULL != newhrshift);
  newdlshift = (unsigned char *)calloc(popsize, sizeof(unsigned char));
  assert(NULL != newdlshift);
  newdrshift = (unsigned char *)calloc(popsize, sizeof(unsigned char));
  assert(NULL != newdrshift);
  fitness = (ull *)calloc(popsize, sizeof(ull));
  assert(NULL != fitness);

  // allocate buffers and predictor tables
  input = (ull *)calloc(blocksize >> 3, 8);
  assert(NULL != input);
  for (i = 0; i < popsize; i++) {
    inter[i] = (unsigned char *)calloc((8 + (((blocksize >> 3) + 1) >> 1) + blocksize + 15) >> 3, 8);
    fcm[i] = (ull *)calloc(predsizem1 + 1, 8);
    dfcm[i] = (ull *)calloc(predsizem1 + 1, 8);
  }

  // generate random initial configurations
  for (i = 0; i < popsize; i++) {
    hlshift[i] = (rand() % predsizelg2) + 1;
    hrshift[i] = rand() & 63;
    dlshift[i] = (rand() % predsizelg2) + 1;
    drshift[i] = rand() & 63;
  }

  // initialize one configuration with FPC parameters
  hlshift[0] = 6;
  hrshift[0] = 48;
  dlshift[0] = 2;
  drshift[0] = 40;

  // output header
  num = fwrite(&predsizelg2, 1, 1, stdout);
  assert(1 == num);
  num = fwrite(&blocksizelg2, 1, 1, stdout);
  assert(1 == num);

  // read in and compress data
  num = fread(input, 8, blocksize >> 3, stdin);
  while (num > 0) {
    // compress block with each configuration and find minimum
    min = 0;
    for (i = 0; i < popsize; i++) {
      CompressBlock(num, input, inter[i], predsizem1, fcm[i], dfcm[i], hlshift[i], hrshift[i], dlshift[i], drshift[i]);
      bytecount[i] = *((int *)inter[i]);
      if (bytecount[i] < bytecount[min]) min = i;
    }

    // output block header
    cnt = fwrite(&num, 4, 1, stdout);
    assert(cnt == 1);
    num = hlshift[min] | (hrshift[min] << 5) | (dlshift[min] << 11) | (drshift[min] << 16);
    cnt = fwrite(&num, 1, 3, stdout);
    assert(cnt == 3);

    // output compressed data
    cnt = *((int *)inter[min]);  // number of (compressed) bytes
    num = fwrite(inter[min], 1, cnt, stdout);
    assert(num == cnt);

    // compute fitness of each configuration
    sum = 0;
    for (i = 0; i < popsize; i++) {
      fitness[i] = (8000000LL * num) / bytecount[i];
      sum += fitness[i];
    }

    // copy final predictor table content of best configuration to all predictor tables
    for (i = 0; i < popsize; i++) {
      if (i != min) {
        for (j = 0; j <= predsizem1; j++) {
          fcm[i][j] = fcm[min][j];
          dfcm[i][j] = dfcm[min][j];
        }
      }
    }

    // keep best configuration
    newhlshift[0] = hlshift[min];
    newhrshift[0] = hrshift[min];
    newdlshift[0] = dlshift[min];
    newdrshift[0] = drshift[min];

    // generate new configurations
    for (i = 1; i < popsize; i++) {
      // pick two 'parents' based on fitness
      cur = rand() % sum;
      p1 = 0;
      while ((p1 < popsize-1) && (cur > fitness[p1])) {cur -= fitness[p1]; p1++;}
      cur = rand() % sum;
      p2 = 0;
      while ((p2 < popsize-1) && (cur > fitness[p2])) {cur -= fitness[p2]; p2++;}

      // crossover
      mask = rand() & 15;
      newhlshift[i] = ((mask & 1) != 0) ? hlshift[p1] : hlshift[p2];
      newhrshift[i] = ((mask & 2) != 0) ? hrshift[p1] : hrshift[p2];
      newdlshift[i] = ((mask & 4) != 0) ? dlshift[p1] : dlshift[p2];
      newdrshift[i] = ((mask & 8) != 0) ? drshift[p1] : drshift[p2];

      // mutation
      newhlshift[i] = ((rand() & 127) >= 43) ? newhlshift[i] : (rand() % predsizelg2) + 1;
      newhrshift[i] = ((rand() & 127) >= 43) ? newhrshift[i] : rand() & 63;
      newdlshift[i] = ((rand() & 127) >= 43) ? newdlshift[i] : (rand() % predsizelg2) + 1;
      newdrshift[i] = ((rand() & 127) >= 43) ? newdrshift[i] : rand() & 63;
    }

    // copy new configurations over
    for (i = 0; i < popsize; i++) {
      hlshift[i] = newhlshift[i];
      hrshift[i] = newhrshift[i];
      dlshift[i] = newdlshift[i];
      drshift[i] = newdrshift[i];
    }

    num = fread(input, 8, blocksize >> 3, stdin);
  }
}


static void Decompress()
{
  int num, predsizelg2, blocksizelg2;
  register int cnt, in, predsizem1, blocksize;
  register int hlshift, hrshift, dlshift, drshift;
  register ull * restrict output;
  register unsigned char * restrict inter;
  register ull * restrict fcm, * restrict dfcm;

  // read in file header
  predsizelg2 = 0;
  num = fread(&predsizelg2, 1, 1, stdin);
  assert(1 == num);
  blocksizelg2 = 0;
  num = fread(&blocksizelg2, 1, 1, stdin);
  assert(1 == num);

  predsizem1 = (1 << predsizelg2) - 1;
  blocksize = 1 << blocksizelg2;

  // allocate buffers and predictor tables
  inter = (unsigned char *)calloc((8 + (((blocksize >> 3) + 1) >> 1) + blocksize + 15) >> 3, 8);
  output = (ull *)calloc(blocksize >> 3, 8);
  fcm = (ull *)calloc(predsizem1 + 1, 8);
  dfcm = (ull *)calloc(predsizem1 + 1, 8);

  // read in and decompress data
  cnt = fread(&num, 4, 1, stdin);
  while (cnt == 1) {
    // get configuration, i.e., shift amounts
    cnt = fread(inter, 1, 3, stdin);
    assert(cnt == 3);
    in = *((int *)inter);
    hlshift = in & 31;
    hrshift = (in >> 5) & 63;
    dlshift = (in >> 11) & 31;
    drshift = (in >> 16) & 63;

    // input compressed data
    cnt = fread(inter, 4, 1, stdin);
    assert(cnt == 1);
    in = *((int *)inter) - 4;
    cnt = fread(&(inter[4]), 1, in, stdin);
    assert(cnt == in);

    DecompressBlock(num, inter, output, predsizem1, fcm, dfcm, hlshift, hrshift, dlshift, drshift);

    // output decompressed data
    cnt = fwrite(output, 8, num, stdout);
    assert(cnt == num);

    cnt = fread(&num, 4, 1, stdin);
  }
}


int main(int argc, char *argv[])
{
  int predsizelg2, popsize, blocksizelg2, val, remainingbytes;

  fprintf(stderr, "gFPC v1.0 written by Martin Burtscher\nCopyright (c) 2009, The University of Texas at Austin.  All rights reserved.\n\n");

  // make sure system parameters are okay
  assert(1 == sizeof(char));
  assert(4 == sizeof(int));
  assert(8 == sizeof(ull));
  val = 1;
  assert(1 == *((char *)&val));

  if ((3 == argc) || (4 == argc)) {  // compress
    // parse input
    predsizelg2 = atoi(argv[1]);
    assert((4 <= predsizelg2) && (predsizelg2 < 30));
    popsize = atoi(argv[2]);
    assert((1 <= popsize) && (popsize < 256));
    blocksizelg2 = 19;
    if (4 == argc) {
      blocksizelg2 = atoi(argv[3]);
      assert((12 <= blocksizelg2) && (blocksizelg2 < 30));
    }

    fprintf(stderr, "predictor size = %d bytes\n", 1 << predsizelg2);
    fprintf(stderr, "population size = %d\n", popsize);
    fprintf(stderr, "block size = %d bytes\n\n", 1 << blocksizelg2);

    Compress(predsizelg2 - 4, popsize, blocksizelg2);

    remainingbytes = fread(&val, 1, 1, stdin);
    assert(0 == remainingbytes);
  } else if (1 == argc) {  // decompress
    Decompress();
  } else {
    fprintf(stderr, "usage: %s [predictorsizelg2 populationsize [blocksizelg2]]\n", argv[0]);
  }

  return 0;
}
