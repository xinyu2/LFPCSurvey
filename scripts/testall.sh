#!/bin/bash
echo "====buff===="
bash batch_buff_p10.sh
echo "====fpzip===="
bash batch_fpzip_decomp.sh
echo "====martin===="
bash batch_martin_compress.sh
bash batch_martin_decomp.sh
# echo "====mpc===="
# bash batch_mpc.sh
# bash batch_mpc_decomp.sh
# echo "====ndzip===="
bash batch_ndzip_cpu.sh
bash batch_ndzip_gpu.sh
echo "====nvcomp===="
bash batch_nvcomp.sh
echo "====chimp===="
bash batch_chimp.sh


