//
//  TerrysReachabilityManager.h
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 10/10/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParentTableViewController.h"
#import "Reachability.h"

@class ParentTableViewController;
@class Reachability;

@interface TerrysReachabilityManager : NSObject {
    Reachability *internetReachableFoo;
}

@end
