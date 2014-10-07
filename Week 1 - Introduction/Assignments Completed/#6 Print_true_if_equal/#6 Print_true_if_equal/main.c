//
//  main.c
//  #6 Print_true_if_equal
//
//  Created by Aditya Narayan on 9/2/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>
#include <string.h>

void print_true_if_equal(char one[], char two[]);

int main(int argc, const char * argv[])
{
    char one[] = "test";
    char two[] = "test";
    print_true_if_equal(one, two);
    return 0;
}

void print_true_if_equal(char one[], char two[]) {
    if (strcmp(one, two) == 0) printf("true\n");
    else printf("false\n");
}