//
//  ChildTableViewController.h
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 9/23/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyPresentationLayer.h"
#import "ProductPresentationLayer.h"
#import "DAO.h"

@class DAO;

@interface ChildTableViewController : UITableViewController <UITableViewDataSource>

@property (nonatomic) CompanyPresentationLayer *selectedCompany;
@property (nonatomic) ProductPresentationLayer *selectedProduct;
@property (nonatomic) NSMutableArray *productsArrayForAppropriateCompany;
@property (nonatomic) DAO *dao;

@end
