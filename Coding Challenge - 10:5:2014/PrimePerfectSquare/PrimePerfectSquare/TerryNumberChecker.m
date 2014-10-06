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



@end
