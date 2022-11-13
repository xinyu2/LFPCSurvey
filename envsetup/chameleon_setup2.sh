mkdir code data software
cd software

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.7
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 10
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.7 20
update-alternatives --list python
update-alternatives --config python
# ============================== 
# install rust nightly & 1.53.0
# ============================== 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.bashrc
rustup install 1.53.0

# ============================== 
# install golang 1.18
# ============================== 
wget https://go.dev/dl/go1.18.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.19.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# ============================== 
# install gcc 9.4.0
# ==============================
sudo add-apt-repository ppa:ubuntu-toolchain-r/test 
sudo apt install gcc-9 g++-9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7 --slave /usr/bin/gcov gcov /usr/bin/gcov-7
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9 --slave /usr/bin/gcov gcov /usr/bin/gcov-9
# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80 --slave /usr/bin/g++ g++ /usr/bin/g++-8 --slave /usr/bin/gcov gcov /usr/bin/gcov-8
# ============================== 
# install clang
# ============================== 
sudo apt install make clang pkg-config libssl-dev
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 10

# ============================== 
# install boost_1.66.0
# ============================== 
wget https://boostorg.jfrog.io/artifactory/main/release/1.66.0/source/boost_1_66_0.tar.gz
tar -xzf boost_1_66_0.tar.gz
cd boost_1_66_0/
sudo ./bootstrap.sh --prefix=/usr/local
sudo ./b2 install
# ============================== 
# install python packages
# ============================== 
virtualenv --python="/usr/bin/python3.7" env4shuffle
sudo apt-get install python3.7-dev
pip install numpy

sudo apt-get install -y zstd
sudo snap install lz4
sudo apt-get install zlib1g-dev
# # ============================== 
# # get data
# # ============================== 
# cd ~/data
# # https://klacansky.com/open-scivis-datasets/
# # ============================== 
# # test BUFF
# # ============================== 
# rustup toolchain install nightly
# rustup default nightly
# cargo +nightly run --release  --package buff --bin comp_profiler ./data/randomwalkdatasample1k-1k buff-simd 10000 1.1509


# # ============================== 
# # test CHIMP
# # ============================== 
# git clone https://github.com/panagiotisl/influxdb.git
# cd influxdb/
# rustup default 1.53.0
# make
# git checkout chimp128
# go test  -test.timeout 0 -run TestCompress_Basel -v github.com/influxdata/influxdb/v2/tsdb/engine/tsm1

# # ============================== 
# # test nvcomp
# # ============================== 
# wget https://developer.download.nvidia.com/compute/nvcomp/2.3.3/local_installers/nvcomp_install_CUDA_11.x.tgz
# tar -xzvf nvcomp_install_CUDA_11.x.tgz -C nvbench

# https://github.com/NVIDIA/nvcomp.git
# cd nvcomp/benchmarks
# python text_to_binary.py ExampleFloatData.csv 2 float ~/data/fp1.bin

# cd nvbench/bin

# ============================== 
# test ndzip
# ============================== 
# cmake -B build -DCMAKE_CUDA_ARCHITECTURES=75 -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-march=native" \
# 	-DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
# 	-DCMAKE_CUDA_HOST_COMPILER=/usr/bin/g++ -DBOOST_ROOT=/usr/local/include \
# 	-DNDZIP_BUILD_BENCHMARK=YES
# cmake --build build -j
# wget https://open-scivis-datasets.sci.utah.edu/tacc_turbulence/tacc_turbulence_256x256x256_float32.raw
# mv tacc_turbulence_256x256x256_float32.raw turbulence.f32
# build/compress -n 256 256 256 -i turbulence.f32 -o turb-ndz.out

# # ============================== 
# # test fpzip
# # ============================== 
# git clone https://github.com/LLNL/fpzip.git
# cd fpzip
# mkdir build
# cd build
# cmake ..
# cmake --build . --config Release

# wget http://www.cs.txstate.edu/~burtscher/research/FPC/fpc.c
# gcc -O3 fpc.c -o fpc

# wget https://userweb.cs.txstate.edu/~burtscher/research/pFPC/pFPC.c
# gcc -O3 -pthread -std=c99 pFPC.c -o pfpc

# wget https://userweb.cs.txstate.edu/~burtscher/research/GFC/GFC_22.cu
# nvcc -O3 -arch=sm_75 GFC_22.cu -o GFC

# wget https://userweb.cs.txstate.edu/~burtscher/research/MPC/MPC_float_12.cu
# wget https://userweb.cs.txstate.edu/~burtscher/research/MPC/MPC_double_12.cu
# nvcc -O3 -arch=sm_35 MPC_float_12.cu -o MPC_float
# nvcc -O3 -arch=sm_35 MPC_double_12.cu -o MPC_double

# wget https://userweb.cs.txstate.edu/~burtscher/research/SPDPcompressor/SPDP_11.c
# gcc -O3 SPDP_11.c -o spdp

# ============================== 
# test dzip
# ==============================
# virtualenv --python="/usr/bin/python3.7" env4dzip
# sudo apt install libomp-dev
# wget http://www.cs.txstate.edu/~burtscher/research/datasets/FPdouble/obs_spitzer.trace.fpc