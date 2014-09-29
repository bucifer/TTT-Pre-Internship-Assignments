//
//  Company.m
//  NavCtrl
//
//  Created by Aditya Narayan on 9/15/14.
//  Copyright (c) 2014 Aditya Narayan. All rights reserved.
//

#import "Company.h"

@implementation Company


- (id)initWithName:(NSString *)aName Image:(NSString*)imageName symbol:(NSString*)aSymbol{
    self = [super init];
    if (self) {
        // Any custom setup work goes here
        self.name = aName;
        self.image = imageName;
        self.stockSymbol = aSymbol;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder;
{
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.image forKey:@"image"];
    [coder encodeObject:self.stockSymbol forKey:@"stockSymbol"];
    [coder encodeObject:self.stockPrice forKey:@"stockPrice"];
    [coder encodeObject: self.products forKey:@"products"];
}

- (id)initWithCoder:(NSCoder *)coder;
{
    self = [[Company alloc] init];
    if (self != nil)
    {
        self.name = [coder decodeObjectForKey:@"name"];
        self.image = [coder decodeObjectForKey:@"image"];
        self.stockSymbol = [coder decodeObjectForKey:@"stockSymbol"];
        self.stockPrice = [coder decodeObjectForKey:@"stockPrice"];
        self.products = [coder decodeObjectForKey:@"products"];

    }
    return self;
}

@end
