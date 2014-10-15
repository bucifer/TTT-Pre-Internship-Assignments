//
//  CompanyCoreData.h
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 10/15/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CompanyCoreData : NSManagedObject

@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * stockPrice;
@property (nonatomic, retain) NSString * stockSymbol;
@property (nonatomic, retain) NSNumber * order_id;


@end
