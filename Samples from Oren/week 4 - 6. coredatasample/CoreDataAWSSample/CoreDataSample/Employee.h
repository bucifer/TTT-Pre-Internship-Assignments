//
//  Employee.h
//  CoreDataSample
//
//  Created by Aditya on 07/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Employee : NSManagedObject

@property (nonatomic, retain) NSNumber * emp_id;
@property (nonatomic, retain) NSString * emp_location;
@property (nonatomic, retain) NSString * emp_name;

@end
