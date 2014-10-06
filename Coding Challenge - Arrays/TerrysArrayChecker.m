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
    
    BOOL duplicateFound = TRUE;
    
    while (duplicateFound) {
        duplicateFound = FALSE;
        for (int i=0; i < someArray.count; i++) {
            for (int j=i+1; j < someArray.count; j++) {
                if ([someArray[i] isEqualTo:someArray[j]]) {
                    [someArray removeObjectAtIndex:j];
                    duplicateFound = TRUE;
                }
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


- (NSMutableArray *) uniqueJoinTwoArrays:(NSMutableArray *) firstArray secondArray: (NSMutableArray *) secondArray {
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    
    for (int i=0; i < firstArray.count; i++) {
        [resultArray addObject:firstArray[i]];
    }
    for (int i=0; i < secondArray.count; i++) {
        [resultArray addObject:secondArray[i]];
    }
    
    [self removeDuplicates:resultArray];
    
    return resultArray;
}


- (NSMutableArray *) removeIntersection:(NSMutableArray *) firstArray secondArray: (NSMutableArray *) secondArray {
    
    NSMutableArray *intersectionArray = [self findIntersection:firstArray secondArray:secondArray];
    
    NSMutableArray *resultArray = [[NSMutableArray alloc]initWithArray:firstArray];
    
    
    //now, if you find an intersection between the intersection array, and the result array, then you delete that particular item from the result array
    
        for (int i=0; i < intersectionArray.count; i++) {
            
            for (int j=0; j < resultArray.count; j++) {
                if ([resultArray[j] isEqualTo:intersectionArray[i]]) {
                    [resultArray removeObjectAtIndex:j];
                }
            }
            
            
        }
    
    
    return resultArray;
}


- (NSMutableArray *) findIntersection:(NSMutableArray *) firstArray secondArray: (NSMutableArray *) secondArray {
    
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    
    for (int i=0; i < firstArray.count; i++) {
        for (int j=0; j < secondArray.count; j++) {
            if ([firstArray[i] isEqualTo:secondArray[j]]) {
                [resultArray addObject:firstArray[i]];
                break;
            }
        }
    }
    return resultArray;
}

- (NSMutableArray *) reverseArray:(NSMutableArray *) someArray {
    
    //[a, b, c, d, e]
    //temp = array[end] -- e
    //array[end] = array[0] -- a
    //array[0] = temp; -- e
    //[e, b, c, d, a]
    //i goes up by 1
    //temp = array [end-1]
    //array[end-1] = array[1]
    //array[1] = temp;
    //[e, d, c, b, a]
    //we stop here - we just run this algorithm until we hit the midpoint which is length/2
    
    int end = someArray.count-1;
    
    for (int i=0; i < someArray.count/2 ; i++) {
        id temp;
        temp = someArray[end-i];
        someArray[end-i] = someArray[i];
        someArray[i] = temp;
    }
    
    return someArray;
}


@end
