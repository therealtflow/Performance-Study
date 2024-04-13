//
//  main.c
//  Excerise 3
//
//  Created by Tyler Flowers on 3/13/24.
//

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <cblas.h>
#include <time.h>
void generate_random_matrix(int size, float *matrix)
{
for (int i = 0; i < size * size; i++)
{
matrix[i] = (float) rand() / (float) RAND_MAX;
}
}
void matrix_multiply(int m, int n, int k, float *A, float *B, float *C)
{
cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, m, n, k, 1.0, A, k, B,
n, 0.0, C, n);
}
double get_time_diff(struct timespec start, struct timespec end)
{
return (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) /
1000000000.0;
}
int main(int argc, char *argv[])
{
struct timespec start_full, end_full, start_mm, end_mm;
clock_gettime(CLOCK_MONOTONIC, &start_full);
if (argc != 2)
{
fprintf(stderr, "Usage: %s <matrix_size>\n", argv[0]);
return EXIT_FAILURE;
}
int matrix_size = atoi(argv[1]);
float *A = (float *)malloc(matrix_size * matrix_size * sizeof(float));
float *B = (float *)malloc(matrix_size * matrix_size * sizeof(float));
float *C = (float *)malloc(matrix_size * matrix_size * sizeof(float));
generate_random_matrix(matrix_size, A);
generate_random_matrix(matrix_size, B);
clock_gettime(CLOCK_MONOTONIC, &start_mm);
matrix_multiply(matrix_size, matrix_size, matrix_size, A, B, C);
clock_gettime(CLOCK_MONOTONIC, &end_mm);
free(A);
free(B);
free(C);
clock_gettime(CLOCK_MONOTONIC, &end_full);
char *num_threads_str = getenv("OMP_NUM_THREADS");
int num_threads = num_threads_str ? atoi(num_threads_str) : 1;
printf("Problem_Size,Threads,MMul_Time,Total_time\n");
printf("%d,%d,%.9f,%.9f\n", matrix_size, num_threads,
get_time_diff(start_mm, end_mm), get_time_diff(start_full, end_full));
return 0;
}
