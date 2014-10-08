//
//  TerrysNetworkManager.m
//  Digital Leash - Parent App
//
//  Created by Aditya Narayan on 10/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "TerrysNetworkManager.h"

@implementation TerrysNetworkManager


- (void) checkLocation {
    //creating the request URL
    NSString *urlstring = [NSString stringWithFormat: @"http://protected-wildwood-8664.herokuapp.com/users/%@.json", self.myVC.usernameTextfield.text];
    NSURL *requestURL = [NSURL URLWithString:urlstring];
    self.myURLRequest = [NSMutableURLRequest requestWithURL:requestURL];
    self.myURLRequest.HTTPMethod = @"GET";
    [self.myURLRequest setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //create url connection and fire the request you made above
    NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest: self.myURLRequest delegate: self];
    connect = nil;
}

- (void) sendPOSTRequestCreateNewUser {
    //creating the request URL
    NSURL *requestURL = [NSURL URLWithString:@"http://protected-wildwood-8664.herokuapp.com/users"];
    NSDictionary *userDetails = @{@"user": @{
                                          @"username": self.myVC.usernameTextfield.text,
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

- (void) sendUpdateRequest {
    //creating the request URL
    NSString *urlstring = [NSString stringWithFormat: @"http://protected-wildwood-8664.herokuapp.com/users/%@", self.myVC.usernameTextfield.text];
    NSURL *requestURL = [NSURL URLWithString:urlstring];
    NSDictionary *userDetails = @{@"user": @{
                                          @"username": self.myVC.usernameTextfield.text,
                                          @"latitude": self.myVC.latitudeTextfield.text,
                                          @"longitude": self.myVC.longitudeTextfield.text,
                                          @"radius": self.myVC.radiusTextfield.text},
                                  @"commit":@"Create User",
                                  @"action":@"update",
                                  @"controller":@"users"
                                  };
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userDetails options:0 error:&error];
    NSString *myJSONString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSData *myJSONrequest = [myJSONString dataUsingEncoding:NSUTF8StringEncoding];
    
    self.myURLRequest = [NSMutableURLRequest requestWithURL:requestURL];
    self.myURLRequest.HTTPMethod = @"PATCH";
    [self.myURLRequest setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [self.myURLRequest setHTTPBody: myJSONrequest];
    
    //create url connection and fire the request you made above
    NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest: self.myURLRequest delegate: self];
    connect = nil;
    
    //Post-Request Confirmation
    self.myVC.ConfirmLabel.text = [NSString stringWithFormat:@"You updated it, %@!",self.myVC.usernameTextfield.text];
    self.myVC.tempStringHolder = self.myVC.usernameTextfield.text;
}



#pragma mark NSURLConnection Delegate Methods
- (void) connection:(NSURLConnection* )connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"%@", [response description]);
    responseData = [NSMutableData data];
    [responseData setLength:0];
}

- (void)connection: (NSURLConnection *)connection didReceiveData:(NSData *) data {
    //this handler, gets hit SEVERAL TIMES
    //Append new data to the instance variable everytime new data comes in
    
    [responseData appendData:data];
    
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
    //Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //this handler, gets hit ONCE
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now or do whatever you want
    
    NSLog(@"connection finished");
    NSLog(@"Succeeded! Received %lu bytes of data",(unsigned long)[responseData length]);
    
    //Convert your responseData object
    
    NSError *myError = nil;
    NSDictionary *responseDataInNSDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&myError];
    
    
    //Log it
    NSLog(@"%@", responseDataInNSDictionary[@"is_in_zone"]);
    
    if ([responseDataInNSDictionary[@"is_in_zone"]boolValue ] == YES) {
        NSLog(@"In Zone");
        self.myVC.zoneConfirmationField.text = @"YES";
        self.myVC.zoneConfirmationField.backgroundColor = [UIColor greenColor];
    }
    else {
        NSLog(@"Not in Zone");
        self.myVC.zoneConfirmationField.text = @"NO";
        self.myVC.zoneConfirmationField.backgroundColor = [UIColor redColor];
    }
    
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"%@", [error localizedDescription]);
}



@end
