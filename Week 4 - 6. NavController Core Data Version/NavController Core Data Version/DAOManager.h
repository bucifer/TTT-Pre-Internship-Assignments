//
//  DAOManager.h
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 10/10/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAO.h"
#import "ParentTableViewController.h"


@class ParentTableViewController;

@interface DAOManager : NSObject

    @property ParentTableViewController *parentTableViewController;

    - (void) startUpCoreDataLaunchLogic;
    - (void) fetchFromCoreDataAndSetYourPresentationLayerData;

@end
