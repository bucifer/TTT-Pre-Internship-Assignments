//
//  DEMOViewController.h
//  CoreDataSample
//
//  Created by Aditya on 07/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "Employee.h"


@interface DEMOViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
    __weak IBOutlet UITableView *tblView;
    __weak IBOutlet UITextField *txtName;
    __weak IBOutlet UITextField *txtLocation;
    
    NSMutableArray *employees;
    
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;

}

- (IBAction)add:(id)sender;
- (IBAction)edit:(id)sender;

-(NSString *) archivePath;
-(void)initModelContext;


-(void)createEmployee:(NSNumber*)emp_id name:(NSString*)name loc:(NSString*)loc;
-(void)deleteEmployee:(int)index;
-(void)saveChanges;

-(void)loadAllEmployees;

@end
