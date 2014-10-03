//
//  main.m
//  Coding Challenge - Arrays
//
//  Created by Aditya Narayan on 10/3/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TerrysArrayChecker.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
//arrays have all numbers scenario
        NSMutableArray *array_A = [@[@1,@2,@3,@4,@5] mutableCopy];
        NSMutableArray *array_B = [@[@215,@121,@33,@21] mutableCopy];

        TerrysArrayChecker *terrysArrayChecker = [[TerrysArrayChecker alloc]init];
        [terrysArrayChecker isThisArraySorted:array_A];
        [terrysArrayChecker isThisArraySorted:array_B];

        NSMutableArray *array_C = [@[@13232,@2,@332,@4,@5] mutableCopy];
        NSMutableArray *array_D = [@[@0,@121,@32113,@21] mutableCopy];
        [terrysArrayChecker sortAscending:array_C];
        NSLog(array_C.description);
        
        [terrysArrayChecker sortDescending:array_D];

        [terrysArrayChecker findMin:array_A];
        [terrysArrayChecker findMax:array_B];

        NSLog(@"The average is %f", [terrysArrayChecker findAverage:array_A]);
        
        NSMutableArray *array_E = [@[@100, @100, @121,@32113,@21] mutableCopy];
        [terrysArrayChecker removeDuplicates:array_E];
        NSLog(array_E.description);
        
        
        NSMutableArray *joinedArray = [terrysArrayChecker joinTwoArrays:array_A secondArray:array_B];
        NSLog(joinedArray.description);
        
        
        
//arrays have all strings scenario
        
        
    }
    return 0;
}