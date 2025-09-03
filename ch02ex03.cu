#include<stdio.h>
#include<math.h>
#include<cuda_runtime.h>

int main()
{
    int deviceCount;

    cudaError_t err1 = cudaGetDeviceCount(&deviceCount);

    if(err1 != cudaSuccess)
        printf("CUDA Error : %s", cudaGetErrorString(err1));
    else
    {
        printf("\nCUDA enabled device count : %d", deviceCount);
        size_t totalGlobalMemory, freeGlobalMemory;
        cudaError_t err2 = cudaMemGetInfo(&freeGlobalMemory,&totalGlobalMemory);
        if(err2 != cudaSuccess)
            printf("CUDA Error : %s", cudaGetErrorString(err2));
        else
            printf("\nFree / Total = %.2f MB/ %.2f MB (%.2f %%)", freeGlobalMemory/pow(2,20),totalGlobalMemory/pow(2,20), float(100*freeGlobalMemory)/totalGlobalMemory);
    }
    printf("\n");
    return 0;
}