//
//  Company.h
//  NavCtrl
//
//  Created by Aditya Narayan on 9/15/14.
//  Copyright (c) 2014 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Company : NSObject 

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *products;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *stockSymbol;
@property (nonatomic, strong) NSNumber *stockPrice;

- (id)initWithName:(NSString *)aName Image:(NSString*)imageName symbol:(NSString*)aSymbol;

@end
