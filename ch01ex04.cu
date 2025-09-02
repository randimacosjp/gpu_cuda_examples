#include<stdio.h>

__global__ void cudaSayHello()
{
    //obtain the global thread ID
    int globalThreadID = blockIdx.x*blockDim.x + threadIdx.x;

    //print the block ID and the thread local ID
    printf("Hello World !, by CUDA - bID = %d,  tID = %d, gtID = %d\n", blockIdx.x, threadIdx.x, globalThreadID);

}
int main()
{
    //execute by CPU
    printf("This is from CPU\n");

    //call the cuda kernel
    cudaSayHello<<<2,3>>>();    //2 block, 3 threads

    //Synchronize the cuda device
    cudaDeviceSynchronize();

    //end of the program
    return 0;
}