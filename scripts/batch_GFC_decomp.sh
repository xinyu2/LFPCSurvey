#!/bin/bash
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
# ================ #
# test GFC #
# ================ #
# { ../GFC/GFC < $DATADIR/astro_mhd_f64.gfc > $DATADIR/astro_mhd_f64.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
# { ../GFC/GFC < $DATADIR/astro_pt_f64.gfc > $DATADIR/astro_pt_f64.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/citytemp_f32.gfc > $DATADIR/citytemp_f32.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/h3d_temp.gfc > $DATADIR/h3d_temp.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/hdr_night.gfc > $DATADIR/hdr_night.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
# { ../GFC/GFC < $DATADIR/miranda3d.gfc > $DATADIR/miranda3d.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/msg_bt.gfc > $DATADIR/msg_bt.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/num_brain.gfc > $DATADIR/num_brain.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/num_control.gfc > $DATADIR/num_control.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/spitzer_irac.gfc > $DATADIR/spitzer_irac.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/rsim_f32.gfc > $DATADIR/rsim_f32.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
# { ../GFC/GFC < $DATADIR/tpch_lineitem_f32.gfc > $DATADIR/tpch_lineitem_f32.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/tpch_order_f64.gfc > $DATADIR/tpch_order_f64.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/ts_gas.gfc > $DATADIR/ts_gas.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/turbulence.gfc > $DATADIR/turbulence.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/wave_f32.gfc > $DATADIR/wave_f32.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
ls -l $DATADIR/*.gfcout >> $RESDIR/res_gfc_decompress.txt
rm $DATADIR/*.gfcout
