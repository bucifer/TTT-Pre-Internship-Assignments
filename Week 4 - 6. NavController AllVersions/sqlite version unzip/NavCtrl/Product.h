//
//  Product.h
//  NavCtrl
//
//  Created by Aditya Narayan on 9/15/14.
//  Copyright (c) 2014 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject <NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *url;

- (id)initWithName:(NSString *)aName Image:(NSString*)imageName url:(NSString*)url;
- (void)encodeWithCoder:(NSCoder *)coder;
- (id)initWithCoder:(NSCoder *)coder;

@end
