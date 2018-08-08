CUDA_PATH="/Developer/NVIDIA/CUDA-9.1"
if [[ -d $CUDA_PATH ]]; then
    export CUDA_PATH="/Developer/NVIDIA/CUDA-9.1"
    export DYLD_LIBRARY_PATH="${CUDA_PATH}/lib:${DYLD_LIBRARY_PATH}"
    export PATH="${CUDA_PATH}/bin:${PATH}"
    export CPATH="${CUDA_PATH}/include/"
    export CGO_LDFLAGS="/usr/local/cuda/lib/libcuda.dylib ${CUDA_PATH}/lib/libcudart.dylib ${CUDA_PATH}/lib/libcublas.dylib ${CUDA_PATH}/lib/libcurand.dylib"
fi
