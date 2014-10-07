//
//  TerryNumberChecker.m
//  PrimePerfectSquare
//
//  Created by Aditya Narayan on 10/6/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "TerryNumberChecker.h"

@implementation TerryNumberChecker

- (BOOL) isItPrime:(int)num {
    //handle exceptions
    if (num == 0) return FALSE;
    if (num == 1) return FALSE;
    
    for (int i=2; i < num; i++) {
        if (num % i ==0) {
            NSLog(@"%d is not prime", num);
            return FALSE;
        }
    }
    NSLog(@"%d is prime", num);
    return TRUE;
}

- (BOOL) isItPerfectSquare:(int)num {
    if (sqrt(num) * sqrt(num) == num) {
        NSLog(@"%d is a perfect square", num);
        return TRUE;
    }
    NSLog(@"%d is NOT a perfect square", num);
    return FALSE;
}



- (int) myFactorial:(int)num {
    if (num == 1) return 1;
    int result;
    
    //for recursion, you definitely need the self like this below
    result = [self myFactorial:num-1] * num;
    return result;
}


- (int) sumOfFirstN:(int)N {
    if (N != 0)
        return [self sumOfFirstN:(N-1)] + N;
    else
        return 0;
}


- (double) fibonacci: (long)n cacheArray:(double[])myCacheArray {

    if (n == 0)
        return 0;
    if (n == 1)
        return 1;
    
    if (myCacheArray[n] != 0) {
        return myCacheArray[n];
    }
    
    myCacheArray[n] = [self fibonacci:(n-1) cacheArray:myCacheArray] + [self fibonacci:(n-2) cacheArray:myCacheArray];
    
    return myCacheArray[n];
}


- (void) reverseArrayWithRecursion:(NSMutableArray *)someArray startIndex:(int)first endIndex:(int)end{
    if (first < end) {
        id temp = someArray[first];
        someArray[first] = someArray[end];
        someArray[end] = temp;
        [self reverseArrayWithRecursion:someArray startIndex:++first endIndex:--end];
    }
}



@end
