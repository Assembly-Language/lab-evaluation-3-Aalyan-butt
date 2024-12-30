#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

void __stdcall asmfunc(int* arr, int array_size, int* result);

#ifdef __cplusplus
}
#endif

int main() {
    // Clear console screen (optional)
    system("cls");

    // Array with both even and odd numbers
    int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    int array_size = sizeof(arr) / sizeof(arr[0]);
    int result = 0;


    // Print array elements
    printf("Array elements: ");
    for (int i = 0; i <array_size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    printf("Sum of odd numbers: %d\n", result);
    // Call the assembly function
    asmfunc(arr, array_size, &result);




    getch();

    return 0;
}
