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

@interface DAOManager : NSObject {
    sqlite3 *navctrlDB;
    NSString *dbPathString;
}

@property ParentTableViewController *parentTableViewController;
@property NSString* databaseChoice;


- (void) startUpDataLaunchLogic;
- (void) fetchFromCoreDataAndSetYourPresentationLayerData;
- (void) copyOrOpenSQLiteDB;
- (void) readCompanyFromDatabase;
- (void) readProductsFromDatabase;
- (void) deleteDataFromSQLite:(NSString *)deleteQuery;




@end
