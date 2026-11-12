
#include <cuda_runtime.h>
#include <iostream>

__global__ void add(int* a, int* b, int* result) {
    int i = threadIdx.x;
    result[i] = a[i] + b[i];
}

int main() {
    int* a, * b, * result;
    const int n = 5;
    const size_t bytes = n * sizeof(int);

    if (cudaMallocManaged(&a, bytes) != cudaSuccess ||
        cudaMallocManaged(&b, bytes) != cudaSuccess ||
        cudaMallocManaged(&result, bytes) != cudaSuccess) {
        std::cerr << "CUDA memory allocation failed\n";
        return 1;
    }

    for (int i = 0; i < n; i++) {
        a[i] = i;
        b[i] = i * 10;
    }

    add << <1, n >> > (a, b, result);

    cudaError_t status = cudaDeviceSynchronize();
    if (status != cudaSuccess) {
        std::cerr << cudaGetErrorString(status) << '\n';
        return 1;
    }

    for (int i = 0; i < n; i++)
        std::cout << result[i] << " ";

    std::cout << "\nCUDA GPU test passed\n";

    cudaFree(a);
    cudaFree(b);
    cudaFree(result);
    return 0;
}
