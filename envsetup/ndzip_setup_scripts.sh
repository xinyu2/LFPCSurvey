whichgcc=$(which gcc)
whichgpp=$(which g++)
boostdir=/data/lab/tao/xinyu/software/boost
whichnvcc=$(which nvcc)
cmake -B build -DCMAKE_CUDA_ARCHITECTURES=75 \
	-DCMAKE_BUILD_TYPE=Release \
	-DZIP_WITH_MT=YES \
	-DNDZIP_WITH_CUDA=YES \
	-DCMAKE_CXX_FLAGS="-march=native" \
	-DCMAKE_C_COMPILER=$whichgcc \
	-DCMAKE_CXX_COMPILER=$whichgpp \
	-DCMAKE_CUDA_COMPILER=$whichnvcc \
	-DBoost_INCLUDE_DIR=$boostdir/include \
	-DBoost_LIBRARY_DIRS=$boostdir/lib 

cmake --build build -j	

