//
//  main.c
//  #21 calculate_n
//
//  Created by Aditya Narayan on 9/4/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>
#define PI 3.141592
long nth_power(long base, int power);
long calculate_n(float s);

int main(int argc, const char * argv[])
{
    float S = PI;
    printf("S equals %f\n", S);
    printf("N needs to equal %ld for S to approach %f \n", calculate_n(S), S);
    
    return 0;
}

long calculate_n(float pi) {
    double total = 0;
    float limit = pi * pi/6;
    long n = 1;
    while (total <= limit) {
        total = total + (1.0/nth_power(n, 2));
        n += 1;
    }
    return n;
}

long nth_power(long base, int power) {
    long result = 1;
    if (power >= 1) {
        for (int i=0; i < power; i++){
            result = result * base;
        }
    }
    return result;
}