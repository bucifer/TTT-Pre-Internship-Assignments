//
//  TerrysArrayChecker.m
//  Coding Challenge - Arrays
//
//  Created by Aditya Narayan on 10/3/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "TerrysArrayChecker.h"

@implementation TerrysArrayChecker

- (BOOL) isThisArraySorted:(NSMutableArray *) someArray {
    
    int DesCounter = 0;
    int AscCounter = 0;
    
    for (int i = 0; i < someArray.count-1; i++) {
        if (someArray[i] > someArray[i+1]) {
            DesCounter++;
        }
        else if (someArray[i] < someArray[i+1]) {
            AscCounter++;
        }
    }
    
    if (DesCounter == someArray.count -1) {
        NSLog(@"Yes, your array is sorted in descending order");
        return YES;
    }
    if (AscCounter == someArray.count - 1) {
        NSLog(@"Yes, your array is sorted in ascending order");
        return YES;
    }
    else {
        NSLog(@"No, This array is NOT sorted in any way");
    }
    return NO;
}


- (void) sortAscending:(NSMutableArray *) someArray {
    
        for (int i=0; i < someArray.count; i++) {
            
            for (int j=0; j < someArray.count - 1; j++) {
                if (someArray[j] > someArray[j+1]) {
                    NSNumber *temp;
                    temp = someArray[j];
                    someArray[j] = someArray[j+1];
                    someArray[j+1] = temp;
                }
            }

        }
    
}


- (void) sortDescending:(NSMutableArray *) someArray {
    BOOL booleanSwapped = TRUE;
    
    while (booleanSwapped) {
        booleanSwapped = FALSE;
        for (int i=0; i < someArray.count - 1; i++) {
            if (someArray[i] < someArray[i+1]) {
                NSNumber *temp;
                temp = someArray[i];
                someArray[i] = someArray[i+1];
                someArray[i+1] = temp;
                booleanSwapped = TRUE;
            }
        }
    }
    
}


- (NSNumber*) findMin:(NSMutableArray *) someArray {
    [self sortAscending:someArray];
    NSLog(@"min value: %@", someArray[0]);
    return someArray[0];
}


- (NSNumber*) findMax:(NSMutableArray *) someArray {
    [self sortDescending:someArray];
    NSLog(@"max value: %@", someArray[0]);
    return someArray[0];
}

- (double) findAverage:(NSMutableArray *) someArray {
    
    double sum = 0;
    
    for (int i=0; i < someArray.count ; i++) {
        sum = sum + [someArray[i] doubleValue];
    }

    return (sum/someArray.count);
}


- (void) removeDuplicates:(NSMutableArray *) someArray {
    for (int i=0; i < someArray.count; i++) {
        for (int j=0; j < someArray.count - 1; j++) {
            if ([someArray[j] isEqualToNumber:someArray[j+1]]) {
                [someArray removeObjectAtIndex:j];
            }
        }
    }
}



- (NSMutableArray*) joinTwoArrays:(NSMutableArray *) firstArray secondArray: (NSMutableArray *) secondArray {
    
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    
    for (int i=0; i < firstArray.count; i++) {
        [resultArray addObject:firstArray[i]];
    }
    for (int i=0; i < secondArray.count; i++) {
        [resultArray addObject:secondArray[i]];
    }
    
    return resultArray;
}



@end
