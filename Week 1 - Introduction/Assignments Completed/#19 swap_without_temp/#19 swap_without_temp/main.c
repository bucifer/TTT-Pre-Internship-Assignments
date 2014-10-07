//
//  main.c
//  #19 swap_without_temp
//
//  Created by Aditya Narayan on 9/4/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>

void swap(double* px, double* py);

int main(int argc, const char * argv[])
{
    double a = 2100000000;
    double b = 2000000000;
    double* px = &a;
    double* py = &b;
    printf("Before the swap: a = %f, b = %f\n", a, b);
    swap(px, py);
    printf("After the swap: a = %f, b = %f\n", a, b);
    
    
    return 0;
}

void swap(double* px, double* py) {
    *px = *py - *px;
    *py = *py - *px;
    *px = *px + *py;
}
