//
//  DAO.h
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 9/23/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Product.h"
#import "ParentTableViewController.h"


@class ParentTableViewController;

@interface DAO : NSObject

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@property (nonatomic, strong) NSMutableArray* companies;
@property (nonatomic, strong) NSMutableArray* products;
@property (nonatomic, strong) Company* selectedCompany;

@property (nonatomic, strong) ParentTableViewController *parentTableViewController;

- (void) startUpCoreDataLaunchLogic;


- (id)initFirstTime;
- (void) deleteProduct: (Product*) product;
-(void) saveChanges;
- (NSMutableArray *) requestCDAndFetch: (NSString *) entityName;

- (Company*) TBinitCompany: (NSString *)put_name image:(NSString*)put_image stockSymbol:(NSString *)put_symbol moc:(NSManagedObjectContext*) context;
- (Product*) TBinitProduct: (NSString *)put_name image:(NSString*)put_image url:(NSString *)put_url company:(NSString *)put_company moc:(NSManagedObjectContext*) context orderID:(NSNumber*)put_order_id;

@end
