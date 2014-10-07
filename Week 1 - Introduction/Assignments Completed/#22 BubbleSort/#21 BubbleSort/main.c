//
//  main.c
//  #21 BubbleSort
//
//  Created by Aditya Narayan on 9/5/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>
#define TRUE 1;
#define FALSE 0;

int main(int argc, const char * argv[])
{
    //declare variables
    int array_to_sort[] = {100, 5, 2, 7, 0, -1};
    int array_len = sizeof(array_to_sort)/sizeof(int);
    int booleanSwapped = TRUE;
    
    //run the loop until booleanSwapped = 0;
    while (booleanSwapped) {
            booleanSwapped = FALSE;
            for (int i = 0; i < array_len-1; i++) {
                if (array_to_sort[i] > array_to_sort[i+1]) {
                    int temp;
                    temp = array_to_sort[i];
                    array_to_sort[i] = array_to_sort[i+1];
                    array_to_sort[i+1] = temp;
                    booleanSwapped = TRUE;
                }
            }
    }
    
    //print out the array to check your results//
    for (int i = 0; i < array_len; i++) {
        printf("%d ", array_to_sort[i]);
    }
    printf("\n");
    
    return 0;
}

