//
//  DAO.h
//  NavCtrl
//
//  Created by Aditya Narayan on 9/16/14.
//  Copyright (c) 2014 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Product.h"

@interface DAO : NSObject

@property (nonatomic, strong) NSMutableArray* companies;

- (id)init;

@end
