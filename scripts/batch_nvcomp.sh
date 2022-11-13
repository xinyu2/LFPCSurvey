# ============== #
# test nvcomp #
# ============== #
EXECDIR=/home/cc/code/nvbench/bin
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
# ================ #
# test MPC #
# ================ #
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/astro_mhd_f64 >> $RESDIR/res_nvlz4.txt
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/astro_pt_f64  >> $RESDIR/res_nvlz4.txt
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/citytemp_f32  >> $RESDIR/res_nvlz4.txt
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/h3d_temp      >> $RESDIR/res_nvlz4.txt
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/hdr_night     >> $RESDIR/res_nvlz4.txt
echo "miranda3d diverge"  >> $RESDIR/res_nvlz4.txt
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/msg_bt        >> $RESDIR/res_nvlz4.txt
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/num_brain     >> $RESDIR/res_nvlz4.txt
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/num_control   >> $RESDIR/res_nvlz4.txt
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/rsim_f32      >> $RESDIR/res_nvlz4.txt
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/spitzer_irac  >> $RESDIR/res_nvlz4.txt
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/tpch_lineitem_f32  >> $RESDIR/res_nvlz4.txt
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/tpch_order_f64  >> $RESDIR/res_nvlz4.txt
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/ts_gas        >> $RESDIR/res_nvlz4.txt
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/turbulence    >> $RESDIR/res_nvlz4.txt
$EXECDIR/benchmark_lz4_chunked -f $DATADIR/wave_f32      >> $RESDIR/res_nvlz4.txt

$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/astro_mhd_f64 >> $RESDIR/res_nvbitcomp.txt
$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/astro_pt_f64  >> $RESDIR/res_nvbitcomp.txt
$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/citytemp_f32  >> $RESDIR/res_nvbitcomp.txt
$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/h3d_temp      >> $RESDIR/res_nvbitcomp.txt
$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/hdr_night     >> $RESDIR/res_nvbitcomp.txt
echo "miranda3d diverge"  >> $RESDIR/res_nvbitcomp.txt
$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/msg_bt        >> $RESDIR/res_nvbitcomp.txt
$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/num_brain     >> $RESDIR/res_nvbitcomp.txt
$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/num_control   >> $RESDIR/res_nvbitcomp.txt
$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/rsim_f32      >> $RESDIR/res_nvbitcomp.txt
$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/spitzer_irac  >> $RESDIR/res_nvbitcomp.txt
$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/tpch_lineitem_f32  >> $RESDIR/res_nvbitcomp.txt
$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/tpch_order_f64     >> $RESDIR/res_nvbitcomp.txt
$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/ts_gas        >> $RESDIR/res_nvbitcomp.txt
$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/turbulence    >> $RESDIR/res_nvbitcomp.txt
$EXECDIR/benchmark_bitcomp_chunked -f $DATADIR/wave_f32      >> $RESDIR/res_nvbitcomp.txt
