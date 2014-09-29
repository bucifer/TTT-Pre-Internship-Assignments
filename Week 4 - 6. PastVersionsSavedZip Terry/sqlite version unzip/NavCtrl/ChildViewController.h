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
#import "DAO.h"

@class WebViewController;

@interface ChildViewController : UITableViewController <UITableViewDataSource>

@property (retain, nonatomic) IBOutlet WebViewController *webVC;

@property (retain, nonatomic) IBOutlet UIWebView *myWebView;

@property (nonatomic, strong) Company *company;

@property (nonatomic, strong) DAO *dao;

@end
