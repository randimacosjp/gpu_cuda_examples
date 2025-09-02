#include<stdio.h>

__global__ void cudaSayHello()
{
    //get information about blocks and threads
    int tIDx = threadIdx.x;
    int tIDy = threadIdx.y;
	int tIDz = threadIdx.z;
    int blockX = blockIdx.x;
    int blockY = blockIdx.y;
	int blockZ = blockIdx.z;
    int blockDimX= blockDim.x;
    int blockDimY = blockDim.y;
	int blockDimZ = blockDim.z;
	
    int gridDimX = gridDim.x;
	int gridDimY = gridDim.y;
	int gridDimZ = gridDim.z;
	
	printf("Thread (%d,%d,%d) in block (%d,%d,%d)\n", tIDx, tIDy, tIDz, blockX, blockY, blockZ);

}
int main()
{
    //execute by CPU
    printf("This is from CPU\n");

    //Create 3D blocks in 3D grid
    dim3 grid(2,2,2);	//8 blocks in 2x2x2 cubical grid
    dim3 block(2,2,2);	//8 threads in 2x2x2 cubical block

    //call the cuda kernel
    cudaSayHello<<<grid,block>>>();    

    //Synchronize the cuda device
    cudaDeviceSynchronize();

    //end of the program
    return 0;
}