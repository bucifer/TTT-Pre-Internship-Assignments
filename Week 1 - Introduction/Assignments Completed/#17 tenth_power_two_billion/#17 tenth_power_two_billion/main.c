//
//  main.c
//  #17 tenth_power_two_billion
//
//  Created by Aditya Narayan on 9/4/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>

double nth_power(double base, int power);

int main(int argc, const char * argv[])
{
    double base = 2000000000;
    int power = 10;
    printf("%f raised to the power of %d equals %f. \n", base, power, nth_power(base, power));
    return 0;
    
}

double nth_power(double base, int power) {
    double result = 1;
    
    if (power >= 1) {
        for (int i=0; i < power; i++){
            result = result * base;
        }
    }
    return result;
}
