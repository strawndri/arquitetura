#include <stdio.h>

#define TAMANHO 10

int main()
{
    int R[TAMANHO] = {0};
    int A[TAMANHO] = {0, 2, 3, 6, 8, 10, 12, 14, 16, 18};
    int B[TAMANHO] = {1, 3, 5, 7, 9, 11, 13, 15, 17, 19};

    for (int i = 0; i < TAMANHO; i++)
        R[i] = A[i] + B[i];

    for (int i = 0; i < TAMANHO; i++)
        printf("%d ", R[i]);

    printf("\n");

    return 0;
}