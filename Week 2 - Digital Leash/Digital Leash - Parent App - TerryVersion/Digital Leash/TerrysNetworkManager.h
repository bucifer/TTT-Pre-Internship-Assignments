//
//  TerrysNetworkManager.h
//  Digital Leash - Parent App
//
//  Created by Aditya Narayan on 10/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@class ViewController;

@interface TerrysNetworkManager : NSObject

@property ViewController *myVC;
@property (strong, nonatomic) NSMutableURLRequest *myURLRequest;

- (void) sendPOSTRequestCreateNewUser;


@end
