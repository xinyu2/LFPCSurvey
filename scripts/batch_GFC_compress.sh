#!/bin/bash
# ============== #
# test pFPC #
# ============== #
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
# ================ #
# test GFC #
# ================ #
# { ../GFC/GFC 32 32 1 < $DATADIR/astro_mhd_f64 > $DATADIR/astro_mhd_f64.gfc ; } 2>> $RESDIR/res_gfc.txt
# { ../GFC/GFC 32 32 1 < $DATADIR/astro_pt_f64 > $DATADIR/astro_pt_f64.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 32 32 1 < $DATADIR/citytemp_f32 > $DATADIR/citytemp_f32.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 32 32 3 < $DATADIR/h3d_temp > $DATADIR/h3d_temp.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 32 32 2 < $DATADIR/hdr_night > $DATADIR/hdr_night.gfc ; } 2>> $RESDIR/res_gfc.txt
# { ../GFC/GFC 32 32 3 < $DATADIR/miranda3d > $DATADIR/miranda3d.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 32 32 1 < $DATADIR/msg_bt > $DATADIR/msg_bt.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 32 32 1 < $DATADIR/num_brain > $DATADIR/num_brain.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 32 32 2 < $DATADIR/num_control > $DATADIR/num_control.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 32 32 2 < $DATADIR/rsim_f32 > $DATADIR/rsim_f32.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 32 32 1 < $DATADIR/spitzer_irac > $DATADIR/spitzer_irac.gfc ; } 2>> $RESDIR/res_gfc.txt
# { ../GFC/GFC 32 32 1 < $DATADIR/tpch_lineitem_f32 > $DATADIR/tpch_lineitem_f32.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 32 32 1 < $DATADIR/tpch_order_f64 > $DATADIR/tpch_order_f64.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 32 32 1 < $DATADIR/ts_gas > $DATADIR/ts_gas.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 32 32 1 < $DATADIR/turbulence > $DATADIR/turbulence.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 32 32 1 < $DATADIR/wave_f32 > $DATADIR/wave_f32.gfc ; } 2>> $RESDIR/res_gfc.txt
