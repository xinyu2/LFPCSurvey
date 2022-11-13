#!/bin/bash
# ============== #
# test MPC #
# ============== #
EXEDIR=/home/cc/code
DATADIR=/home/cc/data
RESDIR=/home/cc/data/experiments
# ================ #
# test MPC #
# ================ #
cd $EXEDIR/influxdb
git checkout chimp128
go clean -testcache
go test  -test.timeout 0 -run TestCompress_XC2 -v github.com/influxdata/influxdb/v2/tsdb/engine/tsm1 >> $RESDIR/res_chimp.txt

git checkout gorilla
go clean -testcache
go test  -test.timeout 0 -run TestCompress_XC2 -v github.com/influxdata/influxdb/v2/tsdb/engine/tsm1 >> $RESDIR/res_gorilla.txt

