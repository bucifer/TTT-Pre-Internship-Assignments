//
//  TerrysArrayChecker.m
//  Coding Challenge - Arrays
//
//  Created by Aditya Narayan on 10/3/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "TerrysArrayChecker.h"

@implementation TerrysArrayChecker

- (BOOL) isThisArraySorted:(NSArray *) someArray {
    
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
        NSLog(@"This array is sorted in descending order");
        return YES;
    }
    if (AscCounter == someArray.count - 1) {
        NSLog(@"This array is sorted in ascending order");
        return YES;
    }
    else {
        NSLog(@"This array is NOT sorted in any way");
    }
    return NO;
}



@end
