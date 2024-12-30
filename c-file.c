#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

void __stdcall asmfunc(int* arr, int size, int* result);

#ifdef __cplusplus
}
#endif

int main() {
    // Clear console screen (optional)
    system("cls");

    // Array with both even and odd numbers
    int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    int size = sizeof(arr) / sizeof(arr[0]);
    int result = 0;

    // Print array elements
    printf("Array elements: ");
    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    // Call the assembly function
    asmfunc(arr, size, &result);

    // Print the result
    printf("Sum of odd numbers: %d\n", result);

    getch();

    return 0;
}
