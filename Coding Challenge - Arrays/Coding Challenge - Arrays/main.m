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
        TerrysArrayChecker *terrysArrayChecker = [[TerrysArrayChecker alloc]init];

        //Number array version comes first
        //String array version comes second
        
        //Check sorted
            NSMutableArray *array_A = [@[@1,@2,@3,@4,@5] mutableCopy];
            [terrysArrayChecker isThisArraySorted:array_A];
            NSMutableArray *stringArray_A = [@[@"a", @"b", @"c", @"d", @"e"] mutableCopy];
            [terrysArrayChecker isThisArraySorted:stringArray_A];
        
        //Sorting Arrays
            NSMutableArray *array_B = [@[@13232,@2,@332,@4,@5] mutableCopy];
            NSMutableArray *array_C = [@[@0,@2, @332, @24,@48,@96] mutableCopy];
            [terrysArrayChecker sortAscending:array_B];
            NSLog(array_B.description);
            [terrysArrayChecker sortDescending:array_B];
            NSLog(array_B.description);
            
            NSMutableArray *stringArray_B = [@[@"c", @"x", @"a", @"z", @"b"] mutableCopy];
            NSMutableArray *stringArray_C = [@[@"j", @"i", @"d", @"y", @"c"] mutableCopy];
            [terrysArrayChecker sortAscending:stringArray_B];
            NSLog(stringArray_B.description);
            [terrysArrayChecker sortDescending:stringArray_B];
            NSLog(stringArray_B.description);

        //Find min, max, average
            [terrysArrayChecker findMin:array_A];
            [terrysArrayChecker findMax:array_A];
            NSLog(@"The average is %f", [terrysArrayChecker findAverage:array_A]);
            [terrysArrayChecker findMin:stringArray_A];
            [terrysArrayChecker findMax:stringArray_A];
        
        //Remove duplicates
            NSMutableArray *lotsOfDuplicates= [@[@1, @1, @1, @2, @2, @3, @1, @1, @3, @3, @2, @4, @4] mutableCopy];
            [terrysArrayChecker removeDuplicates:lotsOfDuplicates];
            NSLog(lotsOfDuplicates.description);
            NSMutableArray *stringlotsOfDuplicates= [@[@"a", @"a", @"a", @"b"] mutableCopy];
            [terrysArrayChecker removeDuplicates:stringlotsOfDuplicates];
            NSLog(stringlotsOfDuplicates.description);
        
        //Join and Unique-Join Arrays
            NSMutableArray *joinedArray = [terrysArrayChecker joinTwoArrays:array_B secondArray:array_C];
            NSLog(joinedArray.description);
            NSMutableArray *joinedArrayB = [terrysArrayChecker uniqueJoinTwoArrays:array_B secondArray:array_C];
            NSLog(joinedArrayB.description);
        
            NSMutableArray *stringjoinedArray = [terrysArrayChecker joinTwoArrays:stringArray_B secondArray:stringArray_C];
            NSLog(stringjoinedArray.description);
            NSMutableArray *stringjoinedArrayB = [terrysArrayChecker uniqueJoinTwoArrays:stringArray_B secondArray:stringArray_C];
            NSLog(stringjoinedArrayB.description);
        
        //Find intersection, remove intersection
            NSMutableArray *a = [@[@1, @2, @2, @2, @11, @22, @33] mutableCopy];
            NSMutableArray *b = [@[@2, @2, @3, @3, @4] mutableCopy];
            NSLog([[terrysArrayChecker findIntersection:a secondArray:b] description]);
            NSLog([[terrysArrayChecker removeIntersection:a secondArray:b]description]);
        
            NSLog([[terrysArrayChecker findIntersection:stringArray_B secondArray:stringArray_C] description]);
            NSLog([[terrysArrayChecker removeIntersection:stringArray_B secondArray:stringArray_C]description]);
        
        
        //Reverse, reverse
            [terrysArrayChecker reverseArray:a];
            NSLog(a.description);
            NSMutableArray *stringArrayReverse = [@[@"A", @"B", @"C"] mutableCopy];
            [terrysArrayChecker reverseArray:stringArrayReverse];
            NSLog(stringArrayReverse.description);
        
    }
    return 0;
}