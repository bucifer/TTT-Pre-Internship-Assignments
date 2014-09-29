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


// This method is creating 4 things:
// 1. Creating ObjectModel which describes the schema.
// 2. Creating Amazon Dynabo DB client.
// 3. Creating table if not exist.
// 4. Creating Context using DynamoDB options.
-(void)initModelContext
{
    // 1. Creating ObjectModel which describes the schema.
    [self setModel:[NSManagedObjectModel mergedModelFromBundles:nil]];
    [NSPersistentStoreCoordinator registerStoreClass:[AWSPersistenceDynamoDBIncrementalStore class]
                                        forStoreType:AWSPersistenceDynamoDBIncrementalStoreType];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self model]];
    
    

    // 2. Creating Amazon Dynabo DB client.
    AmazonCredentials *credential = [[AmazonCredentials alloc]
                               initWithAccessKey:ACCESS_KEY_ID withSecretKey:SECRET_KEY];
    
    [self setDdb:[[AmazonDynamoDBClient alloc] initWithCredentials: credential ]];
    
    
    // 3. Creating table if not exist.
    [self createTable:@"Employee" pk:@"emp_id" type:@"N"];
    
    
    
    // 4. Creating Context using DynamoDB options.
    NSDictionary *hashKeys = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"emp_id", @"Employee", nil];
    NSDictionary *versions = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"version", @"Employee", nil];
    NSDictionary *tableMap = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"Employee", @"Employee", nil];
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             hashKeys, AWSPersistenceDynamoDBHashKey,
                             versions, AWSPersistenceDynamoDBVersionKey,
                             self, AWSPersistenceDynamoDBDelegate,
                             [self ddb], AWSPersistenceDynamoDBClient,
                             tableMap, AWSPersistenceDynamoDBTableMapper, nil];
    
    NSError *error = nil;
    if(![psc addPersistentStoreWithType:AWSPersistenceDynamoDBIncrementalStoreType
                                                 configuration:nil
                                                           URL:nil
                                                       options:options
                                                         error:&error])
    {
        // Handle the error.
        NSLog(@"Error: %@", error);
    }
    [self setContext:[[NSManagedObjectContext alloc] init]];
    [[self context] setPersistentStoreCoordinator:psc];
    [[self context] setUndoManager:nil];
    
    [[self context] setMergePolicy:[[NSMergePolicy alloc] initWithMergeType:NSMergeByPropertyStoreTrumpMergePolicyType]];
}

// Using this method we create a table at Amazon DynamoDB if it does not exist.
-(void)createTable:(NSString*)table_name pk:(NSString*)pk type:(NSString*)type
{
    @try
    {
        DynamoDBDescribeTableRequest *request = [[DynamoDBDescribeTableRequest alloc] initWithTableName:table_name];
        [[self ddb] describeTable:request];
        NSLog(@"Table Exist");
    }
    @catch(NSException *e)
    {
        DynamoDBCreateTableRequest *createTableRequest = [DynamoDBCreateTableRequest new];
        
        DynamoDBProvisionedThroughput *provisionedThroughput = [DynamoDBProvisionedThroughput new];
        provisionedThroughput.readCapacityUnits  = [NSNumber numberWithInt:1];
        provisionedThroughput.writeCapacityUnits = [NSNumber numberWithInt:1];
        
        DynamoDBKeySchemaElement *keySchemaElement = [[DynamoDBKeySchemaElement alloc] initWithAttributeName:pk andKeyType:@"HASH"];
        
        DynamoDBAttributeDefinition *attributeDefinition = [DynamoDBAttributeDefinition new];
        attributeDefinition.attributeName = pk;
        attributeDefinition.attributeType =type;
        
        createTableRequest.tableName = table_name;
        createTableRequest.provisionedThroughput = provisionedThroughput;
        [createTableRequest addKeySchema:keySchemaElement];
        [createTableRequest addAttributeDefinition:attributeDefinition];
        
        [[self ddb] createTable:createTableRequest];
        
        
        // Wait in a loop until the table is created.
        while(TRUE)
        {
            DynamoDBDescribeTableRequest *request = [[DynamoDBDescribeTableRequest alloc] initWithTableName:table_name];
            DynamoDBDescribeTableResponse *response = [[self ddb] describeTable:request];
            if([@"ACTIVE"isEqual:response.table.tableStatus])
            {
                NSLog(@"Table Created");
                return;
            }
            else{
                NSLog(@".");
                sleep(2);
            }
       }
        
    }
    

}

// Creating a member then save it to db and reload the data.
-(void)createEmployee:(NSNumber*)emp_id name:(NSString*)name loc:(NSString*)loc;
{
    Employee *e = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:[self context]];
    
    [e setEmp_id: emp_id ];
    [e setEmp_name: name];
    [e setEmp_location:loc];
    [self saveChanges];
    [[self employees] addObject:e];
    [[self tblView] reloadData];
}

// Delete employee from table and tableview datasource.
-(void)deleteEmployee:(int)index
{
    Employee *e = [[self employees] objectAtIndex:index];
    [[self context] deleteObject:e];
    [self saveChanges];
    [[self employees] removeObjectAtIndex:index];
    [[self tblView] reloadData];
}

// On calling this, actual saving is done in the Amazon DynamoDB table. 
-(void) saveChanges
{
    
    NSError *error;
    if (![[self context] save:&error])
    {
        NSLog(@"Error Saving: %@", error);
    }
    else
    {
         NSLog(@"Data Saved");
    }
}

// Loads all employees from Amazon DynamoDB Employee table into tableview datasource.
-(void) loadAllEmployees
{
    if(![self employees])
    {
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Employee" inManagedObjectContext:[self context]];
        [request setEntity:entity];
        NSError *error = nil;
        NSArray *fetchedResults = [[self context] executeFetchRequest:request error:&error];
        [self setEmployees:[fetchedResults mutableCopy]];
        NSLog(@"Employees Count %d", [[self employees] count]);
        
    }
    [[self tblView] reloadData];
}





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
    [[cell detailTextLabel] setText: [e emp_location] ];
    return cell;
}


- (void) tableView: (UITableView *)tableView  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deleteEmployee:indexPath.row];
}



@end
