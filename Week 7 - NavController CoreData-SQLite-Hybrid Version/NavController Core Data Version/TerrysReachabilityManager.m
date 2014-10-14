//
//  TerrysReachabilityManager.m
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 10/10/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "TerrysReachabilityManager.h"

@implementation TerrysReachabilityManager





#pragma mark Reachability methods

- (void)reachabilityDidChange:(NSNotification *)notification {
    Reachability *reachability = (Reachability *)[notification object];
    
    if ([reachability isReachable]) {
        NSLog(@"Reachable");
        self.connectionLost = NO;
    } else if (![reachability isReachable]) {
        NSLog(@"Unreachable");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Network Connection Alert" message:@"Network Connection Off or Unreachable" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [alert show];
        
        self.connectionLost = YES;
        
        [self.parentTableViewController.tableView reloadData];
    }
}


@end




