//
//  TerrysNetworkManager.m
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 10/10/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "TerrysNetworkManager.h"

@implementation TerrysNetworkManager


- (void) fireYahooRequest {
    //making URL Request;
    NSURL *everything_url = [NSURL URLWithString:@"http://download.finance.yahoo.com/d/quotes.csv?s=%40%5EDJI,AAPL,SSNLF,htcxf,MSI&f=sl1&e=.csv"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:everything_url];
    //specify that it is a GET request
    request.HTTPMethod = @"GET";
    
    //create url connection and fire the request you made before
    NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest: request delegate: self];
    
    [self.parentTableVC.tableView reloadData];

}
@end
