#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>

#include "cuda.h"
#include "cricket-cuda.h"

#define N 32
#define ITERATIONS 1024*128*8
const int blocksize = 32;

#ifndef RANDOM_INIT
uint16_t A[2048]={
    15183, 5909, 39324, 16294, 25624, 63281, 1133, 9314, 52216, 12031, 2445, 21597, 13509,
    26926, 26717, 17449, 43697, 9177, 38203, 37564, 12105, 14935, 31848, 46153, 29089, 43698,
    2093, 2036, 22994, 54249, 10114, 26076, 29521, 5760, 60726, 481, 13098, 20533, 39666, 63475,
    59335, 34753, 41397, 11495, 216, 48566, 6370, 64142, 44361, 38081, 47691, 46846, 53978, 40200,
    2994, 31327, 14240, 58221, 37335, 54492, 4388, 47882, 46630, 46651, 50856, 65006, 57758,
    28265, 48159, 8773, 41068, 47946, 40645, 45410, 44812, 49996, 6353, 59960, 13295, 12902,
    60271, 31627, 58688, 33157, 62821, 26929, 16495, 28125, 49972, 4049, 42366, 12913, 20851,
    36167, 48412, 32762, 61442, 30104, 58745, 30370, 39656, 28847, 1104, 47756, 64972, 14788,
    40314, 24986, 35039, 29776, 44686, 61063, 61392, 29651, 23358, 45096, 51785, 53630, 65381,
    38429, 22119, 41084, 15384, 58062, 61687, 2803, 19306, 15894, 23963, 4228, 40030, 44799,
    57733, 13633, 3207, 56859, 39745, 22223, 32941, 40016, 37053, 4394, 41151, 5985, 297, 46899,
    59539, 1071, 59056, 43778, 1232, 22054, 1973, 30570, 59027, 64007, 47870, 21367, 23153, 23063,
    37567, 63777, 30589, 17770, 14018, 20836, 31113, 56227, 21632, 2465, 26311, 45668, 3801,
    32131, 28852, 50404, 59621, 32453, 47958, 48783, 46235, 11690, 46974, 44899, 23642, 18194,
    48300, 58600, 65361, 13519, 14854, 29561, 47033, 33614, 46702, 25896, 20946, 39215, 39968,
    5455, 407, 48028, 21975, 35273, 752, 50478, 47180, 24546, 10983, 58132, 9487, 19551, 56079,
    32817, 11809, 28585, 61921, 60923, 52170, 40161, 13917, 2993, 39607, 24238, 20164, 42740,
    35327, 60084, 55522, 56381, 102, 14011, 30508, 14848, 40059, 4529, 14577, 49537, 35062,
    39239, 25073, 19342, 13198, 20734, 41256, 4979, 31010, 37847, 28389, 13125, 42169, 56888,
    25177, 45394, 49128, 49930, 35540, 3530, 17626, 51923, 35844, 34706, 10357, 62836, 59712,
    41658, 28081, 27555, 8363, 47962, 26511, 621, 36092, 45255, 28415, 47065, 23009, 41, 23252,
    6577, 7768, 53774, 15710, 23571, 23208, 16029, 38353, 46235, 20801, 62628, 57597, 47940,
    60393, 48437, 45324, 35538, 37715, 23405, 39571, 11963, 52974, 46962, 44643, 34701, 53616,
    49126, 10414, 60748, 13976, 23381, 33128, 46856, 17160, 58733, 51702, 53974, 33153, 64931,
    63063, 12170, 353, 31285, 27290, 16039, 4610, 35031, 32804, 43046, 21077, 41160, 41404,
    46383, 64999, 21282, 14339, 48134, 29212, 25461, 40380, 32234, 15385, 17193, 18081, 32617,
    30947, 46402, 37840, 15837, 7493, 34294, 5036, 36525, 30775, 25215, 37951, 50609, 59179,
    35989, 62507, 50883, 11312, 34734, 59000, 20919, 22154, 22789, 6569, 61439, 55765, 42963,
    13032, 15980, 30304, 18399, 55040, 55193, 35497, 49968, 9426, 29918, 60565, 58771, 46486,
    38943, 10257, 64896, 44407, 29964, 1774, 36450, 52110, 57630, 50499, 51032, 47414, 25971,
    2586, 44041, 8345, 20252, 33819, 41891, 34954, 21866, 54682, 28007, 18888, 63328, 62164,
    63778, 64239, 20949, 43419, 50362, 16903, 4830, 24691, 63412, 53040, 30838, 12523, 17908,
    13410, 35263, 64525, 54080, 57718, 64518, 8948, 21830, 54423, 11037, 7846, 7688, 28656, 
    37538, 31835, 7054, 5610, 55284, 10287, 2293, 53322, 38072, 50620, 22585, 21027, 53085,
    42535, 24225, 33763, 46834, 51673, 45308, 30671, 61883, 13348, 43428, 65452, 63404, 10331,
    24507, 54075, 60232, 7294, 36730, 15148, 41120, 6382, 58569, 55948, 12475, 53557, 4895, 6332, 
    38473, 23217, 48022, 9500, 42831, 61640, 57852, 32055, 12538, 54328, 9954, 60487, 48500, 
    12797, 36445, 56159, 35793, 6826, 25596, 60998, 33121, 16918, 2818, 58873, 21874, 20927, 
    26869, 54257, 64387, 63229, 20649, 44679, 2156, 9186, 2297, 30645, 61750, 60856, 31000, 14389,
    36323, 19166, 51195, 7490, 9406, 19808, 59036, 20962, 50457, 23410, 34796, 22637, 36082, 
    30042, 6614, 54420, 14212, 40594, 15937, 49918, 53268, 55399, 3142, 42426, 40973, 40818, 
    54355, 41243, 15876, 26447, 50181, 65428, 23381, 64265, 23034, 64662, 52838, 57536, 65351,
    44043, 34726, 51022, 17244, 48446, 32480, 55611, 24688, 15983, 30453, 21851, 63359, 64254,
    9968, 41105, 25144, 50572, 38938, 17879, 62789, 23767, 10146, 46858, 3809, 17367, 12017, 
    22214, 60197, 60502, 11651, 14412, 55685, 31130, 35508, 19734, 49799, 62494, 57344, 29244, 
    41122, 29880, 20294, 62980, 7491, 19584, 28483, 55937, 33446, 47719, 5005, 36179, 45420,
    49213, 11417, 32846, 59533, 40143, 49285, 29247, 29998, 10382, 17292, 11577, 22315, 54156, 
    61215, 16588, 57936, 12791, 13187, 56357, 42829, 21476, 3016, 17819, 34018, 25960, 28985, 
    36513, 31298, 13085, 49933, 2540, 29940, 46152, 60970, 50312, 2402, 64841, 56975, 38432, 
    45326, 11232, 36394, 60076, 7344, 29134, 37300, 34075, 47006, 44831, 51665, 15167, 35859, 
    59485, 31597, 52756, 31238, 20163, 46198, 4252, 22329, 45284, 65061, 61333, 28515, 23436, 
    4700, 3175, 53076, 2322, 29505, 30525, 53531, 62839, 65392, 22200, 34942, 16279, 15771,
    15463, 52705, 58930, 11966, 32430, 59229, 18645, 24295, 18406, 34323, 46483, 17266, 56364,
    5095, 21140, 19184, 65153, 9966, 63759, 55117, 21439, 65406, 6474, 23719, 36455, 40590,
    26685, 20550, 44529, 24621, 46512, 36736, 50158, 39142, 3098, 13499, 11998, 64622, 37534,
    43353, 15311, 25856, 10728, 59510, 6515, 55390, 62400, 33622, 7756, 29868, 35951, 35392, 
    56737, 886, 57284, 37189, 62647, 49056, 43915, 63096, 61625, 37923, 14004, 39976, 13237, 
    32614, 47676, 31602, 36950, 2078, 11192, 35758, 36777, 16142, 62309, 51, 1116, 51352, 43983,
    36880, 30101, 40873, 6430, 51119, 39428, 6542, 26929, 58924, 61580, 13326, 23233, 51216,
    51352, 39470, 62825, 21484, 14774, 39632, 3761, 64584, 12877, 28274, 47891, 37976, 31194,
    36753, 64680, 13241, 59466, 14761, 63527, 18610, 33067, 33969, 17922, 14481, 38607, 5069,
    64419, 64898, 28811, 18968, 58549, 12917, 19386, 43699, 63923, 30142, 55016, 2746, 31592,
    38201, 59984, 25626, 20779, 23408, 61104, 12011, 9050, 41061, 52606, 45813, 15998, 16912,
    8994, 12881, 36886, 45250, 28817, 24665, 30329, 33652, 24914, 14479, 5055, 62401, 9229, 43118,
    53098, 30706, 14153, 37143, 29135, 16838, 22197, 42013, 24041, 12889, 55792, 17383, 17373,
    52972, 56927, 51829, 25049, 41045, 60588, 24706, 29509, 16603, 17511, 38698, 3210, 24971, 
    13419, 54314, 56603, 57394, 6770, 26947, 60688, 5486, 15109, 14391, 6200, 30790, 24075, 
    65264, 55539, 20753, 1518, 34215, 51282, 40580, 4225, 24336, 4449, 55117, 60014, 64177,
    34967, 24389, 33383, 20792, 48817, 26809, 51077, 42921, 21561, 29340, 19958, 25164, 17962, 
    43965, 18718, 13118, 6502, 47192, 61625, 63272, 43994, 29705, 20033, 822, 25057, 1846, 18302,
    3886, 41756, 48704, 24922, 48624, 33794, 5775, 32729, 9253, 28057, 40722, 46049, 24149, 6171,
    50585, 53006, 60738, 36787, 24165, 40193, 27598, 37534, 38334, 36885, 15914, 21009, 47496,
    32645, 7093, 32105, 63289, 46614, 48802, 36862, 14039, 14685, 19970, 9475, 56947, 40355,
    45766, 63962, 62887, 33836, 4351, 62124, 19981, 60596, 61068, 10679, 43441, 51208, 12048,
    56179, 41507, 10786, 26827, 49464, 40284, 28623, 18170, 46740, 2878, 41399, 8187, 7981,
    11907, 49504, 54337, 27415, 5610, 52046, 47414, 56616, 53738, 1261, 44915, 44525, 24267, 
    46203, 6931, 18547, 47837, 42793, 42664, 1411, 42874, 15176, 23895, 46914, 25959, 18470,
    30642, 53131, 17848, 21827, 22446, 43617, 42891, 41386, 25547, 2757, 30718};
uint16_t x[64]={17933, 27638, 54613, 24189, 9017, 1175, 50149, 57193, 19645, 55487, 22299, 17105, 43083, 11672, 34953, 11345, 33499, 59732, 33792, 8338, 37813, 38540, 51229, 58687, 14390, 5712, 18699, 57188, 8470, 21585, 22370, 26403};
#endif //RANDOM_INIT
uint16_t expected_result[] = {41184, 11744, 60768, 1760, 60896, 4832, 61792, 49376, 45920, 30176, 41312, 42336, 14432, 53088, 50016, 4576, 63456, 2016, 23008, 46944, 25824, 18016, 34016, 48480, 37984, 26976, 64992, 51424, 51040, 55904, 20576, 42336};

__device__
void inline_matmul(uint16_t *A, uint16_t *x, uint16_t *res, bool restore)
{
    int i = threadIdx.x;
    int j;
    int r;
    uint16_t lx[N];
    uint16_t lres[N*5];
    __shared__ uint64_t other_sh;
 /*   for(j=0; j!=N*N; ++j) {
        if (A[j] != ptr_global[j] && i == 0)
            printf("mismatch\n");
    }*/
    if (i==0) other_sh = 0x1234567;
    for(j=0; j!=N; ++j)
        lx[j] = x[j];
    __syncthreads();
    for(r=0; r!=ITERATIONS; r++) {
        if (i < N)
            lres[i] = 0;
        if (i < N && i%2==0) {
            for (j=0; j != N; ++j) {
                lres[i] += A[i*N+j]*lx[j]+other_sh;
            }
        }
        if (i < N && i%2==1) {
            for (j=0; j != N; ++j) {
                lres[i] += A[i*N+j]+lx[j]+other_sh;
            }
        }
        __syncthreads();
        if (r%(ITERATIONS/128)==0) {
            res[i] += lres[i];
            if (i==0 && blockIdx.x == 0) {
                //A_global += lres[i];
                //printf("sum: %u, A_global: %lx\n", local_sum(res,N), A_global);
                printf("local still running: %u/%u\n", r/(ITERATIONS/128), 128);
            }
            //while(r/(ITERATIONS/32) == 5);
        }
        if (i==0)
            other_sh = res[0];
        __syncthreads();
    }
}
__global__
void kernel(uint16_t *A, uint16_t *x, uint16_t *res, char b, short c, int a, long long int d)
{
    CRICKET_CR_ENABLE(19);
    inline_matmul(A,x,res,false);
}

size_t getSize(void *address)
{
    CUdeviceptr ptr=0;
    size_t ptrs;
    CUresult res = cuMemGetAddressRange(&ptr, &ptrs, (CUdeviceptr)address);
    if (res != CUDA_SUCCESS)
        return 0;
    else
        return ptrs;
}

int main()
{
#ifdef RANDOM_INIT
    uint16_t *A,*x;
#endif //RANDOM_INIT
    uint16_t *res;
    uint16_t *dev_A, *dev_x, *dev_res;
    uint16_t *dev_ptr;
    struct timeval begin, end;
    const int A_size = N*N*sizeof(uint16_t);
    const int x_size = N*sizeof(uint16_t);

    int cnt = 5;

    gettimeofday(&begin, NULL);
    srand(time(NULL));

#ifdef RANDOM_INIT
    A = (uint16_t*)malloc(A_size);
    x = (uint16_t*)malloc(x_size);
#endif //RANDOM_INIT
    res = (uint16_t*)malloc(sizeof(uint16_t)*N);

    printf("A[%d]={", A_size);
    for (int i = 0; i != N/* *N */; ++i) {
#ifdef RANDOM_INIT
        A[i] = rand() % 65536;
#endif //RANDOM_INIT
        printf("%u, ", A[i]);
    }
    printf("... }\nx[%d]={", x_size);
    for (int i = 0; i != N; ++i) {
#ifdef RANDOM_INIT
        x[i] = rand() % 65536;
#endif //RANDOM_INIT
        printf("%u, ", x[i]);
    }
    printf("}\n");

#ifdef TEST_CPU
    printf("CPU Test: Create a checkpoint now!\n");
    sleep(10);
    printf("continuing...\n");
#endif //TEST_CPU

    printf("About to initialize CUDA context...\n");

    cudaMalloc( (void**)&dev_A, A_size );

    printf("dev_A = %p\n", dev_A);
    printf("CUDA context initialized\n");

#ifdef TEST_API
    printf("API Test: Create a checkpoint now!\n");
    printf("kernel: %p\n", kernel);
    //cudaDeviceReset();
    sleep(10);
    printf("Rerun first CUDA API call...\n");


    cudaMalloc( (void**)&dev_A, A_size );

    printf("dev_A = %p\n", dev_A);
    printf("continuing...\n");
#endif //TEST_API

    cudaMalloc( (void**)&dev_x, x_size );
    cudaMalloc( (void**)&dev_res, x_size );
    cudaMalloc( (void**)&dev_ptr, A_size );

    printf("Mallocs done\n");

    cudaMemcpy( dev_ptr, A, A_size, cudaMemcpyHostToDevice );
    cudaMemcpy( dev_A, A, A_size, cudaMemcpyHostToDevice );
    cudaMemcpy( dev_x, x, x_size, cudaMemcpyHostToDevice );


    dim3 dimBlock( blocksize, 1 );
    dim3 dimGrid( 1, 1);
    kernel<<<dimGrid, dimBlock>>>(dev_A, dev_x, dev_res, 0, 0, 0, 0);
#ifdef TEST_KERNEL
    printf("Kernel Test: Create a checkpoint now!\n");
    cudaDeviceSynchronize();
    printf("dev_res: %p\n", dev_res);
    printf("continuing\n");
#endif //TEST_KERNEL
    cudaMemcpy( res, dev_res, x_size, cudaMemcpyDeviceToHost );
    cudaFree( dev_A );
    cudaFree( dev_x );
    cudaFree( dev_res );

    FILE *fp  = fopen("out.txt", "w+");
    printf("Result:\n");
    for (int i = 0; i != N; ++i) {
        printf("%u ", res[i]);
        fprintf(fp, "%u ", res[i]);
    }
    printf("\n");
    fprintf(fp, "\n");

    int success = 1;
    for (int i = 0; i != N; ++i) {
        if (res[i] != expected_result[i]) {
            success = 0;
            printf("mismatch: res[%d]=%d != expected_result[%d]=%d\n", i, res[i], i, expected_result[i]);
        }
    }
    if (success) {
        printf("result is correct!\n");
    } else {
        printf("---> result incorrect!\n");
    }

    gettimeofday(&end, NULL);

    printf("elapsed time: %0u.%06u\n", (end.tv_sec - begin.tv_sec), (end.tv_usec - begin.tv_usec));


    return EXIT_SUCCESS;
}
