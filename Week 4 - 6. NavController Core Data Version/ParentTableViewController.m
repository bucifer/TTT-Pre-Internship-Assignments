//
//  ParentTableViewController.m
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 9/23/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "ParentTableViewController.h"

@interface ParentTableViewController ()
@end


@implementation ParentTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Mobile device makers";
    
    
    [self initializeDAOManager];
    [self initializeReachabilityObject];
}


- (void)viewWillAppear:(BOOL)animated {
    //viewWillAppear is 1) first time you see view or 2) when you leave the page and come back to it later
    [self initializeNetworkManagerObjectForYahooFinanceAPI];
}




- (void) initializeDAOManager {
    self.terrysDAOManager = [[DAOManager alloc]init];
    self.terrysDAOManager.parentTableViewController = self;
    [self.terrysDAOManager startUpCoreDataLaunchLogic];
}

- (void) initializeReachabilityObject {
    self.terrysReachabilityManager = [[TerrysReachabilityManager alloc]init];
    self.terrysReachabilityManager.parentTableViewController = self;
    [[NSNotificationCenter defaultCenter] addObserver:self.terrysReachabilityManager selector:@selector(reachabilityDidChange:) name:kReachabilityChangedNotification object:nil];
}

- (void) initializeNetworkManagerObjectForYahooFinanceAPI{
    self.terrysNetworkManager = [[TerrysNetworkManager alloc]init];
    self.terrysNetworkManager.parentTableVC = self;
    [self.terrysNetworkManager fireYahooRequest];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dao.companies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
        Company * selectedCompany = [self.dao.companies objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", selectedCompany.name, selectedCompany.stockPrice];
        [[cell imageView] setImage: [UIImage imageNamed: selectedCompany.image]];
        
        if (self.terrysReachabilityManager.connectionLost != YES){
            cell.textLabel.backgroundColor = [UIColor whiteColor];
        } else {
            cell.textLabel.text = [NSString stringWithFormat:@"%@ %@ (stock price outdated due to loss of internet connection)", selectedCompany.name, selectedCompany.stockPrice];
            cell.textLabel.backgroundColor = [UIColor redColor];
        }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedCompany = [self.dao.companies objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"childViewSegue" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ChildTableViewController *childVC = [segue destinationViewController];
    
    if([segue.identifier isEqualToString:@"childViewSegue"]) {
        childVC.title = [self.selectedCompany valueForKey:@"name"];
        childVC.selectedCompany = self.selectedCompany;
        childVC.dao = self.dao;
        
        //try using predicate instead
        NSPredicate *selectedCompanyPredicate = [NSPredicate predicateWithFormat:@"company = %@", self.selectedCompany.name];
        childVC.productsArrayForAppropriateCompany = [[self.dao.products filteredArrayUsingPredicate:selectedCompanyPredicate]mutableCopy];
    }
}

@end
