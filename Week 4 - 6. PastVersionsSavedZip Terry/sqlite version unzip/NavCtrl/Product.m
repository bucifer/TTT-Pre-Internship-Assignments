//
//  Product.m
//  NavCtrl
//
//  Created by Aditya Narayan on 9/15/14.
//  Copyright (c) 2014 Aditya Narayan. All rights reserved.
//

#import "Product.h"

@implementation Product

- (id)initWithName:(NSString *)aName Image:(NSString*)imageName url:(NSString*)url{
    self = [super init];
    if (self) {
        // Any custom setup work goes here
        self.name = aName;
        self.image = imageName;
        self.url = url;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder;
{
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.image forKey:@"image"];
    [coder encodeObject:self.url forKey:@"url"];
}

- (id)initWithCoder:(NSCoder *)coder;
{
    self = [[Product alloc] init];
    if (self != nil)
    {
        self.name = [coder decodeObjectForKey:@"name"];
        self.image = [coder decodeObjectForKey:@"image"];
        self.url = [coder decodeObjectForKey:@"url"];
    }
    return self;
}



@end
