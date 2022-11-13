DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
../MPC/MPC_double $DATADIR/astro_mhd_f64.mpc >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_double $DATADIR/astro_pt_f64.mpc  >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_float  $DATADIR/citytemp_f32.mpc  >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_float  $DATADIR/h3d_temp.mpc      >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_float  $DATADIR/hdr_night.mpc     >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_float  $DATADIR/miranda3d.mpc     >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_double $DATADIR/msg_bt.mpc        >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_double $DATADIR/num_brain.mpc     >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_double $DATADIR/num_control.mpc   >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_float  $DATADIR/rsim_f32.mpc      >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_float  $DATADIR/spitzer_irac.mpc  >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_float  $DATADIR/tpch_lineitem_f32.mpc  >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_double  $DATADIR/tpch_order_f64.mpc    >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_float  $DATADIR/ts_gas.mpc        >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_float  $DATADIR/turbulence.mpc    >> $RESDIR/res_mpc_decompress.txt
../MPC/MPC_float  $DATADIR/wave_f32.mpc      >> $RESDIR/res_mpc_decompress.txt
