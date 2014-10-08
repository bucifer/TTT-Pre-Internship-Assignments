//
//  TerrysNetworkManager.m
//  Digital Leash - Parent App
//
//  Created by Aditya Narayan on 10/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "TerrysNetworkManager.h"

@implementation TerrysNetworkManager


- (void) sendPOSTRequestCreateNewUser {
    //creating the request URL
    NSURL *requestURL = [NSURL URLWithString:@"http://protected-wildwood-8664.herokuapp.com/users"];
    NSDictionary *userDetails = @{@"user": @{
                                          @"username": self.myVC.usernameTextfield,
                                          @"latitude": self.myVC.latitudeTextfield.text,
                                          @"longitude": self.myVC.longitudeTextfield.text,
                                          @"radius": self.myVC.radiusTextfield.text},
                                  @"commit":@"Create User",
                                  @"action":@"update",
                                  @"controller":@"users"
                                  };
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userDetails options:0 error:&error];
    NSString *myJSONString;
    myJSONString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSData *myJSONrequest = [myJSONString dataUsingEncoding:NSUTF8StringEncoding];
    self.myURLRequest = [NSMutableURLRequest requestWithURL:requestURL];
    self.myURLRequest.HTTPMethod = @"POST";
    [self.myURLRequest setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [self.myURLRequest setHTTPBody: myJSONrequest];
    
    //create url connection and fire the request you made above
    NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest: self.myURLRequest delegate: self];
    connect = nil;
    
    [self.myVC afterPostRequestConfirmation];

}


@end
