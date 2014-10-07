//
//  main.c
//  fizzbuzz
//
//  Created by Aditya Narayan on 9/2/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    for (int i = 1; i<=100; i++) {
        if (i % 3 == 0 && i % 5 == 0 ) printf("FizzBuzz\n");
        else if (i % 3 == 0) printf("Fizz\n");
        else if (i % 5 == 0) printf("Buzz\n");
        else {
           printf("%d\n", i);
        }
    }
    return 0;
}

