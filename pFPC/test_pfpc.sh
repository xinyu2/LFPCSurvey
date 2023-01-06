# ============== #
# test pFPC #
# ============== #
DATADIR=../../data/input
OUTDIR=../../data/output
RESDIR=../../data/experiments
{ ./pfpc 20 8 2048 < $DATADIR/astro_mhd_f64     > $OUTDIR/astro_mhd_f64.pfpc ; }    2>> $RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 2048 < $DATADIR/astro_pt_f64      > $OUTDIR/astro_pt_f64.pfpc ; }     2>> $RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 2048 < $DATADIR/citytemp_f32      > $OUTDIR/citytemp_f32.pfpc ; }     2>> $RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 2048 < $DATADIR/h3d_temp          > $OUTDIR/h3d_temp.pfpc ; }         2>> $RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 2048 < $DATADIR/hdr_night         > $OUTDIR/hdr_night.pfpc ; }        2>> $RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 2048 < $DATADIR/miranda3d         > $OUTDIR/miranda3d.pfpc ; }        2>> $RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 1024 < $DATADIR/msg_bt            > $OUTDIR/msg_bt.pfpc ; }           2>> $RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 1024 < $DATADIR/num_brain         > $OUTDIR/num_brain.pfpc ; }        2>> $RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 1024 < $DATADIR/num_control       > $OUTDIR/num_control.pfpc ; }      2>> $RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 2048 < $DATADIR/rsim_f32          > $OUTDIR/rsim_f32.pfpc ; }         2>> $RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 2048 < $DATADIR/spitzer_irac      > $OUTDIR/spitzer_irac.pfpc ; }     2>> $RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 2048 < $DATADIR/tpch_lineitem_f32 > $OUTDIR/tpch_lineitem_f32.pfpc ; } 2>>$RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 2048 < $DATADIR/tpch_order_f64    > $OUTDIR/tpch_order_f64.pfpc ; }   2>> $RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 2048 < $DATADIR/ts_gas            > $OUTDIR/ts_gas.pfpc ; }           2>> $RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 2048 < $DATADIR/turbulence        > $OUTDIR/turbulence.pfpc ; }       2>> $RESDIR/res_pfpc_comp.txt
{ ./pfpc 20 8 2048 < $DATADIR/wave_f32          > $OUTDIR/wave_f32.pfpc ; }         2>> $RESDIR/res_pfpc_comp.txt
# ================
# test decompress
# ================
{ ./pfpc < $OUTDIR/astro_mhd_f64.pfpc      > $DATADIR/astro_mhd_f64.pfpcout ; }     2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/astro_pt_f64.pfpc       > $DATADIR/astro_pt_f64.pfpcout ; }      2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/citytemp_f32.pfpc       > $DATADIR/citytemp_f32.pfpcout ; }      2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/h3d_temp.pfpc           > $DATADIR/h3d_temp.pfpcout ; }          2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/hdr_night.pfpc          > $DATADIR/hdr_night.pfpcout ; }         2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/miranda3d.pfpc          > $DATADIR/miranda3d.pfpcout ; }         2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/msg_bt.pfpc             > $DATADIR/msg_bt.pfpcout ; }            2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/num_brain.pfpc          > $DATADIR/num_brain.pfpcout ; }         2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/num_control.pfpc        > $DATADIR/num_control.pfpcout ; }       2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/rsim_f32.pfpc           > $DATADIR/rsim_f32.pfpcout ; }          2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/spitzer_irac.pfpc       > $DATADIR/spitzer_irac.pfpcout ; }      2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/tpch_lineitem_f32.pfpc  > $DATADIR/tpch_lineitem_f32.pfpcout ; } 2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/tpch_order_f64.pfpc     > $DATADIR/tpch_order_f64.pfpcout ; }    2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/ts_gas.pfpc             > $DATADIR/ts_gas.pfpcout ; }            2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/turbulence.pfpc         > $DATADIR/turbulence.pfpcout ; }        2>> $RESDIR/res_pfpc_decomp.txt
{ ./pfpc < $OUTDIR/wave_f32.pfpc           > $DATADIR/wave_f32.pfpcout ; }          2>> $RESDIR/res_pfpc_decomp.txt
rm $DATADIR/*.pfpcout $OUTDIR/*.pfpc