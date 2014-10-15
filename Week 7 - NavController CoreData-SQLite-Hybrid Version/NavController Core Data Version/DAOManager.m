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
    
    [self setDatabaseChoice:@"Core Data"];
    
    if ([self.databaseChoice  isEqual: @"Core Data"]) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        if([userDefaults boolForKey:@"notFirstLaunch"] == false)
        {
            NSLog(@"this is first time you are running the app - create CD Data");
            
            self.parentTableViewController.dao = [[DAO alloc] initFirstTime];
            //after first launch, you set this NSDefaults key so that for consequent launches, this block never gets run
            [userDefaults setBool:YES forKey:@"notFirstLaunch"];
            [userDefaults synchronize];
            
        } else {
            //if it's not the first time you are running the app, you fetch from Core Data and set your presentation layer;
            NSLog(@"not the first time you are running the app - fetching CD data");
            [self fetchFromCoreDataAndSetYourPresentationLayerData];
            [self.parentTableViewController.tableView reloadData];
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




@end
