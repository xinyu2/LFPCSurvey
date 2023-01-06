# ============== #
# test ndzip #
# ============== #
EXECDIR=/home/cc/code
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
# ================ #
# test ndzip-cpu #
# ================ #

# ================ #
# test 3-d #
# ================ #
$EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/astro_mhd_f64 -o $DATADIR/astro_mhd_f64.ndzip2 -t double -n 130 514 1026
echo "test ndzip-gpu decompress"
$EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/astro_mhd_f64.ndzout2 -i $DATADIR/astro_mhd_f64.ndzip2 -t double -n 130 514 1026
rm $DATADIR/astro_mhd_f64.ndzip2 astro_mhd_f64.ndzout2

# ================ #
# test 1-d #
# ================ #
$EXECDIR/ndzip/build/compress -e cuda -i $DATADIR/astro_mhd_f64 -o $DATADIR/astro_mhd_f64.ndzip2 -t double -n 68557320
echo "test ndzip-gpu decompress"
$EXECDIR/ndzip/build/compress -d -e cuda -o $DATADIR/astro_mhd_f64.ndzout2 -i $DATADIR/astro_mhd_f64.ndzip2 -t double -n 68557320
rm $DATADIR/astro_mhd_f64.ndzip2 astro_mhd_f64.ndzout2

