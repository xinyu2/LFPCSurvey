# ============== #
# test ndzip #
# ============== #
EXECDIR=/home/cc/code
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
# ================ #
# test ndzip-cpu #
# ================ #
{ $EXECDIR/ndzip/build/compress -i $DATADIR/astro_mhd_f64 -o $DATADIR/astro_mhd_f64.ndzip -t double -n 68557320 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/astro_pt_f64 -o $DATADIR/astro_pt_f64.ndzip -t double -n 83886080 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/citytemp_f32 -o $DATADIR/citytemp_f32.ndzip -t float -n 2906326 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/h3d_temp -o $DATADIR/h3d_temp.ndzip -t double -n 500 500 50 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/hdr_night -o $DATADIR/hdr_night.ndzip -t double -n 2843724 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/miranda3d -o $DATADIR/miranda3d.ndzip -t float -n 1024 1024 1024 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/msg_bt -o $DATADIR/msg_bt.ndzip -t double -n 33298679 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/num_brain -o $DATADIR/num_brain.ndzip -t double -n 17730000 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/num_control -o $DATADIR/num_control.ndzip -t double -n 19938093 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/rsim_f32 -o $DATADIR/rsim_f32.ndzip -t float -n 2048 11509 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/spitzer_irac -o $DATADIR/spitzer_irac.ndzip -t float -n 41249520 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/tpch_lineitem_f32 -o $DATADIR/tpch_lineitem_f32.ndzip -t float -n 239944204 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/tpch_order_f64 -o $DATADIR/tpch_order_f64.ndzip -t double -n 15000000 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/ts_gas -o $DATADIR/ts_gas.ndzip -t float -n 76863200 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/turbulence -o $DATADIR/turbulence.ndzip -t float -n 16777216 ; } 2>>$RESDIR/res_ndzip_cpu.txt
{ $EXECDIR/ndzip/build/compress -i $DATADIR/wave_f32 -o $DATADIR/wave_f32.ndzip -t float -n 134217728 ; } 2>>$RESDIR/res_ndzip_cpu.txt
ls -l $DATADIR/*.ndzip
echo "test ndzip-cpu decompress"
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/astro_mhd_f64.ndzout -i $DATADIR/astro_mhd_f64.ndzip -t double -n 68557320 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/astro_pt_f64.ndzout -i $DATADIR/astro_pt_f64.ndzip -t double -n 83886080 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/citytemp_f32.ndzout -i $DATADIR/citytemp_f32.ndzip -t float -n 2906326 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/h3d_temp.ndzout -i $DATADIR/h3d_temp.ndzip -t double -n 500 500 50 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/hdr_night.ndzout -i $DATADIR/hdr_night.ndzip -t double -n 2843724 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
# { $EXECDIR/ndzip/build/compress -d -o $DATADIR/miranda3d.ndzout -i $DATADIR/miranda3d.ndzip -t float -n 1024 1024 1024 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/msg_bt.ndzout -i $DATADIR/msg_bt.ndzip -t double -n 33298679 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/num_brain.ndzout -i $DATADIR/num_brain.ndzip -t double -n 17730000 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/num_control.ndzout -i $DATADIR/num_control.ndzip -t double -n 19938093 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/rsim_f32.ndzout -i $DATADIR/rsim_f32.ndzip -t float -n 2048 11509 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/spitzer_irac.ndzout -i $DATADIR/spitzer_irac.ndzip -t float -n 41249520 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/tpch_lineitem_f32.ndzout -i $DATADIR/tpch_lineitem_f32.ndzip -t float -n 239944204 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/tpch_order_f64.ndzout -i $DATADIR/tpch_order_f64.ndzip -t double -n 15000000 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/ts_gas.ndzout -i $DATADIR/ts_gas.ndzip -t float -n 76863200 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/turbulence.ndzout -i $DATADIR/turbulence.ndzip -t float -n 16777216 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
{ $EXECDIR/ndzip/build/compress -d -o $DATADIR/wave_f32.ndzout -i $DATADIR/wave_f32.ndzip -t float -n 134217728 ; } 2>>$RESDIR/res_ndzip_cpu_decomp.txt
ls -l $DATADIR/*.ndzout


