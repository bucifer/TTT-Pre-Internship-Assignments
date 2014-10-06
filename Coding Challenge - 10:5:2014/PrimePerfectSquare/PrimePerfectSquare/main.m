//
//  main.m
//  PrimePerfectSquare
//
//  Created by Aditya Narayan on 10/6/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TerryNumberChecker.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
    TerryNumberChecker *terrysNumberChecker = [[TerryNumberChecker alloc]init];
   [terrysNumberChecker isItPrime:2];
   [terrysNumberChecker isItPrime:14];
   [terrysNumberChecker isItPrime:31];

   [terrysNumberChecker isItPerfectSquare:25];
   [terrysNumberChecker isItPerfectSquare:15];
   [terrysNumberChecker isItPerfectSquare:100];
 
    }
    return 0;
}
