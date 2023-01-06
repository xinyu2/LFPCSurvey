# ============== #
# test MPC #
# ============== #
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
# ================ #
# test MPC #
# ================ #
../MPC/MPC_double $DATADIR/astro_mhd_f64 3 >> $RESDIR/res_mpc.txt
../MPC/MPC_double $DATADIR/astro_pt_f64  3 >> $RESDIR/res_mpc.txt
../MPC/MPC_float  $DATADIR/citytemp_f32  1 >> $RESDIR/res_mpc.txt
../MPC/MPC_float $DATADIR/h3d_temp      3 >> $RESDIR/res_mpc.txt
../MPC/MPC_float $DATADIR/hdr_night     1 >> $RESDIR/res_mpc.txt
../MPC/MPC_float  $DATADIR/miranda3d     3 >> $RESDIR/res_mpc.txt
../MPC/MPC_double $DATADIR/msg_bt        1 >> $RESDIR/res_mpc.txt
../MPC/MPC_double $DATADIR/num_brain     1 >> $RESDIR/res_mpc.txt
../MPC/MPC_double $DATADIR/num_control   1 >> $RESDIR/res_mpc.txt
../MPC/MPC_float  $DATADIR/rsim_f32      2 >> $RESDIR/res_mpc.txt
../MPC/MPC_float  $DATADIR/spitzer_irac  1 >> $RESDIR/res_mpc.txt
../MPC/MPC_float  $DATADIR/tpch_lineitem_f32 1 >> $RESDIR/res_mpc.txt
../MPC/MPC_double $DATADIR/tpch_order_f64 1 >> $RESDIR/res_mpc.txt
../MPC/MPC_float  $DATADIR/ts_gas        1 >> $RESDIR/res_mpc.txt
../MPC/MPC_float  $DATADIR/turbulence    3 >> $RESDIR/res_mpc.txt
../MPC/MPC_float  $DATADIR/wave_f32      3 >> $RESDIR/res_mpc.txt
