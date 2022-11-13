# ============== #
# test pFPC #
# ============== #
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
{ ../pFPC/pfpc 20 8 2048 < $DATADIR/astro_mhd_f64 > $DATADIR/astro_mhd_f64.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 2048 < $DATADIR/astro_pt_f64 > $DATADIR/astro_pt_f64.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 2048 < $DATADIR/citytemp_f32 > $DATADIR/citytemp_f32.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 2048 < $DATADIR/h3d_temp > $DATADIR/h3d_temp.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 2048 < $DATADIR/hdr_night > $DATADIR/hdr_night.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 2048 < $DATADIR/miranda3d > $DATADIR/miranda3d.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 1024 < $DATADIR/msg_bt > $DATADIR/msg_bt.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 1024 < $DATADIR/num_brain > $DATADIR/num_brain.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 1024 < $DATADIR/num_control > $DATADIR/num_control.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 2048 < $DATADIR/rsim_f32 > $DATADIR/rsim_f32.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 2048 < $DATADIR/spitzer_irac > $DATADIR/spitzer_irac.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 2048 < $DATADIR/tpch_lineitem_f32 > $DATADIR/tpch_lineitem_f32.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 2048 < $DATADIR/tpch_order_f64 > $DATADIR/tpch_order_f64.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 2048 < $DATADIR/ts_gas > $DATADIR/ts_gas.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 2048 < $DATADIR/turbulence > $DATADIR/turbulence.pfpc ; } 2>> $RESDIR/res_pfpc.txt
{ ../pFPC/pfpc 20 8 2048 < $DATADIR/wave_f32 > $DATADIR/wave_f32.pfpc ; } 2>> $RESDIR/res_pfpc.txt
# ================ #
# test SPDP #
# ================ #
{ ../SPDP/spdp 10 < $DATADIR/astro_mhd_f64 > $DATADIR/astro_mhd_f64.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/astro_pt_f64 > $DATADIR/astro_pt_f64.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/citytemp_f32 > $DATADIR/citytemp_f32.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/h3d_temp > $DATADIR/h3d_temp.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/hdr_night > $DATADIR/hdr_night.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/miranda3d > $DATADIR/miranda3d.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/msg_bt > $DATADIR/msg_bt.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/num_brain > $DATADIR/num_brain.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/num_control > $DATADIR/num_control.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/rsim_f32 > $DATADIR/rsim_f32.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/spitzer_irac > $DATADIR/spitzer_irac.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/tpch_lineitem_f32 > $DATADIR/tpch_lineitem_f32.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/tpch_order_f64 > $DATADIR/tpch_order_f64.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/ts_gas > $DATADIR/ts_gas.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/turbulence > $DATADIR/turbulence.spdp ; } 2>> $RESDIR/res_spdp.txt
{ ../SPDP/spdp 10 < $DATADIR/wave_f32 > $DATADIR/wave_f32.spdp ; } 2>> $RESDIR/res_spdp.txt
# ================ #
# test GFC #
# ================ #
{ ../GFC/GFC 28 18 2 < $DATADIR/astro_mhd_f64 > $DATADIR/astro_mhd_f64.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/astro_pt_f64 > $DATADIR/astro_pt_f64.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/citytemp_f32 > $DATADIR/citytemp_f32.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/h3d_temp > $DATADIR/h3d_temp.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/hdr_night > $DATADIR/hdr_night.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/miranda3d > $DATADIR/miranda3d.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/msg_bt > $DATADIR/msg_bt.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/num_brain > $DATADIR/num_brain.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/num_control > $DATADIR/num_control.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/spitzer_irac > $DATADIR/spitzer_irac.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/rsim_f32 > $DATADIR/rsim_f32.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/tpch_lineitem_f32 > $DATADIR/tpch_lineitem_f32.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/tpch_order_f64 > $DATADIR/tpch_order_f64.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/ts_gas > $DATADIR/ts_gas.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/turbulence > $DATADIR/turbulence.gfc ; } 2>> $RESDIR/res_gfc.txt
{ ../GFC/GFC 28 18 2 < $DATADIR/wave_f32 > $DATADIR/wave_f32.gfc ; } 2>> $RESDIR/res_gfc.txt
