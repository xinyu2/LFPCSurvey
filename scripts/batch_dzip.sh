# ============== #
# test dzip #
# ============== #
MODELDIR=/home/cc/code/Dzip-torch/Models
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
# ================ #
# test ndzip-cpu #
# ================ #
# bash compress.sh $DATADIR/msg_bt $DATADIR/msg_bt.dzip bs $MODELDIR/msg_bt.trace.bootstrap>> $RESDIR/res_dzip_bs.txt
# bash decompress.sh $DATADIR/msg_bt.dzip $DATADIR/msg_bt bs $MODELDIR/msg_bt.trace.bootstrap>> $RESDIR/res_dunzip_bs.txt

# bash compress.sh $DATADIR/num_control $DATADIR/num_control.dzip bs $MODELDIR/num_control.trace.bootstrap>> $RESDIR/res_dzip_bs.txt
# bash decompress.sh $DATADIR/num_control.dzip $DATADIR/num_control_dunzip bs $MODELDIR/num_control.trace.bootstrap>> $RESDIR/res_dunzip_bs.txt

# bash compress.sh $DATADIR/spitzer_irac $DATADIR/spitzer_irac.dzip bs $MODELDIR/obs_spitzer.trace.bootstrap>> $RESDIR/res_dzip_bs.txt
# bash decompress.sh $DATADIR/spitzer_irac.dzip $DATADIR/spitzer_irac bs $MODELDIR/obs_spitzer.trace.bootstrap>> $RESDIR/res_dunzip_bs.txt

# { $EXECDIR/ndzip/build/compress -i $DATADIR/num_control -o $DATADIR/num_control.ndzip -t double -n 19938093 ; } 2>> $RESDIR/res_ndzip_cpu.txt
# { $EXECDIR/ndzip/build/compress -i $DATADIR/msg_bt -o $DATADIR/msg_bt.ndzip -t double -n 33298679 ; } 2>> $RESDIR/res_ndzip_cpu.txt
# { $EXECDIR/ndzip/build/compress -i $DATADIR/hdr_night -o $DATADIR/hdr_night.ndzip -t double -n 3463675 ; } 2>> $RESDIR/res_ndzip_cpu.txt
# { $EXECDIR/ndzip/build/compress -i $DATADIR/h3d_temp -o $DATADIR/h3d_temp.ndzip -t float -n 500 500 100 ; } 2>> $RESDIR/res_ndzip_cpu.txt
# { $EXECDIR/ndzip/build/compress -i $DATADIR/ts_gas -o $DATADIR/ts_gas.ndzip -t float -n 76863200; } 2>> $RESDIR/res_ndzip_cpu.txt
# { $EXECDIR/ndzip/build/compress -i $DATADIR/rsim_f32 -o $DATADIR/rsim_f32.ndzip -t float -n 2048 11509 ; } 2>> $RESDIR/res_ndzip_cpu.txt
# { $EXECDIR/ndzip/build/compress -i $DATADIR/spitzer_irac -o $DATADIR/spitzer_irac.ndzip -t float -n 41249520 ; } 2>> $RESDIR/res_ndzip_cpu.txt
# { $EXECDIR/ndzip/build/compress -i $DATADIR/astro_mhd_f64 -o $DATADIR/astro_mhd_f64.ndzip -t double -n 68557320 ; } 2>> $RESDIR/res_ndzip_cpu.txt
# { $EXECDIR/ndzip/build/compress -i $DATADIR/astro_pt_f64 -o $DATADIR/astro_pt_f64.ndzip -t double -n 83886080 ; } 2>> $RESDIR/res_ndzip_cpu.txt
# { $EXECDIR/ndzip/build/compress -i $DATADIR/turbulence -o $DATADIR/turbulence.ndzip -t float -n 16777216 ; } 2>> $RESDIR/res_ndzip_cpu.txt
# { $EXECDIR/ndzip/build/compress -i $DATADIR/wave_f32 -o $DATADIR/wave_f32.ndzip -t float -n 134217728 ; } 2>> $RESDIR/res_ndzip_cpu.txt
# { $EXECDIR/ndzip/build/compress -i $DATADIR/citytemp_f32 -o $DATADIR/citytemp_f32.ndzip -t float -n 2906326 ; } 2>> $RESDIR/res_ndzip_cpu.txt
# { $EXECDIR/ndzip/build/compress -i $DATADIR/miranda3d -o $DATADIR/miranda3d.ndzip -t float -n 1024 1024 1024 ; } 2>> $RESDIR/res_ndzip_cpu.txt

