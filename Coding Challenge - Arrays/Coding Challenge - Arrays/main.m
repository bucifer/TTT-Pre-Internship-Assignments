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
        NSMutableArray *array_D = [@[@0,@121,@32113,@21, @2, @5] mutableCopy];
        [terrysArrayChecker sortAscending:array_C];
        NSLog(array_C.description);
        
        [terrysArrayChecker sortDescending:array_D];

        [terrysArrayChecker findMin:array_A];
        [terrysArrayChecker findMax:array_B];

        NSLog(@"The average is %f", [terrysArrayChecker findAverage:array_A]);
        
        NSMutableArray *lotsOfDuplicates= [@[@1, @1, @1, @2, @2, @3, @1, @1, @3, @3, @2, @4, @4] mutableCopy];
        [terrysArrayChecker removeDuplicates:lotsOfDuplicates];
        NSLog(lotsOfDuplicates.description);
        
        NSMutableArray *joinedArray = [terrysArrayChecker joinTwoArrays:array_C secondArray:array_D];
        NSLog(joinedArray.description);
        NSMutableArray *joinedArrayB = [terrysArrayChecker uniqueJoinTwoArrays:array_C secondArray:array_D];
        NSLog(joinedArrayB.description);
        
        //I'm assuming you are not looking for completely unique intersections
        NSMutableArray *a = [@[@1, @99, @99, @3, @0, @11, @22, @33] mutableCopy];
        NSMutableArray *b = [@[@99, @99, @3, @3, @4] mutableCopy];
        NSLog([[terrysArrayChecker findIntersection:a secondArray:b] description]);
        NSLog([[terrysArrayChecker removeIntersection:a secondArray:b]description]);

        
        NSMutableArray *reverseThis = [@[@"a", @"b", @"c", @"d", @"e"] mutableCopy];
        [terrysArrayChecker reverseArray:reverseThis];
        NSLog(reverseThis.description);
        
//arrays have all strings scenario
        
        
    }
    return 0;
}