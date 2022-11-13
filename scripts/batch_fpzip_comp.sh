#!/bin/bash
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
# ================ #
# test fpzip #
# ================ #
{ ../fpzip/build/bin/fpzip -i $DATADIR/astro_mhd_f64 -o $DATADIR/astro_mhd_f64.fpzip -t double -1 68557320 ; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/astro_pt_f64 -o $DATADIR/astro_pt_f64.fpzip -t double -1 83886080 ; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/citytemp_f32 -o $DATADIR/citytemp_f32.fpzip -t float -1 2906326 ; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/h3d_temp -o $DATADIR/h3d_temp.fpzip -t double -3 500 500 50 ; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/hdr_night -o $DATADIR/hdr_night.fpzip -t double -1 2843724 ; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/miranda3d -o $DATADIR/miranda3d.fpzip -t float -3 1024 1024 1024 ; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/msg_bt -o $DATADIR/msg_bt.fpzip -t double -1 33298679 ; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/num_brain -o $DATADIR/num_brain.fpzip -t double -1 17730000 ; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/num_control -o $DATADIR/num_control.fpzip -t double -1 19938093 ; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/rsim_f32 -o $DATADIR/rsim_f32.fpzip -t float -2 2048 11509 ; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/spitzer_irac -o $DATADIR/spitzer_irac.fpzip -t float -1 41249520 ; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/tpch_lineitem_f32 -o $DATADIR/tpch_lineitem_f32.fpzip -t float -1 239944204; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/tpch_order_f64 -o $DATADIR/tpch_order_f64.fpzip -t double -1 15000000; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/ts_gas -o $DATADIR/ts_gas.fpzip -t float -1 76863200; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/turbulence -o $DATADIR/turbulence.fpzip -t float -1 16777216 ; } 2>> $RESDIR/res_fpzip.txt
{ ../fpzip/build/bin/fpzip -i $DATADIR/wave_f32 -o $DATADIR/wave_f32.fpzip -t float -1 134217728 ; } 2>> $RESDIR/res_fpzip.txt

