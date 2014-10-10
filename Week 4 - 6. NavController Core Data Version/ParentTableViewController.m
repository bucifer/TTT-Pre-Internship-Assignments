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

    [self startUpCoreDataLaunchLogic];
    [self initializeReachabilityObject];
}


- (void)viewWillAppear:(BOOL)animated {
    //viewWillAppear is 1) first time you see view or 2) when you leave the page and come back to it later
    [super viewWillAppear:animated];
    [self initializeNetworkManagerObjectForYahooFinanceAPI];
}


- (void) initializeNetworkManagerObjectForYahooFinanceAPI{
    self.terrysNetworkManager = [[TerrysNetworkManager alloc]init];
    self.terrysNetworkManager.parentTableVC = self;
    [self.terrysNetworkManager fireYahooRequest];
}


- (void) initializeReachabilityObject {
    self.terrysReachabilityManager = [[TerrysReachabilityManager alloc]init];
    self.terrysReachabilityManager.parentTableViewController = self;
    [[NSNotificationCenter defaultCenter] addObserver:self.terrysReachabilityManager selector:@selector(reachabilityDidChange:) name:kReachabilityChangedNotification object:nil];
}


- (void) startUpCoreDataLaunchLogic {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if([userDefaults boolForKey:@"notFirstLaunch"] == false)
    {
        NSLog(@"this is first time you are running the app");
        self.dao = [[DAO alloc] initFirstTime];
        //after first launch, you set this NSDefaults key so that for consequent launches, this block never gets run
        [userDefaults setBool:YES forKey:@"notFirstLaunch"];
        [userDefaults synchronize];
        
    } else {
        //if it's not the first time you are running the app, you fetch from Core Data and set your presentation layer;
        NSLog(@"not the first time you are running the app");
        [self fetchFromCoreDataAndSetYourPresentationLayerData];
        [self.tableView reloadData];
    }
}

- (void) fetchFromCoreDataAndSetYourPresentationLayerData {
    self.dao = [[DAO alloc]init];
    
    NSMutableArray *fetchedArray = [self.dao requestCDAndFetch:@"Company"];
    self.dao.companies = [[NSMutableArray alloc]init];
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"name = 'Apple'"];
    NSPredicate *samsungPredicate = [NSPredicate predicateWithFormat:@"name = 'Samsung'"];
    NSPredicate *htcPredicate = [NSPredicate predicateWithFormat:@"name = 'HTC'"];
    NSPredicate *motorolaPredicate = [NSPredicate predicateWithFormat:@"name = 'Motorola'"];
    
    [self.dao.companies addObject:[fetchedArray filteredArrayUsingPredicate:applePredicate][0]];
    [self.dao.companies addObject:[fetchedArray filteredArrayUsingPredicate:samsungPredicate][0]];
    [self.dao.companies addObject:[fetchedArray filteredArrayUsingPredicate:htcPredicate][0]];
    [self.dao.companies addObject:[fetchedArray filteredArrayUsingPredicate:motorolaPredicate][0]];
    
    self.dao.products = [self.dao requestCDAndFetch:@"Product"];
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
        childVC.products = self.dao.products;
        childVC.dao = self.dao;
        
        NSMutableArray* productsArrayForAppropriateCompany = [[NSMutableArray alloc]init];
        
        for (int i=0; i < childVC.products.count; i++) {
            Product* selectedProduct = childVC.products[i];
            if ([selectedProduct.company isEqualToString:childVC.selectedCompany.name]) {
                [productsArrayForAppropriateCompany addObject:selectedProduct];
            }
        }
        
        childVC.productsArrayForAppropriateCompany = productsArrayForAppropriateCompany;
    }
}

@end
