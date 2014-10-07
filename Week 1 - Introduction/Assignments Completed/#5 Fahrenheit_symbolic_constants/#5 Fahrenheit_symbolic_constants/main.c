//
//  main.c
//  #5 Fahrenheit_symbolic_constants
//
//  Created by Aditya Narayan on 9/2/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>

#define LOWER -40
#define UPPER 100
#define STEP 1

int main(int argc, const char * argv[])
{
    float fahr, celsius;
    /* comments */
    
    /* header */
    printf("Fahrenheit|Celsius\n");
    
    for (fahr = UPPER; fahr >= LOWER; fahr -= STEP) {
        celsius = 5 * (fahr-32)/9;
        printf("%7.1f\t  |%6.1f\n", fahr, celsius);
    }
    return 0;
}

