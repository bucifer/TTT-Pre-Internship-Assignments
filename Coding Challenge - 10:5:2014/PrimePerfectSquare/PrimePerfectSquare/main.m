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
 
    
    //Recursion
    
    [terrysNumberChecker myFactorial:5];
    NSLog(@"sum: %d", [terrysNumberChecker sumOfFirstN:10]);
    
    NSLog(@"fibonacci: %f", [terrysNumberChecker fibonacci:11]);
    NSLog(@"fibonacci: %f", [terrysNumberChecker fibonacci:4]/[terrysNumberChecker fibonacci:3]);
        NSLog(@"fibonacci: %f", [terrysNumberChecker fibonacci:11]/[terrysNumberChecker fibonacci:10]);
    //No the recursion program runs forever when n approaches large numbers
//    NSLog(@"fibonacci: %f", [terrysNumberChecker fibonacci:1000]/[terrysNumberChecker fibonacci:999]);
        
        

    
    }
    return 0;
}
