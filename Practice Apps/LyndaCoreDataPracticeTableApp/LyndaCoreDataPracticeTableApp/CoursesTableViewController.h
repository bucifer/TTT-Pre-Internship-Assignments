//
//  CoursesTableViewController.h
//  LyndaCoreDataPracticeTableApp
//
//  Created by Aditya Narayan on 10/16/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoursesTableViewController : UITableViewController


//you do this so that you can conveniently access the App Delegate's managedObjectContext
//you set it in AppDelegate's appDidFinishLoading
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;


//NSFetChedResultsController is used for the specific purpose of converting fetch results from Core Data to make a UITableView easy
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;



@end
