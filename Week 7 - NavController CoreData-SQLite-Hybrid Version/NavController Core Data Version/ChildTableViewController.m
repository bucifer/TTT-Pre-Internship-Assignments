//
//  ChildTableViewController.m
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 9/23/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "ChildTableViewController.h"
#import "ThirdViewController.h"

@interface ChildTableViewController ()

@end

@implementation ChildTableViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - TableView Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.productsArrayForAppropriateCompany.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    

    //order logic
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"order_id"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [self.productsArrayForAppropriateCompany sortedArrayUsingDescriptors:sortDescriptors];
    
    ProductPresentationLayer *selectedProduct = [sortedArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", selectedProduct.name];
    [[cell imageView] setImage: [UIImage imageNamed: selectedProduct.image]];
    return cell;
}




//IMPORTANT - this is the DELEGATE happens when you SELECT/PRESS on the row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedProduct = [self.productsArrayForAppropriateCompany objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"thirdViewSegue" sender:self];
}



//DELETE DELEGATE - everytime you delete something this state should get saved
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        ProductPresentationLayer *productToBeDeleted = [self.productsArrayForAppropriateCompany objectAtIndex:indexPath.row];
        
        [self.dao deleteProduct:productToBeDeleted];
        

        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ThirdViewController *thirdVC = [segue destinationViewController];
    if([segue.identifier isEqualToString:@"thirdViewSegue"]) {
        thirdVC.selectedProduct = self.selectedProduct;
    }
}

@end
