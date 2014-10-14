//
//  DAOManager.m
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 10/10/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "DAOManager.h"

@implementation DAOManager



- (void) startUpCoreDataLaunchLogic {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if([userDefaults boolForKey:@"notFirstLaunch"] == false)
    {
        NSLog(@"this is first time you are running the app");
        
        self.parentTableViewController.dao = [[DAO alloc] initFirstTime];
        //after first launch, you set this NSDefaults key so that for consequent launches, this block never gets run
        [userDefaults setBool:YES forKey:@"notFirstLaunch"];
        [userDefaults synchronize];
        
    } else {
        //if it's not the first time you are running the app, you fetch from Core Data and set your presentation layer;
        NSLog(@"not the first time you are running the app");
        [self fetchFromCoreDataAndSetYourPresentationLayerData];
        [self.parentTableViewController.tableView reloadData];
    }
    
}



- (void) fetchFromCoreDataAndSetYourPresentationLayerData {
    
    self.parentTableViewController.dao = [[DAO alloc]init];
    
    NSMutableArray *fetchedArray = [self.parentTableViewController.dao requestCDAndFetch:@"Company"];
    self.parentTableViewController.dao.companies = [[NSMutableArray alloc]init];
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"name = 'Apple'"];
    NSPredicate *samsungPredicate = [NSPredicate predicateWithFormat:@"name = 'Samsung'"];
    NSPredicate *htcPredicate = [NSPredicate predicateWithFormat:@"name = 'HTC'"];
    NSPredicate *motorolaPredicate = [NSPredicate predicateWithFormat:@"name = 'Motorola'"];
    
    [self.parentTableViewController.dao.companies addObject:[fetchedArray filteredArrayUsingPredicate:applePredicate][0]];
    [self.parentTableViewController.dao.companies addObject:[fetchedArray filteredArrayUsingPredicate:samsungPredicate][0]];
    [self.parentTableViewController.dao.companies addObject:[fetchedArray filteredArrayUsingPredicate:htcPredicate][0]];
    [self.parentTableViewController.dao.companies addObject:[fetchedArray filteredArrayUsingPredicate:motorolaPredicate][0]];
    
    self.parentTableViewController.dao.products = [self.parentTableViewController.dao requestCDAndFetchAndSort:@"Product" sortDescriptorByString:@"order_id"];
}




@end
