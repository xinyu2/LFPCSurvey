# ============== #
# test ndzip #
# ============== #
EXECDIR=/home/cc/code
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
# ================ #
# test ndzip-cpu #
# ================ #
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/h3d_temp -o $DATADIR/h3d_temp.ndzip -t double -n 500 500 50 ; } 2>>$RESDIR/res_ndzip_h3dtemp_gpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -d -o $DATADIR/h3d_temp.ndzout -i $DATADIR/h3d_temp.ndzip -t double -n 500 500 50 ; } 2>>$RESDIR/res_ndzip_h3dtemp_decomp_gpu.txt


