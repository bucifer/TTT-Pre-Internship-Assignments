//
//  ProductPresentationLayer.h
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 10/15/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductPresentationLayer : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString * company;
@property (strong, nonatomic) NSNumber * order_id;

@end
