#include <stdio.h>

int factorial(int n);

int main(void) {
  int n;
  printf("Enter a number: ");
  scanf("%d", &n);
  printf("%d! = %d\n", n, factorial(n));
  return 0;
}

int factorial(int n) {
  if (n == 0) {
    // base case
    return 1;
  }
  // recursive case
  return n * factorial(n - 1);
}
