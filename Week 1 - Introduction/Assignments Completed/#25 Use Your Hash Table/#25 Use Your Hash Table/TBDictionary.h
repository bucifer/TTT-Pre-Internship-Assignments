//
//  TBDictionary.h
//  #25 Use Your Hash Table
//
//  Created by Aditya Narayan on 9/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBDictionary : NSObject
- (void) sayHello;
- (void) findValueAtKey:(id)key;
- (void) findKeyAtValue:(id)value;
- (void) setValue:(id)value forKey:(id)key;

@property NSMutableArray *keys;
@property NSMutableArray *values;

@end
