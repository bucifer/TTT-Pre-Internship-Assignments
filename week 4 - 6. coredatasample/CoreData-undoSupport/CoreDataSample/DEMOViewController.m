//
//  DEMOViewController.m
//  CoreDataSample
//
//  Created by Aditya on 07/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import "DEMOViewController.h"

@interface DEMOViewController ()

@end

@implementation DEMOViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    [self initModelContext];
    [self loadAllEmployees];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --- Core Data setup

//This method is creating 2 things:
// 1. Creating ObjectModel which describes the schema.
// 2. Creating Context.



-(void)initModelContext
{
    // 1. Creating ObjectModel which describes the schema.
    [self setModel:[NSManagedObjectModel mergedModelFromBundles:nil]];
    
    NSPersistentStoreCoordinator *psc =
    [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self model]];
    
    // 2. Creating Context.
    NSString *path = [self archivePath];
    NSURL *storeURL = [NSURL fileURLWithPath:path];
    NSError *error = nil;
    
    if(![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        [NSException raise:@"Open failed" format:@"Reason: %@", [error localizedDescription]];
    }
    
    [self setContext:[[NSManagedObjectContext alloc] init]];
    
    
    //Add an undo manager
    self.context.undoManager = [[NSUndoManager alloc] init];
    
    //3. Now the context points to the SQLite store
    [[self context] setPersistentStoreCoordinator:psc];
    //[[self context] setUndoManager:nil];
}

// Physical storage location in device.
-(NSString*) archivePath
{
    NSArray *documentsDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [documentsDirectories objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"store.data"];
}


#pragma mark --- UI Actions

// Adding a member in the table.
- (IBAction)add:(id)sender
{

    // Generating primary key using timestamp.
    NSNumber *pk = [NSNumber numberWithInt:[[NSDate date] timeIntervalSince1970]];
    NSLog(@"PK: %@", pk);
    
    // Call createEmployee with generated primary key and two NSString parameters name and location.
    [self createEmployee:pk name:[[self txtName] text] loc:[[self txtLocation] text] ];
    [[self txtName] setText:@""];
    [[self txtLocation] setText:@""];
}

// Delete a member from the table.
- (IBAction)edit:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if([[self tblView] isEditing])
    {
        [btn setTitle:@"Edit" forState:UIControlStateNormal];
    }
    else
    {
        [btn setTitle:@"Done" forState:UIControlStateNormal];
    }
    [[self tblView] setEditing:![[self tblView] isEditing]];
}


- (IBAction)saveToDisk:(id)sender {
    
    
    [self saveChanges];
    
}

- (IBAction)undoLastAction:(id)sender {
    
    [self.context undo];
    
    [self reloadDataFromContext];
    
}


- (IBAction)redoLastUndo:(id)sender {
    
    [self.context redo];
    
    [self reloadDataFromContext];
}

- (IBAction)rollbackAllChanges:(id)sender {
    
    [self.context rollback];
    
    [self reloadDataFromContext];
    
}



#pragma mark --- Data operations

// Creating a member then save it to Employee table and tableview datasource.
-(void)createEmployee:(NSNumber*)emp_id name:(NSString*)name loc:(NSString*)loc;
{

    //Add this object to the contex. Nothing happens till it is saved
    Employee *e = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:[self context]];
    
    [e setEmp_id: emp_id ];
    [e setEmp_name: name];
    [e setEmp_location:loc];
    
    
    //No save now. There is a separate 'Save to Disk' now to try undo functionality
    //[self saveChanges];
    
    [[self employees] addObject:e];
    [[self tblView] reloadData];
}

// Delete employee from table and tableview datasource.
-(void)deleteEmployee:(int)index
{
    
    editingMode = FALSE;
    
    Employee *e = [[self employees] objectAtIndex:index];
    
    //Remove object from context
    [[self context] deleteObject:e];
    
    
    //No save now. There is a separate 'Save to Disk' now to try undo functionality
   // [self saveChanges];
    
//    [[self employees] removeObjectAtIndex:index];
//    [[self tblView] reloadData];
    
    [self reloadDataFromContext];
}

- (IBAction)modifyEmployee:(id)sender {
    
    if (!editingMode) {
        
        return;
    }
    
    Employee *e = [[self employees] objectAtIndex:selectedEmployeeIndex];
    
    e.emp_name = self.editTxtName.text;
    e.emp_location = self.editTxtLoc.text;
    
    
    editingMode = FALSE;
    
    [self reloadDataFromContext];
    
    
}


-(void) reloadDataFromContext {
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    
    //A predicate template can also be used
    NSPredicate *p = [NSPredicate predicateWithFormat:@"emp_id >=0 and emp_name MATCHES '.*'"];
    [request setPredicate:p];
    
    
    
    //Change ascending  YES/NO and validate
    NSSortDescriptor *sortByName = [[NSSortDescriptor alloc]
                                    initWithKey:@"emp_id" ascending:YES];
    
    [request setSortDescriptors:[NSArray arrayWithObject:sortByName]];
    
    NSEntityDescription *e = [[[self model] entitiesByName] objectForKey:@"Employee"];
    [request setEntity:e];
    NSError *error = nil;
    
    
    //This gets data only from context, not from store
    NSArray *result = [[self context] executeFetchRequest:request error:&error];
    
    if(!result)
    {
        [NSException raise:@"Fetch Failed" format:@"Reason: %@", [error localizedDescription]];
    }
    
    [self setEmployees:[[NSMutableArray alloc]initWithArray:result]];
    
    [self.tblView reloadData];

    
}



// On calling this, actual saving is done in the Core Data table
-(void) saveChanges
{
    NSError *err = nil;
    BOOL successful = [[self context] save:&err];
    if(!successful)
    {
        NSLog(@"Error saving: %@", [err localizedDescription]);
    }
    NSLog(@"Data Saved");
}

// Loads all employees from Core Data Employee table into tableview datasource.
-(void) loadAllEmployees
{

    [self reloadDataFromContext];

}

#pragma mark --- Table related callbacks

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self employees] count];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!cell)
    {
        cell =
        [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    Employee *e = [[self employees] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText: [e emp_name] ];
    [[cell detailTextLabel] setText:[e emp_location]];
    return cell;
}


- (void) tableView: (UITableView *)tableView  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deleteEmployee:indexPath.row];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    selectedEmployeeIndex = indexPath.row;
    
    Employee * selected = [[self employees] objectAtIndex:selectedEmployeeIndex];
    
    self.editTxtName.text = selected.emp_name;
    self.editTxtLoc.text = selected.emp_location;
    
    editingMode = TRUE;
    
}



@end
