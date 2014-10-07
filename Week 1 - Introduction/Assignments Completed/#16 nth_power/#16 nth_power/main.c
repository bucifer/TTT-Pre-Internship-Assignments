//
//  main.c
//  #16 nth_power
//
//  Created by Aditya Narayan on 9/4/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>

int nth_power(int base, int power);

int main(int argc, const char * argv[])
{
    int base = 3;
    int power = 2;
    printf("%d raised to the power of %d equals %d. \n", base, power, nth_power(base, power));
    return 0;
}

int nth_power(int base, int power) {
    int result = 1;
    
    if (power >= 1) {
        for (int i=0; i < power; i++){
            result = result * base;
        }
    }
    return result;
}
