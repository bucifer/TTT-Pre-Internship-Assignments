//
//  ViewController.m
//  Digital Leash
//
//  Created by Aditya Narayan on 9/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //initialize your new custom objects here
    [self initTerrysLocationManagerCustomObject];
    [self initTerrysNetworkManagerCustomObject];
}



#pragma mark CLLocationManager + Custom Object Methods

- (void) initTerrysLocationManagerCustomObject{
    self.terrysLocationManager = [[TerrysLocationManager alloc]init];
    [self.terrysLocationManager startUpdatingLocationWithCoreLocationManager];
    self.terrysLocationManager.myVC = self;
}

- (void) setLatLongFields {
    self.latitudeTextfield.text = [[NSNumber numberWithDouble:self.terrysLocationManager.myCLLocation.coordinate.latitude]stringValue ];
    self.longitudeTextfield.text = @(self.terrysLocationManager.myCLLocation.coordinate.longitude).stringValue;
}

#pragma mark NSURLConnection + Custom Object Methods
- (void) initTerrysNetworkManagerCustomObject {
    self.terrysNetworkManager = [[TerrysNetworkManager alloc]init];
    self.terrysNetworkManager.myVC = self;
}




#pragma mark IBAction Methods
- (IBAction)createNewUserButton:(id)sender {
    
    if (self.usernameTextfield.text && self.usernameTextfield.text.length > 0)
        [self.terrysNetworkManager sendPOSTRequestCreateNewUser];
    else
        [self showAlertWhenStringTooShortForUsername];
    
}


- (void) sendPOSTRequestCreateNewUser {
    //creating the request URL
    NSURL *requestURL = [NSURL URLWithString:@"http://protected-wildwood-8664.herokuapp.com/users"];
    NSDictionary *userDetails = @{@"user": @{
                                          @"username": self.usernameTextfield,
                                          @"latitude": self.latitudeTextfield.text,
                                          @"longitude": self.longitudeTextfield.text,
                                          @"radius": self.radiusTextfield.text},
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
    
    [self afterPostRequestConfirmation];
}

- (void) afterPostRequestConfirmation {
    //Post-Request confirmation
    self.ConfirmLabel.text = [NSString stringWithFormat:@"You did it, %@!",self.usernameTextfield.text];
    self.tempStringHolder = self.usernameTextfield.text;
    self.usernameTextfield.text = @"";
}


- (void) showAlertWhenStringTooShortForUsername {
    NSLog(@"string too short");
    //Making a popup alert dialog
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Your username is too short"
                                                    message:@"Obviously, your username has to be at least 1 character"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}




- (IBAction)updateUserButton:(id)sender {
    if (self.usernameTextfield.text && self.usernameTextfield.text.length > 0) {
        [self zipItUpAndSendYourRequest];
    }
    
    else {
        NSLog(@"string too short");
        //Making a popup alert dialog WOOO
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Your username is too short"
                                                        message:@"Obviously, your username has to be at least 1 character"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)checkLocationButton:(id)sender {
    //creating the request URL
    NSString *urlstring = [NSString stringWithFormat: @"http://protected-wildwood-8664.herokuapp.com/users/%@.json", self.usernameTextfield.text];
    NSURL *requestURL = [NSURL URLWithString:urlstring];
    self.myURLRequest = [NSMutableURLRequest requestWithURL:requestURL];
    self.myURLRequest.HTTPMethod = @"GET";
    [self.myURLRequest setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //create url connection and fire the request you made above
    NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest: self.myURLRequest delegate: self];
    connect = nil;

}


#pragma mark Terry's Custom Methods
- (void) zipItUpAndSendYourRequest {
    //creating the request URL
    NSString *urlstring = [NSString stringWithFormat: @"http://protected-wildwood-8664.herokuapp.com/users/%@", self.usernameTextfield.text];
    NSURL *requestURL = [NSURL URLWithString:urlstring];
    NSDictionary *userDetails = @{@"user": @{
                                          @"username": self.usernameTextfield.text,
                                          @"latitude": self.latitudeTextfield.text,
                                          @"longitude": self.longitudeTextfield.text,
                                          @"radius": self.radiusTextfield.text},
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
    self.ConfirmLabel.text = [NSString stringWithFormat:@"You updated it, %@!",self.usernameTextfield.text];
    self.tempStringHolder = self.usernameTextfield.text;
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
        self.zoneConfirmationField.text = @"YES";
        self.zoneConfirmationField.backgroundColor = [UIColor greenColor];
    }
    else {
        NSLog(@"Not in Zone");
        self.zoneConfirmationField.text = @"NO";
        self.zoneConfirmationField.backgroundColor = [UIColor redColor];
        }
    
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"%@", [error localizedDescription]);
}






#pragma mark UITextFieldDelegate methods







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end