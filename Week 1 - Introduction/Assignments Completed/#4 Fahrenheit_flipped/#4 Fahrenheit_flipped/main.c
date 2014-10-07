//
//  main.c
//  #4 Fahrenheit_flipped
//
//  Created by Aditya Narayan on 9/2/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    float fahr, celsius;
    int lower, upper, step;
    /* comments */
    
    lower = -40;
    upper = 100;
    step = 1;
    
    /* header */
    printf("Fahrenheit|Celsius\n");
    
    for (fahr = upper; fahr >= lower; fahr -= step) {
        celsius = 5 * (fahr-32)/9;
        printf("%7.1f\t  |%6.1f\n", fahr, celsius);
    }
    return 0;
}

