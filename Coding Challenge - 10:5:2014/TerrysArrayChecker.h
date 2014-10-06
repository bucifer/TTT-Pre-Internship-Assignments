//
//  TerrysArrayChecker.h
//  Coding Challenge - Arrays
//
//  Created by Aditya Narayan on 10/3/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TerrysArrayChecker : NSObject


- (BOOL) isThisArraySorted:(NSMutableArray *) someArray;

- (void) sortAscending:(NSMutableArray *) someArray;
- (void) sortDescending:(NSMutableArray *) someArray;


- (NSNumber*) findMin:(NSMutableArray *) someArray;
- (NSNumber*) findMax:(NSMutableArray *) someArray;
- (double) findAverage:(NSMutableArray *) someArray;

- (void) removeDuplicates:(NSMutableArray *) someArray;

- (NSMutableArray *) joinTwoArrays:(NSMutableArray *) firstArray secondArray: (NSMutableArray *) secondArray;
- (NSMutableArray *) uniqueJoinTwoArrays:(NSMutableArray *) firstArray secondArray: (NSMutableArray *) secondArray;
- (NSMutableArray *) removeIntersection:(NSMutableArray *) firstArray secondArray: (NSMutableArray *) secondArray;
- (NSMutableArray *) findIntersection:(NSMutableArray *) firstArray secondArray: (NSMutableArray *) secondArray;
- (NSMutableArray *) reverseArray:(NSMutableArray *) someArray;



@end
