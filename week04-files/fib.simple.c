// A simple, recursive, non-memoized fibonacci implementation.
// Abiram Nadarajah, October 2021
#include <stdio.h>

int fib(int n) {
    int retval;

    if (n >= 2) goto fib__n_ge_2;
    
    retval = n;
    goto fib__epilogue;


fib__n_ge_2:
    retval = fib(n - 1) + fib(n - 2);

fib__epilogue:
    return retval;
}

int main(void) {
    printf("Enter a number: ");
    int n;
    scanf("%d", &n);

    printf("Fibonacci of ");
    printf("%d", n);
    printf(" is ");
    printf("%d", fib(n));
    putchar('\n');
    
    return 0;
}
