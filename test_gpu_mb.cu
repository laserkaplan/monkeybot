#include <iostream>

#include "monkeybot.cuh"

#define N 13

void seta(char *a) {
    a[0] = 'H';
    a[1] = 'e';
    a[2] = 'l';
    a[3] = 'l';
    a[4] = 'o';
    a[5] = ' ';
    a[6] = 'W';
    a[7] = 'o';
    a[8] = 'r';
    a[9] = 'l';
    a[10] = 'd';
    a[11] = '!';
    a[12] = '\0';
}

int main(void) {
    // host variables
    char *a, *b;
    
    // device copies
    char *d_a, *d_b;
    
    // define size
    int size = N * sizeof(char);

    // allocate memory on device
    cudaMalloc((void **)&d_a, size);
    cudaMalloc((void **)&d_b, size);

    // initialize host variables
    a = (char *)malloc(size);
    seta(a);
    b = (char *)malloc(size);

    // copy inputs to device
    cudaMemcpy(d_a, a, size, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, b, size, cudaMemcpyHostToDevice);

    // execute device method
    mb::copychar<<<1,N>>>(d_a, d_b);

    // copy results back to host
    cudaMemcpy(a, d_a, size, cudaMemcpyDeviceToHost);
    cudaMemcpy(b, d_b, size, cudaMemcpyDeviceToHost);

    // print result
    std::cout << a << std::endl;
    std::cout << b << std::endl;

    // free memory
    free(a);
    free(b);
    cudaFree(d_a);
    cudaFree(d_b);

    return 0;
}
