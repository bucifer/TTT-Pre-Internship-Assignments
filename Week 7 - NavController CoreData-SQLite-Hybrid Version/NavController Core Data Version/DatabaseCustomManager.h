//
//  DAOManager.h
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 10/10/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAO.h"
#import "CompanyCoreData.h"
#import "CompanySQLite.h"
#import "ProductSQLite.h"
#import "CompanyPresentationLayer.h"
#import "ParentTableViewController.h"
#import "sqlite3.h"

@class ParentTableViewController;

typedef enum {SQLite, CoreData} DatabaseChoice;



@interface DatabaseCustomManager : NSObject {
    sqlite3 *navctrlDB;
    NSString *dbPathString;
}


@property ParentTableViewController *parentTableViewController;
@property DatabaseChoice databaseChoice;


- (void) startUpDataLaunchLogic;

- (void) fetchFromCoreDataAndSetYourPresentationLayerData;

- (void) copyOrOpenSQLiteDB;
- (void) readCompanyFromSQLDatabase;
- (void) readProductsFromSQLDatabase;
- (void) deleteDataFromSQLite:(NSString *)deleteQuery;

- (NSMutableArray *) convertSQLiteCompaniesInArrayToPresentationLayerCompanies: (NSMutableArray *)unconvertedArray;
- (NSMutableArray *) convertSQLiteProductsInArrayToPresentationLayerProducts: (NSMutableArray *)unconvertedArray;

- (NSMutableArray *) convertCoreDataCompaniesInArrayToPresentationLayerCompanies: (NSMutableArray *)unconvertedArray;
- (NSMutableArray *) convertCoreDataProductsInArrayToPresentationLayerProducts: (NSMutableArray *)unconvertedArray;

@end
