//
//  main.c
//  #18 swap_two_ints
//
//  Created by Aditya Narayan on 9/4/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>

void swap(int* px, int* py);

int main(int argc, const char * argv[])
{
    int a = 10;
    int b = 20;
    int* px = &a;
    int* py = &b;
    printf("Before the swap: a = %d, b = %d\n", a, b);
    swap(px, py);
    printf("After the swap: a = %d, b = %d\n", a, b);

    
    return 0;
}

void swap(int* px, int* py) {
    int temp;
    
    temp = *px;
    *px = *py;
    *py = temp;
}

