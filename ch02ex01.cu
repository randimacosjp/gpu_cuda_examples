#include<stdio.h>
#include<cuda_runtime.h>

int main()
{
    int deviceCount;

    cudaError_t err = cudaGetDeviceCount(&deviceCount);

    if(err != cudaSuccess)
        printf("CUDA Error : %s", cudaGetErrorString(err));
    else
        printf("CUDA enabled device count : %d", deviceCount);

    return 0;
}