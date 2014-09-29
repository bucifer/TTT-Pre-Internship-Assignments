//
//  qcdDemoViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Company.h"
#import "Product.h"
#import "DAO.h"
#import "Reachability.h"
#import <CoreData/CoreData.h>

@class ChildViewController;

@interface qcdDemoViewController : UITableViewController {
    
    Reachability *internetReachableFoo;

}

@property (nonatomic, strong) DAO *dao;
@property (nonatomic, retain) NSArray *companyList;
@property (nonatomic, retain) IBOutlet  ChildViewController * childVC;

- (BOOL)connected;



@end
