//
//  main.c
//  #8 array_of_strings
//
//  Created by Aditya Narayan on 9/2/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>
#include <string.h>

void new_string(char *something[], size_t num_elements);
void length_of_string(char *string_array[]);

int main(int argc, char *argv[])
{
    char *strings[] = {"Honey", "Nut", "Cheerios"};
    size_t num_elements = sizeof(strings)/sizeof(strings[0]);
    new_string(strings, num_elements);
    return 0;
}

void new_string(char *something[], size_t num_elements) {
        /* check to see if array is empty */
        if (num_elements == 0) {
            printf("The array is empty\n");
        }
    
        else {
        int total = 0;
        
        /* print out length of each string in the array */
        for (int i = 0; i < num_elements; i++) {
            printf("Length of %d-th element: %lu\n", i, strlen(something[i]));
            total += strlen(something[i]);
        }
        printf("Total of indiv strings: %d\n", total);
    
        char result[100] = "";
        for(int i = 0; i < num_elements; i++) {
            strcat(result, something[i]);
        }
            
        printf("New string: %s\n", result);
        printf("New string length: %lu\n", strlen(result));
        if (total == strlen(result)) printf("The total of indiv strings matches new string length at %d\n", total);
    }
}