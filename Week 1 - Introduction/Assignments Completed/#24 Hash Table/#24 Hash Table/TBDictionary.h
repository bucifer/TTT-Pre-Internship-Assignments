//
//  TBDictionary.h
//  #24 Hash Table
//
//  Created by Aditya Narayan on 9/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBDictionary : NSObject
- (void) sayHello;
- (void) findValueAtKey:(id)key;
- (void) findKeyAtValue:(NSString *)value;
- (void) setValue:(NSString *)value forKey:(id)key;

@property NSMutableArray *keys;
@property NSMutableArray *values;

@end
