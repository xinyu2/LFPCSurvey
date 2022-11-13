#!/bin/bash
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
# ================ #
# test fpzip #
# ================ #
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/astro_mhd_f64.fpzipout -i $DATADIR/astro_mhd_f64.fpzip -t double -1 68557320 ; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/astro_pt_f64.fpzipout -i $DATADIR/astro_pt_f64.fpzip -t double -1 83886080 ; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/citytemp_f32.fpzipout -i $DATADIR/citytemp_f32.fpzip -t float -1 2906326 ; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/h3d_temp.fpzipout -i $DATADIR/h3d_temp.fpzip -t double -3 500 500 50 ; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/hdr_night.fpzipout -i $DATADIR/hdr_night.fpzip -t double -1 2843724 ; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/miranda3d.fpzipout -i $DATADIR/miranda3d.fpzip -t float -3 1024 1024 1024 ; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/msg_bt.fpzipout -i $DATADIR/msg_bt.fpzip -t double -1 33298679 ; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/num_brain.fpzipout -i $DATADIR/num_brain.fpzip -t double -1 17730000 ; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/num_control.fpzipout -i $DATADIR/num_control.fpzip -t double -1 19938093 ; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/rsim_f32.fpzipout -i $DATADIR/rsim_f32.fpzip -t float -2 2048 11509 ; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/spitzer_irac.fpzipout -i $DATADIR/spitzer_irac.fpzip -t float -1 41249520 ; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/tpch_lineitem_f32.fpzipout -i $DATADIR/tpch_lineitem_f32.fpzip -t float -1 239944204; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/tpch_order_f64.fpzipout -i $DATADIR/tpch_order_f64.fpzip -t double -1 15000000; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/ts_gas.fpzipout -i $DATADIR/ts_gas.fpzip -t float -1 76863200; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/turbulence.fpzipout -i $DATADIR/turbulence.fpzip -t float -1 16777216 ; } 2>> $RESDIR/res_fpzip_decompress.txt
{ ../fpzip/build/bin/fpzip -d -o $DATADIR/wave_f32.fpzipout -i $DATADIR/wave_f32.fpzip -t float -1 134217728 ; } 2>> $RESDIR/res_fpzip_decompress.txt

ls -l $DATADIR/*.fpzipout >> $RESDIR/res_fpzip_decompress.txt
rm $DATADIR/*.fpzipout
