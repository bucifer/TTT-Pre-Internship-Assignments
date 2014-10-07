//
//  ChildViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Company.h"
#import "Product.h"

@class WebViewController;

@interface ChildViewController : UITableViewController <UITableViewDataSource>

@property (retain, nonatomic) WebViewController *webVC;

@property (nonatomic, strong) Company *company;

@end
