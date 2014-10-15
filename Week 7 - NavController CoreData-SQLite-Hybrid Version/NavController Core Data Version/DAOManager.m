//
//  DAOManager.m
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 10/10/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "DAOManager.h"

@implementation DAOManager


//- (id) initWithAppDatabaseOption:(NSString *)databaseOption{
//    self = [super init];
//    if (self) {
//        // Any custom setup work goes here
//        self.databaseChoice = databaseOption;
//    }
//    return self;
//
//}


- (void) startUpDataLaunchLogic {
    
    [self setDatabaseChoice:@"Core Data"]; //set to Core Data or SQLite Here
    
    if ([self.databaseChoice  isEqual: @"Core Data"]) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        if([userDefaults boolForKey:@"notFirstLaunch"] == false)
        {
            NSLog(@"this is first time you are running the app - create CD Data");
            
            self.parentTableViewController.dao = [[DAO alloc] initFirstTime];
            //after first launch, you set this NSDefaults key so that for consequent launches, this block never gets run
            [userDefaults setBool:YES forKey:@"notFirstLaunch"];
            [userDefaults synchronize];
            
        }
        else {
            //if it's not the first time you are running the app, you fetch from Core Data and set your presentation layer;
            NSLog(@"not the first time you are running the app - fetching CD data");
            [self fetchFromCoreDataAndSetYourPresentationLayerData];
            [self.parentTableViewController.tableView reloadData];
        }
    }
    
    if ([self.databaseChoice isEqual: @"SQLite"]) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        if([userDefaults boolForKey:@"notFirstLaunch"] == false)
        {
            [self copyOrOpenSQLiteDB];
            
        }
        else {

        }
    }
    
    
}




- (void) fetchFromCoreDataAndSetYourPresentationLayerData {
    
    self.parentTableViewController.dao = [[DAO alloc]init];
    
    NSMutableArray *fetchedArray = [self.parentTableViewController.dao requestCDAndFetchAndSort:@"CompanyCoreData" sortDescriptorByString:@"order_id"];
    
    
    //in this case, you won't be using fetchedArray directly (because you don't want to use Managed Objects. Instead, you will convert them into Presentation Layer objects)
    //translate everything to Presentation Layer Companies
    NSMutableArray *convertedCompanies = [[NSMutableArray alloc]init];
    for (int i=0; i < fetchedArray.count; i++) {
        CompanyCoreData *selectedCompanyCoreData = fetchedArray[i];
        CompanyPresentationLayer *companyPresentationLayer = [[CompanyPresentationLayer alloc]init];
        companyPresentationLayer.name = selectedCompanyCoreData.name;
        companyPresentationLayer.image = selectedCompanyCoreData.image;
        companyPresentationLayer.stockPrice = selectedCompanyCoreData.stockPrice;
        companyPresentationLayer.stockSymbol = selectedCompanyCoreData.stockSymbol;
        [convertedCompanies addObject:companyPresentationLayer];
    }
    
    self.parentTableViewController.dao.companies = convertedCompanies;
    
    self.parentTableViewController.dao.products = [self.parentTableViewController.dao requestCDAndFetchAndSort:@"ProductCoreData" sortDescriptorByString:@"order_id"];
}


-(void)copyOrOpenSQLiteDB
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    dbPathString = [docPath stringByAppendingPathComponent:@"terry.sqlite3"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:dbPathString]) {
        //if we don't find something at the datapath, we copy one from the desktop.
        NSLog(@"we couldn't find a database at your dbPathstring so we are going to copy");
        NSError *copyError;
        NSString *desktopDBPath = @"/Users/adityanarayan/Desktop/terry.sqlite3";
        BOOL readFromDesktopSuccess = [fileManager fileExistsAtPath:desktopDBPath];
        if (readFromDesktopSuccess) {
            BOOL copySuccess;
            copySuccess = [fileManager copyItemAtPath:desktopDBPath toPath:dbPathString error:&copyError];
            NSLog(@"Copy success!");
            if (!copySuccess) NSAssert1(0, @"Failed with message '%@'.", [copyError localizedDescription]);
        }
        else {
            NSLog(@"Failed to locate desktop database");
        }
    }
    else {
        //But if we do find something already existing, then we just open it
        NSLog(@"We found an existing db file at your dbPathString so reading from internal device data");
        [self readCompanyFromDatabase];
        [self readProductsFromDatabase];
    }
}

- (void) readCompanyFromDatabase {
    sqlite3_stmt *statement ;
    if (sqlite3_open([dbPathString UTF8String], &navctrlDB)==SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM COMPANY"];
        const char *query_sql = [querySQL UTF8String];
        if (sqlite3_prepare(navctrlDB, query_sql, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement)== SQLITE_ROW)
            {
                NSString *name = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                NSString *image = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                NSString *stockSymbol = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 3)];
                CompanySQLite *company = [[CompanySQLite alloc]init];
                company.name = name;
                company.image = image;
                company.stockSymbol = stockSymbol;
                company.products = [[NSMutableArray alloc] init];
                [self.parentTableViewController.dao.companies addObject:company];
            }
        }
    }
    sqlite3_finalize(statement);
    sqlite3_close(navctrlDB);
    NSLog(@"We read from the Company Table");
}

- (void) readProductsFromDatabase {
    //put it in different statement
    sqlite3_stmt *statement = NULL;
    if (sqlite3_open([dbPathString UTF8String], &navctrlDB)==SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM PRODUCT"];
        const char *query_sql = [querySQL UTF8String];
        if (sqlite3_prepare(navctrlDB, query_sql, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement)== SQLITE_ROW)
            {
                NSString *name = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                NSString *image = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                NSString *url = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 3)];
                NSString* company = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 4)];
                NSNumber *unique_id = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 0)];
                
                ProductSQLite *product = [[ProductSQLite alloc]init];
                product.name = name;
                product.image = image;
                product.url = url;
                product.company = company;
                product.unique_id = unique_id;
                
                ////loop through every company in your companies array,
                ////if the selected product's company property equals a certain company, then you put it in the company.products array
            }
        }
    }
    sqlite3_finalize(statement);
    sqlite3_close(navctrlDB);
    NSLog(@"We read from the Product Table");
}




@end
