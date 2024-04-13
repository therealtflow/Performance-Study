#!/bin/sh
#!/bin/bash

#SBATCH --job-name=tflojob
#SBATCH --partition=Centaurus
#SBATCH --time=00:20:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=16

OMP_NUM_THREADS=1 ./matrix_multiplication 1024
OMP_NUM_THREADS=1 ./matrix_multiplication 2048
OMP_NUM_THREADS=1 ./matrix_multiplication 3072
OMP_NUM_THREADS=1 ./matrix_multiplication 4096
OMP_NUM_THREADS=1 ./matrix_multiplication 5120
OMP_NUM_THREADS=1 ./matrix_multiplication 6144
OMP_NUM_THREADS=1 ./matrix_multiplication 7168
OMP_NUM_THREADS=1 ./matrix_multiplication 8192

OMP_NUM_THREADS=2 ./matrix_multiplication 1024
OMP_NUM_THREADS=2 ./matrix_multiplication 2048
OMP_NUM_THREADS=2 ./matrix_multiplication 3072
OMP_NUM_THREADS=2 ./matrix_multiplication 4096
OMP_NUM_THREADS=2 ./matrix_multiplication 5120
OMP_NUM_THREADS=2 ./matrix_multiplication 6144
OMP_NUM_THREADS=2 ./matrix_multiplication 7168
OMP_NUM_THREADS=2 ./matrix_multiplication 8192

OMP_NUM_THREADS=4 ./matrix_multiplication 1024
OMP_NUM_THREADS=4 ./matrix_multiplication 2048
OMP_NUM_THREADS=4 ./matrix_multiplication 3072
OMP_NUM_THREADS=4 ./matrix_multiplication 4096
OMP_NUM_THREADS=4 ./matrix_multiplication 5120
OMP_NUM_THREADS=4 ./matrix_multiplication 6144
OMP_NUM_THREADS=4 ./matrix_multiplication 7168
OMP_NUM_THREADS=4 ./matrix_multiplication 8192

OMP_NUM_THREADS=8 ./matrix_multiplication 1024
OMP_NUM_THREADS=8 ./matrix_multiplication 2048
OMP_NUM_THREADS=8 ./matrix_multiplication 3072
OMP_NUM_THREADS=8 ./matrix_multiplication 4096
OMP_NUM_THREADS=8 ./matrix_multiplication 5120
OMP_NUM_THREADS=8 ./matrix_multiplication 6144
OMP_NUM_THREADS=8 ./matrix_multiplication 7168
OMP_NUM_THREADS=8 ./matrix_multiplication 8192

OMP_NUM_THREADS=16 ./matrix_multiplication 1024
OMP_NUM_THREADS=16 ./matrix_multiplication 2048
OMP_NUM_THREADS=16 ./matrix_multiplication 3072
OMP_NUM_THREADS=16 ./matrix_multiplication 4096
OMP_NUM_THREADS=16 ./matrix_multiplication 5120
OMP_NUM_THREADS=16 ./matrix_multiplication 6144
OMP_NUM_THREADS=16 ./matrix_multiplication 7168
OMP_NUM_THREADS=16 ./matrix_multiplication 8192
