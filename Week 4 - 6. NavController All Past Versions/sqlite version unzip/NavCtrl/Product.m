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



@end
