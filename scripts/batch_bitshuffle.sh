#!/bin/bash
EXECDIR=/home/cc/code/bitshuffle/tests
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
# ================ #
# test fpzip #
# ================ #
source /home/cc/env4shuffle/bin/activate
cd $EXECDIR
for j in {0..14} 
do
	if [ $j != 5 ];then
		echo "j= "$j
		python f_hdrnight.py >> $RESDIR/res_bitshuffle.txt
	fi
	sed -i 's/K = '$j'/K = '$((j+1))'/' f_hdrnight.py
done
python f_hdrnight.py >> $RESDIR/res_bitshuffle.txt	
sed -i 's/K = 15/K = 0/' f_hdrnight.py
