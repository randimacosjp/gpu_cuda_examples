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
    dim3 grid(2,4);	//8 blocks in 2-by-4 grid
    dim3 block(3,2);	//6 threads in 3-by-2 block

    //call the cuda kernel
    cudaSayHello<<<grid,block>>>();    

    //Synchronize the cuda device
    cudaDeviceSynchronize();

    //end of the program
    return 0;
}