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
        
        
        
        NSArray *array_A = @[@1,@2,@3,@4,@5];
        NSArray *array_B = @[@5,@121,@3,@4,@5];
        NSArray *array_C = @[@215,@121,@33,@21,@5];

        TerrysArrayChecker *terrysArrayChecker = [[TerrysArrayChecker alloc]init];
        [terrysArrayChecker isThisArraySorted:array_A];
        [terrysArrayChecker isThisArraySorted:array_B];
        [terrysArrayChecker isThisArraySorted:array_C];

        
        
    }
    return 0;
}