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
#import "DAOManager.h"

@class ChildTableViewController;
@class DAOManager;

@interface DAO : NSObject

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@property (nonatomic, strong) NSMutableArray* companies;
@property (nonatomic, strong) NSMutableArray* products;
@property (nonatomic, strong) CompanyPresentationLayer* selectedCompany;
@property (nonatomic, strong) ChildTableViewController *childTableViewController;
@property (nonatomic, strong) DAOManager *daoManager;

//DAOManager property is for SETTING DATABASE OPTION logic
//DAO does something different according to Core Data or SQLite


- (id) initFirstTime;
- (void) deleteProduct: (ProductPresentationLayer*) product;
- (void) saveChanges;


- (CompanyCoreData*) TBinitCompany: (NSString *)put_name image:(NSString*)put_image stockSymbol:(NSString *)put_symbol orderID:(NSNumber*)put_orderID moc:(NSManagedObjectContext*) context;

- (ProductCoreData*) TBinitProduct: (NSString *)put_name image:(NSString*)put_image url:(NSString *)put_url company:(NSString *)put_company moc:(NSManagedObjectContext*) context orderID:(NSNumber *)put_order_id uniqueID:(NSNumber *)put_unique_id;

@end
