// non recursively calculate a factorial in C
// Abiram Nadarajah, Feb 2022

#include <stdio.h>

int main(void) {
    int n;
    printf("n  = ");
    scanf("%d", &n);

    int fac = 1;

loop_calc__init:;
    int i = 1;

loop_calc__cond:
    if (i > n) goto loop_calc__end;

loop_calc__body:
        fac *= i;

loop_calc__step:
    i++;
    goto loop_calc__cond;
loop_calc__end:

    printf("n! = %d\n", fac);
    return 0;
}
