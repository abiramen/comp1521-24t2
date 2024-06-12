#include <stdio.h>
#define N_ELEMENTS 5

int main(void) {
    int array[N_ELEMENTS] = {3, 1, 4, 1, 5};
    // array = &array[0]
    // &array[i] = array + 4 * i
    // array[i] = *(array + 4 * i)
    // &array[i] = array + i * sizeof(element)

    for (int i = 0; i < N_ELEMENTS; i++) {
        printf("%p ", &array[i]);
        printf("%d", array[i]);
        putchar('\n');
    }

    return 0;
}


// What if we had
// int array[N_ELEMENTS] = {3, 1, 4, 1, 5};

