#!/bin/bash
# ============== #
# test MPC #
# ============== #
EXEDIR=/home/cc/code/buff/database
DATADIR=/home/cc/data/
RESDIR=/home/cc/data/experiments
# ================ #
# test MPC #
# ================ #
# cargo +nightly build --release  --package buff --bin comp_profiler
cd $EXEDIR
$EXEDIR/target/release/comp_profiler $DATADIR/astro_mhd_f64 buff-simd64 1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/astro_pt_f64 buff-simd64  1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/citytemp_f32 buff-simd32  1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/h3d_temp buff-simd64 		1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/hdr_night buff-simd64 	1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/miranda3d buff-simd32 	1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/msg_bt buff-simd64 		1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/num_brain buff-simd64 	1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/num_control buff-simd64 	1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/rsim_f32 buff-simd32 		1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/spitzer_irac buff-simd32 	1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/tpch_lineitem_f32 buff-simd32 1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/tpch_order_f64 buff-simd64 	1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/ts_gas buff-simd32 		1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/turbulence buff-simd32 	1000000000 1.15 >> $RESDIR/res_buff.txt
$EXEDIR/target/release/comp_profiler $DATADIR/wave_f32 buff-simd32 		1000000000 1.15 >> $RESDIR/res_buff.txt
