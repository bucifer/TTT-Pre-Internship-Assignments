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
#import "Company.h"

@interface DEMOViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
    
    int selectedEmployeeIndex;
    BOOL editingMode;
    
}

@property(nonatomic, weak) IBOutlet UITableView *tblView;
@property(nonatomic, weak) IBOutlet UITextField *txtName;
@property(nonatomic, weak) IBOutlet UITextField *txtLocation;

@property (weak, nonatomic) IBOutlet UITextField *editTxtName;
@property (weak, nonatomic) IBOutlet UITextField *editTxtLoc;

@property(nonatomic) NSMutableArray *employees;
@property(nonatomic) NSManagedObjectContext *context;
@property(nonatomic) NSManagedObjectModel *model;


- (IBAction)add:(id)sender;
- (IBAction)edit:(id)sender;

-(NSString *) archivePath;
-(void)initModelContext;


-(void)createEmployee:(NSNumber*)emp_id name:(NSString*)name loc:(NSString*)loc;
-(void)deleteEmployee:(int)index;
-(void)saveChanges;

-(void)loadAllEmployees;

@end
