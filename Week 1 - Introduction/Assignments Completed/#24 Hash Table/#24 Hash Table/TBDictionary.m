//
//  TBDictionary.m
//  #24 
//
//  Created by Aditya Narayan on 9/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "TBDictionary.h"

@implementation TBDictionary

- (id) init {
    if (self = [super init]) {
        self.keys = [[NSMutableArray alloc] initWithObjects: nil];
        self.values = [[NSMutableArray alloc] initWithObjects: nil];
    }
    return self;
}

- (void) findValueAtKey:(id)key {
    //find the index of the passed argument key out of the keys arrays
    //What index is it?
    NSUInteger index = [self.keys indexOfObject:key];
    
    //then find the value with the same index in the values array
    NSString *resultValue = self.values[index];
    
    NSLog(@"%@", resultValue);
}

- (void) findKeyAtValue:(id)value {
    NSUInteger index = [self.values indexOfObject:value];
    //then find the value with the same index in the keys array
    NSString *resultKey = self.keys[index];
    
    NSLog(@"%@", resultKey);
}

- (void) setValue:(id)value forKey:(id)key {
    //Duplicates Test
    //if the array already has that key, don't add any new keys or values
    //find the index of the key, and replace the old value with the new value
    if ([self.keys containsObject:key]) {
        NSUInteger index = [self.keys indexOfObject:key];
        //then find the value with the same index in the values array
        self.values[index] = value;
        return;
    }
    else {
        //else, add the key and value to the end of each respective array
        [self.keys addObject:key];
        [self.values addObject: value];
    }
    
}

- (void) sayHello
{
    NSLog(@"Hello, I'm TBDictionary");
}

@end
