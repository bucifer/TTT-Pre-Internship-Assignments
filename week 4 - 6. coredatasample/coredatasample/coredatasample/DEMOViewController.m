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
    if(self){
        [self initModelContext];
        [self loadAllEmployees];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)add:(id)sender
{
    [self createEmployee:[NSNumber numberWithInteger:[employees count]]
                    name:[txtName text] loc:[txtLocation text] ];
}

- (IBAction)edit:(id)sender
{
    
    UIButton *btn = (UIButton *)sender;
     
    if([tblView isEditing]){
        [btn setTitle:@"Edit" forState:UIControlStateNormal];
    }
    else{
        [btn setTitle:@"Done" forState:UIControlStateNormal];
    }
    [tblView setEditing:![tblView isEditing]];
}

-(void)initModelContext
{
    model = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSPersistentStoreCoordinator *psc =
    [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    NSString *path = [self archivePath];
    NSURL *storeURL = [NSURL fileURLWithPath:path];
    NSError *error = nil;
    if(![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]){
        [NSException raise:@"Open failed" format:@"Reason: %@", [error localizedDescription]];
    }
    context = [[NSManagedObjectContext alloc] init];
    [context setPersistentStoreCoordinator:psc];
    [context setUndoManager:nil];
}

-(NSString*) archivePath
{
    NSArray *documentsDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [documentsDirectories objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"store.data"];
}


-(void)createEmployee:(NSNumber*)emp_id name:(NSString*)name loc:(NSString*)loc;
{
    Employee *e = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
    
    [e setEmp_id: emp_id ];
    [e setEmp_name: name];
    [e setEmp_location:loc];
    [self saveChanges];
    [employees addObject:e];
    [tblView reloadData];
}

-(void)deleteEmployee:(int)index
{
    Employee *e = [employees objectAtIndex:index];
    [context deleteObject:e];
    [self saveChanges];
    [employees removeObjectAtIndex:index];
    [tblView reloadData];
}

-(void) saveChanges
{
    NSError *err = nil;
    BOOL successful = [context save:&err];
    if(!successful){
        NSLog(@"Error saving: %@", [err localizedDescription]);
    }
    NSLog(@"Data Saved");
}


-(void) loadAllEmployees
{
    if(!employees){
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        //NSPredicate *p = [NSPredicate predicateWithFormat:@"emp_id >1"];
        //[request setPredicate:p];
        NSEntityDescription *e = [[model entitiesByName] objectForKey:@"Employee"];
        [request setEntity:e];
        NSError *error = nil;
        NSArray *result = [context executeFetchRequest:request error:&error];
        if(!result){
            [NSException raise:@"Fetch Failed" format:@"Reason: %@", [error localizedDescription]];
        }
        employees = [[NSMutableArray alloc]initWithArray:result];
        NSLog(@"Employees Count %d", [employees count]);
    }
    [tblView reloadData];
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [employees count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!cell){
        cell =
        [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    Employee *e = [employees objectAtIndex:[indexPath row]];
    [[cell textLabel] setText: [e emp_name] ];
    [[cell detailTextLabel] setText:[e emp_location]];
    return cell;
}


- (void) tableView: (UITableView *)tableView  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deleteEmployee:indexPath.row];
}



@end
