#include<stdio.h>

__global__ void cudaSayHello()
{
    printf("Hello World !, by CUDA\n");
}
int main()
{
    //execute by CPU
    printf("This is from CPU\n");

    //call the cuda kernel
    cudaSayHello<<<1,1>>>();    //1 block, 1 threads

    //Synchronize the cuda device
    cudaDeviceSynchronize();

    //end of the program
    return 0;
}