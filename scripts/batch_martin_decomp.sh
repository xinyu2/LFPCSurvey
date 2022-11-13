# ============== #
# test pFPC #
# ============== #
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
{ ../pFPC/pfpc < $DATADIR/astro_mhd_f64.pfpc > $DATADIR/astro_mhd_f64.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/astro_pt_f64.pfpc > $DATADIR/astro_pt_f64.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/citytemp_f32.pfpc > $DATADIR/citytemp_f32.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/h3d_temp.pfpc > $DATADIR/h3d_temp.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/hdr_night.pfpc > $DATADIR/hdr_night.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/miranda3d.pfpc > $DATADIR/miranda3d.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/msg_bt.pfpc > $DATADIR/msg_bt.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/num_brain.pfpc > $DATADIR/num_brain.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/num_control.pfpc > $DATADIR/num_control.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/rsim_f32.pfpc > $DATADIR/rsim_f32.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/spitzer_irac.pfpc > $DATADIR/spitzer_irac.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/tpch_lineitem_f32.pfpc > $DATADIR/tpch_lineitem_f32.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/tpch_order_f64.pfpc > $DATADIR/tpch_order_f64.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/ts_gas.pfpc > $DATADIR/ts_gas.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/turbulence.pfpc > $DATADIR/turbulence.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
{ ../pFPC/pfpc < $DATADIR/wave_f32.pfpc > $DATADIR/wave_f32.pfpcout ; } 2>> $RESDIR/res_pfpc_decompress.txt
ls -l $DATADIR/*.pfpcout >> $RESDIR/res_pfpc_decompress.txt
rm $DATADIR/*.pfpcout
# ================ #
# test SPDP #
# ================ #
{ ../SPDP/spdp < $DATADIR/astro_mhd_f64.spdp > $DATADIR/astro_mhd_f64.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/astro_pt_f64.spdp > $DATADIR/astro_pt_f64.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/citytemp_f32.spdp > $DATADIR/citytemp_f32.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/h3d_temp.spdp > $DATADIR/h3d_temp.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/hdr_night.spdp > $DATADIR/hdr_night.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/miranda3d.spdp > $DATADIR/miranda3d.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/msg_bt.spdp > $DATADIR/msg_bt.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/num_brain.spdp > $DATADIR/num_brain.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/num_control.spdp > $DATADIR/num_control.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/rsim_f32.spdp > $DATADIR/rsim_f32.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/spitzer_irac.spdp > $DATADIR/spitzer_irac.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/tpch_lineitem_f32.spdp > $DATADIR/tpch_lineitem_f32.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/tpch_order_f64.spdp > $DATADIR/tpch_order_f64.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/ts_gas.spdp > $DATADIR/ts_gas.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/turbulence.spdp > $DATADIR/turbulence.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
{ ../SPDP/spdp < $DATADIR/wave_f32.spdp > $DATADIR/wave_f32.spdpout ; } 2>> $RESDIR/res_spdp_decompress.txt
ls -l $DATADIR/*.spdpout >> $RESDIR/res_spdp_decompress.txt
rm $DATADIR/*.spdpout
# ================ #
# test GFC #
# ================ #
{ ../GFC/GFC < $DATADIR/astro_mhd_f64.gfc > $DATADIR/astro_mhd_f64.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/astro_pt_f64.gfc > $DATADIR/astro_pt_f64.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/citytemp_f32.gfc > $DATADIR/citytemp_f32.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/h3d_temp.gfc > $DATADIR/h3d_temp.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/hdr_night.gfc > $DATADIR/hdr_night.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/miranda3d.gfc > $DATADIR/miranda3d.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/msg_bt.gfc > $DATADIR/msg_bt.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/num_brain.gfc > $DATADIR/num_brain.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/num_control.gfc > $DATADIR/num_control.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/spitzer_irac.gfc > $DATADIR/spitzer_irac.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/rsim_f32.gfc > $DATADIR/rsim_f32.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/tpch_lineitem_f32.gfc > $DATADIR/tpch_lineitem_f32.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/tpch_order_f64.gfc > $DATADIR/tpch_order_f64.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/ts_gas.gfc > $DATADIR/ts_gas.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/turbulence.gfc > $DATADIR/turbulence.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
{ ../GFC/GFC < $DATADIR/wave_f32.gfc > $DATADIR/wave_f32.gfcout ; } 2>> $RESDIR/res_gfc_decompress.txt
ls -l $DATADIR/*.gfcout >> $RESDIR/res_gfc_decompress.txt
rm $DATADIR/*.gfcout
