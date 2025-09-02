#include<stdio.h>

__global__ void cudaSayHello()
{
    //get information about blocks and threads
    int tIDx = threadIdx.x;
    int tIDy = threadIdx.y;
    int blockX = blockIdx.x;
    int blockY = blockIdx.y;
    int blockDimX= blockDim.x;
    int blockDimY = blockDim.y;
    int gridDimX = gridDim.x;

    int gtID = (blockY*blockDimY + tIDy)*(gridDimX*blockDimX) + blockX*blockDimX + tIDx;

    printf("Thread - ID<%d,%d> Block<%d,%d>, gtID=%d\n",tIDx,tIDy,blockX,blockY, gtID);

}
int main()
{
    //execute by CPU
    printf("This is from CPU\n");

    //Create 2D grid with 1D block
    dim3 grid(2,4);

    //call the cuda kernel
    //8 blocks are arranged in a 2-by-4 grid
    //1 thread per block
    cudaSayHello<<<grid,1>>>();    

    //Synchronize the cuda device
    cudaDeviceSynchronize();

    //end of the program
    return 0;
}