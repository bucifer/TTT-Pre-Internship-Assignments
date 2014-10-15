//
//  CompanyPresentationLayer.h
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 10/15/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompanyPresentationLayer : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *stockSymbol;
@property (nonatomic, strong) NSNumber *stockPrice;
@property (strong, nonatomic) NSNumber * order_id;


@property (nonatomic, strong) NSMutableArray *products;


@end
