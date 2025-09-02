#include<stdio.h>
#include<cuda_runtime.h>

int main()
{
    int deviceCount;

    cudaError_t err = cudaGetDeviceCount(&deviceCount);

    if(err != cudaSuccess)
        printf("CUDA Error : %s", cudaGetErrorString(err));
    else
    {
        //Device property structure
        cudaDeviceProp devProp;

        //Go through each device
        for(int devNo = 0; devNo<deviceCount; devNo++)
        {
            //extract device properties
            cudaError_t err2 = cudaGetDeviceProperties(&devProp,devNo);

            if(err2 != cudaSuccess)
            {
                return -1;
            }
            else
            {
                printf("\nDevice ID : %d", devNo);
                printf("\nName : %s", devProp.name);
                printf("\nGlobal Mem. size : %d Bytes", devProp.totalGlobalMem);
                printf("\nShared Mem. per block : %d Bytes", devProp.sharedMemPerBlock);
                printf("\nConst. Mem. size : %d Bytes", devProp.totalConstMem);
                printf("\nMax. Threads per block : %d", devProp.maxThreadsPerBlock);
                printf("\nBlock dimension : X %d, Y %d, Z %d", devProp.maxThreadsDim[0],devProp.maxThreadsDim[1],devProp.maxThreadsDim[2]);
                printf("\nGrid dimension : X %d, Y %d, Z %d", devProp.maxGridSize[0],devProp.maxGridSize[1],devProp.maxGridSize[2]);
                printf("\nWarp size %d threads", devProp.warpSize);
                printf("\nMulti Processor Count : %d", devProp.multiProcessorCount);

            }
        }

    }
        
    printf("\n");

    return 0;
}