# ============== #
# test ndzip #
# ============== #
EXECDIR=/home/cc/code
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
# ================ #
# test ndzip-cpu #
# ================ #

# rm $DATADIR/*.ndzout
echo "clean cpu decompress finish"
# ================ #
# test ndzip-gpu #
# ================ #
# ================ #
# test ndzip-gpu #
# ================ #
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/astro_mhd_f64 -o $DATADIR/astro_mhd_f64.ndzip2 -t double -n 130 514 1026 ; } 2>>$RESDIR/res_ndzip_gpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/astro_pt_f64 -o $DATADIR/astro_pt_f64.ndzip2 -t double -n 512 256 640 ; } 2>>$RESDIR/res_ndzip_gpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/citytemp_f32 -o $DATADIR/citytemp_f32.ndzip2 -t float -n 2906326 ; } 2>>$RESDIR/res_ndzip_gpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/h3d_temp -o $DATADIR/h3d_temp.ndzip2 -t double -n 500 500 50 ; } 2>>$RESDIR/res_ndzip_gpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/hdr_night -o $DATADIR/hdr_night.ndzip2 -t double -n 2843724 ; } 2>>$RESDIR/res_ndzip_gpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/miranda3d -o $DATADIR/miranda3d.ndzip2 -t float -n 1024 1024 1024 ; } 2>>$RESDIR/res_ndzip_gpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/msg_bt -o $DATADIR/msg_bt.ndzip2 -t double -n 33298679 ; } 2>>$RESDIR/res_ndzip_gpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/num_brain -o $DATADIR/num_brain.ndzip2 -t double -n 17730000 ; } 2>>$RESDIR/res_ndzip_gpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/num_control -o $DATADIR/num_control.ndzip2 -t double -n 19938093 ; } 2>>$RESDIR/res_ndzip_gpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/rsim_f32 -o $DATADIR/rsim_f32.ndzip2 -t float -n 2048 11509 ; } 2>>$RESDIR/res_ndzip_gpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/spitzer_irac -o $DATADIR/spitzer_irac.ndzip2 -t float -n 41249520 ; } 2>>$RESDIR/res_ndzip_gpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/tpch_lineitem_f32 -o $DATADIR/tpch_lineitem_f32.ndzip2 -t float -n 239944204 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/tpch_order_f64 -o $DATADIR/tpch_order_f64.ndzip2 -t double -n 15000000 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/ts_gas -o $DATADIR/ts_gas.ndzip2 -t float -n 76863200 ; } 2>>$RESDIR/res_ndzip_gpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/turbulence -o $DATADIR/turbulence.ndzip2 -t float -n 256 256 256 ; } 2>>$RESDIR/res_ndzip_gpu.txt
{ $EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/wave_f32 -o $DATADIR/wave_f32.ndzip2 -t float -n 512 512 512 ; } 2>>$RESDIR/res_ndzip_gpu.txt
ls -l $DATADIR/*.ndzip2
echo "test ndzip-gpu decompress"
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/astro_mhd_f64.ndzout2 -i $DATADIR/astro_mhd_f64.ndzip2 -t double -n 130 514 1026 ; } 2>> $RESDIR/res_ndzip_gpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/astro_pt_f64.ndzout2 -i $DATADIR/astro_pt_f64.ndzip2 -t double -n 512 256 640 ; } 2>> $RESDIR/res_ndzip_gpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/citytemp_f32.ndzout2 -i $DATADIR/citytemp_f32.ndzip2 -t float -n 2906326 ; } 2>> $RESDIR/res_ndzip_gpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/h3d_temp.ndzout2 -i $DATADIR/h3d_temp.ndzip2 -t double -n 500 500 50 ; } 2>> $RESDIR/res_ndzip_gpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/hdr_night.ndzout2 -i $DATADIR/hdr_night.ndzip2 -t double -n 2843724 ; } 2>> $RESDIR/res_ndzip_gpu_decomp.txt
# { $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/miranda3d.ndzout2 -i $DATADIR/miranda3d.ndzip2 -t float -n 1024 1024 1024 ; } 2>> $RESDIR/res_ndzip_gpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/msg_bt.ndzout2 -i $DATADIR/msg_bt.ndzip2 -t double -n 33298679 ; } 2>> $RESDIR/res_ndzip_gpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/num_brain.ndzout2 -i $DATADIR/num_brain.ndzip2 -t double -n 17730000 ; } 2>> $RESDIR/res_ndzip_gpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/num_control.ndzout2 -i $DATADIR/num_control.ndzip2 -t double -n 19938093 ; } 2>> $RESDIR/res_ndzip_gpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/rsim_f32.ndzout2 -i $DATADIR/rsim_f32.ndzip2 -t float -n 2048 11509 ; } 2>> $RESDIR/res_ndzip_gpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/spitzer_irac.ndzout2 -i $DATADIR/spitzer_irac.ndzip2 -t float -n 41249520 ; } 2>> $RESDIR/res_ndzip_gpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/tpch_lineitem_f32.ndzout2 -i $DATADIR/tpch_lineitem_f32.ndzip2 -t float -n 239944204 ; } 2>>$RESDIR/res_ndzip_gpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/tpch_order_f64.ndzout2 -i $DATADIR/tpch_order_f64.ndzip2 -t double -n 15000000 ; } 2>>$RESDIR/res_ndzip_gpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/ts_gas.ndzout2 -i $DATADIR/ts_gas.ndzip2 -t float -n 76863200 ; } 2>> $RESDIR/res_ndzip_gpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/turbulence.ndzout2 -i $DATADIR/turbulence.ndzip2 -t float -n 256 256 256 ; } 2>> $RESDIR/res_ndzip_gpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/wave_f32.ndzout2 -i $DATADIR/wave_f32.ndzip2 -t float -n 512 512 512 ; } 2>> $RESDIR/res_ndzip_gpu_decomp.txt
ls -l $DATADIR/*.ndzout2
