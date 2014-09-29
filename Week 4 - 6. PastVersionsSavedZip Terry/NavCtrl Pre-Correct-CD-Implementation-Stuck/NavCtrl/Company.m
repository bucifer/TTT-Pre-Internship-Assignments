//
//  Company.m
//  NavCtrl
//
//  Created by Aditya Narayan on 9/15/14.
//  Copyright (c) 2014 Aditya Narayan. All rights reserved.
//

#import "Company.h"

@implementation Company

@synthesize name;
@synthesize image;
@synthesize stockSymbol;
@synthesize stockPrice;
@synthesize products;

- (id)initWithName:(NSString *)aName Image:(NSString*)imageName symbol:(NSString*)aSymbol{
    self = [super init];
    if (self) {
        self.name = aName;
        self.image = imageName;
        self.stockSymbol = aSymbol;
    }
    return self;
}

@end
