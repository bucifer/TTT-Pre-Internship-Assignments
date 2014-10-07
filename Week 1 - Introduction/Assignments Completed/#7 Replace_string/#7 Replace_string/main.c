//
//  main.c
//  #7 Replace_string
//
//  Created by Aditya Narayan on 9/2/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
//one way is setting a hard-coded MAX but there will be a limit
//another way is malloc (setting aside memory for the length of the string)

void replace_string(char test[]);

int main(int argc, const char * argv[])
{
    char user_string[] = "This is a testdtfsadjfsdjfpiasfjpsdifjapsistfsdfhasofjpsdiffsdkjfsapfjpsdfjsapifjpsaifjsiapdfjpsaifjpsidf";
//    printf("%lu\n", strlen(user_string));
    replace_string(user_string);
    return 0;
}

void replace_string(char user_string[]) {
    
    // dynamically allocate memory for two temporary strings(left and right) based on the size of user input string
    int string_len = (int)strlen(user_string) + 1;//casting
    // malloc left some garbarge in the memory - calloc initializes the memory cleanly
    char *left = calloc(string_len, sizeof(char));
    char *right = calloc(string_len, sizeof(char));
    char ghost[] = "gho";
    
    if (left == NULL || right == NULL)
    {
        printf("ERROR: Out of memory\n");
        return;
    }
    
    int booleanFoundTe = 0;
    /* keep adding character to left array unless you hit 't' and 'e' consecutively */
    for (int i=0; i < strlen(user_string); i++) {
        if ((user_string[i] == 't') && (user_string[i+1] == 'e')) {
            /* if checked character equals 't' and the next character equals 'e', we have a match */
            for (int j = i + 2; j < strlen(user_string); j++) {
                right[strlen(right)] = user_string[j];
            }
            booleanFoundTe = 1;
            strcat(left, ghost);
            strcat(left, right);
            printf("%s\n", left);
        }
        else {
            left[strlen(left)] = user_string[i];
        }
    }
    /* if we never found TE, then we just print out everything we added to the left array */
    if (booleanFoundTe == 0) {
        printf("%s\n", left);
    }
    
    free(left);
    free(right);
}