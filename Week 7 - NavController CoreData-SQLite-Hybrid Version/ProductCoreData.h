//
//  ProductCoreData.h
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 10/15/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ProductCoreData : NSManagedObject

@property (nonatomic, retain) NSString * company;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * order_id;
@property (nonatomic, retain) NSString * url;

@end
