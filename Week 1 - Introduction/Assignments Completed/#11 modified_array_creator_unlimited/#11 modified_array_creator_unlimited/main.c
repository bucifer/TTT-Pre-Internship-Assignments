//
//  main.c
//  #11 modified_array_creator_unlimited
//
//  Created by Aditya Narayan on 9/4/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void array_creator(char str[], char delim[]);

int main(int argc, const char * argv[])
{
    
    char input_string[] = "?*USA. Canada,.* |Mexico,Bermuda Grenada Belize*Brazil|Argentina****||||||||";
    char input_delim[] = ", .*?|";
    
    array_creator(input_string, input_delim);
    
    return 0;
}

void array_creator(char str[], char delim[]) {
    char* token;
    char* results[100];
    
    printf ("Splitting string %s into tokens:\n",str);
    token = strtok (str, delim);
    
    int index = 0;
    results[index] = token;
    
    while (token != NULL)
    {
        printf ("-%s\n", token);
        token = strtok (NULL, delim);
        index+=1;
        results[index] = token;
    }
    
    /* print out everything in the results array */
    printf ("*******\nPrinting out results array: \n");
    
    int i = 0;
    while(results[i]){
        printf("%s\n", results[i]);
        i++;
    }
    
}


