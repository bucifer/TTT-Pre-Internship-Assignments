//
//  ParentTableViewController.h
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 9/23/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "Reachability.h"
#import "ChildTableViewController.h"
#import "TerrysNetworkManager.h"
#import "TerrysReachabilityManager.h"

@class Reachability;
@class TerrysNetworkManager;

@interface ParentTableViewController :UITableViewController 

@property Company *selectedCompany;
@property (strong, nonatomic) DAO *dao;
@property (strong, nonatomic) TerrysNetworkManager *terrysNetworkManager;
@property (strong, nonatomic) TerrysReachabilityManager *terrysReachabilityManager;


@property BOOL connectionLost;
- (void)reachabilityDidChange:(NSNotification *)notification;

 


@end
