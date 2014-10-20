//
//  DAO.h
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 9/23/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CompanyCoreData.h"
#import "ProductCoreData.h"
#import "ChildTableViewController.h"
#import "DatabaseCustomManager.h"

@class ChildTableViewController;
@class DatabaseCustomManager;

@interface DAO : NSObject

@property (nonatomic, strong) ChildTableViewController *childTableViewController;
@property (nonatomic, strong) NSMutableArray* companies;
@property (nonatomic, strong) NSMutableArray* products;

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@property (nonatomic, strong) CompanyPresentationLayer* selectedCompany;
@property (nonatomic, strong) DatabaseCustomManager *databaseManager;


- (id) coreDataInitFirstTime;
- (void) deleteProduct: (ProductPresentationLayer*) product;
- (void) saveChanges;


- (CompanyCoreData*) coreDataInitCustomCDCompany: (NSString *)put_name image:(NSString*)put_image stockSymbol:(NSString *)put_symbol orderID:(NSNumber*)put_orderID moc:(NSManagedObjectContext*) context;

- (ProductCoreData*) coreDataInitCustomCDProduct: (NSString *)put_name image:(NSString*)put_image url:(NSString *)put_url company:(NSString *)put_company moc:(NSManagedObjectContext*) context orderID:(NSNumber *)put_order_id uniqueID:(NSNumber *)put_unique_id;



@end
