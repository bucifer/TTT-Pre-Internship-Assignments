//
//  Product.m
//  NavCtrl
//
//  Created by Aditya Narayan on 9/15/14.
//  Copyright (c) 2014 Aditya Narayan. All rights reserved.
//

#import "Product.h"

@implementation Product

@synthesize name;
@synthesize image;
@synthesize url;
@synthesize company;

- (id)initWithName:(NSString *)aName Image:(NSString*)imageName url:(NSString*)url Company:(NSString *)company{
    self = [super init];
    if (self) {
        // Any custom setup work goes here
        self.name = aName;
        self.image = imageName;
        self.url = url;
        self.company = company;
    }
    return self;
}


@end
