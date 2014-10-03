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
        NSMutableArray *array_B = [@[@215,@121,@33,@21,@5] mutableCopy];

        TerrysArrayChecker *terrysArrayChecker = [[TerrysArrayChecker alloc]init];
        [terrysArrayChecker isThisArraySorted:array_A];
        [terrysArrayChecker isThisArraySorted:array_B];
        
        NSMutableArray *unsortedArray_A = [@[@215,@1321,@33,@21,@5]mutableCopy];
        NSMutableArray *unsortedArray_B = [@[@215,@1321,@33,@21,@5]mutableCopy];

        [terrysArrayChecker sortAscending:unsortedArray_A];
        [terrysArrayChecker sortDescending:unsortedArray_B];

        
//arrays have all strings scenario
        
        
    }
    return 0;
}