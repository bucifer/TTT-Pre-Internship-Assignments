//
//  main.c
//  #20 evaluate_S
//
//  Created by Aditya Narayan on 9/4/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>
long nth_power(long base, int power);

int main(int argc, const char * argv[])
{
    
    float S;
    double temp = 0;
    long n = 100;
    
    for (double i = 1; i <= n; i++) {
        temp = temp + (1.0/nth_power(i, 2));
    }
    
    S = sqrt(6 * temp);
    
    printf("%f\n", S);
    return 0;
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