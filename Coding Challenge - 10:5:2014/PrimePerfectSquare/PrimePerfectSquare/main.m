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
 
    //Recursion Problems
    [terrysNumberChecker myFactorial:5];
    NSLog(@"sum: %d", [terrysNumberChecker sumOfFirstN:10]);
    
    //Fibonacci Recursion
    NSDate *methodStart = [NSDate date];
        NSLog(@"fibonacci: %f", [terrysNumberChecker fibonacci:30]);
    NSDate *methodFinish = [NSDate date];
    NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
    NSLog(@"executionTime = %f", executionTime);
    
    NSLog(@"fibonacci: %f", [terrysNumberChecker fibonacci:4]/[terrysNumberChecker fibonacci:3]);
    NSLog(@"fibonacci: %f", [terrysNumberChecker fibonacci:11]/[terrysNumberChecker fibonacci:10]);
    //the recursion program takes a really long time when n approaches large numbers
        
    //Reverse Array using recursion
    NSArray* myArray = @[@1,@2,@3,@4,@5];
    NSMutableArray *reverseThisArray = [myArray mutableCopy];
    [terrysNumberChecker reverseArrayWithRecursion:reverseThisArray startIndex:0 endIndex:reverseThisArray.count-1];
    NSLog(reverseThisArray.description);
    
    }
    return 0;
}
