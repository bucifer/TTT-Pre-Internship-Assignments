//
//  DEMOViewController.h
//  CoreDataSample
//
//  Created by Aditya on 07/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import <AWSPersistence/AWSPersistenceDynamoDBIncrementalStore.h>
#import <AWSDynamoDB/AWSDynamoDB.h>
#import <AWSPersistence/AWSPersistence.h>
#import <AWSRuntime/AWSRuntime.h>
#import "Employee.h"

// KEYS to access Amazon DynamoDB.
#define ACCESS_KEY_ID   @"AKIAJI7PN6GZ3KHHPTGQ"
#define SECRET_KEY      @"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"


@interface DEMOViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>


//Declare property 
@property(nonatomic, weak) IBOutlet UITableView *tblView;
@property(nonatomic, weak) IBOutlet UITextField *txtName;
@property(nonatomic, weak) IBOutlet UITextField *txtLocation;

@property(nonatomic) AmazonDynamoDBClient *ddb;
@property(nonatomic) NSManagedObjectContext *context;
@property(nonatomic) NSManagedObjectModel *model;
@property(nonatomic) NSMutableArray *employees;


//Declare Methods

- (IBAction)add:(id)sender;
- (IBAction)edit:(id)sender;


-(void)initModelContext;

-(void)createTable:(NSString*)table_name pk:(NSString*)pk type:(NSString*)type;

-(void)createEmployee:(NSNumber*)emp_id name:(NSString*)name loc:(NSString*)loc;
-(void)deleteEmployee:(int)index;
-(void)saveChanges;

-(void)loadAllEmployees;

@end
