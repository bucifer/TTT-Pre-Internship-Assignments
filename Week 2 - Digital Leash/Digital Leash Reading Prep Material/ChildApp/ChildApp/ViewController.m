//
//  ViewController.m
//  ChildApp
//
//  Created by Aditya Narayan on 1/17/14.
//  Copyright (c) 2014 TurnToTech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize userID;
@synthesize latitude;
@synthesize longitude;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    
    //--------Commented by Aditya --------
    //[locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CoreLocation Methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *cllocation = [locations lastObject];
    CLLocationCoordinate2D coordinate = [cllocation coordinate];
    latitude = [[NSNumber numberWithDouble:coordinate.latitude] stringValue];
    longitude = [[NSNumber numberWithDouble:coordinate.longitude] stringValue];
    
    
    
    //------- Added by Aditya -------
    
    //make a call every 10th time. Otherwise we get too many calls.
    
    NSLog(@"\n\nlatitude: %@\nlongitude: %@\n\n", latitude, longitude);
    
   
    callCount++; 
    
    if (! (callCount%10 == 0)  ) {

        return;
        
    } else {
        
    
    NSDictionary *childDict = @{@"utf8": @"✓", @"authenticity_token":@"EvZva3cKnzo3Y0G5R3NktucCr99o/2UWOPVAmJYdBOc=", @"user":@{@"username":self.userID,@"current_lat":self.latitude,@"current_longitude":self.longitude}, @"commit":@"Create User", @"action":@"update", @"controller":@"users"};
    NSString *urlString = [NSString stringWithFormat:@"http://protected-wildwood-8664.herokuapp.com/users/%@", userID];
    NSLog(@"%@\n\n", urlString);
    [self asynchronousJSON_PATCHRequestTo:urlString withData:[self JSON_data:childDict]];
        
    }
    
    

    //-------------------------------
    
//    NSLog(@"\n\nlatitude: %@\nlongitude: %@\n\n", latitude, longitude);
//
//    NSLog(@"Number: %d", [locations count]);
//    
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@", [error localizedDescription]);
}

#pragma mark - NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
    
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    NSLog(@"%@", [error localizedDescription]);
    
}

#pragma mark - UITextField Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == _username_textfield)
    {
        if(textField.text)
        {
            userID = [NSString stringWithString:textField.text];
        }
    }
    NSLog(@"%@", userID);
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - Misc Methods

-(void)printAllStringAttibutes
{
    NSLog(@"\n\n");
    NSLog(@"%@", userID);
    NSLog(@"\n");
}

- (void)asynchronousJSON_POSTRequestTo:(NSString*)url_name withData:(NSString*)data
{
    
    // Create the request object
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url_name]];
    
    // Specify that it will be a POST request
    request.HTTPMethod = @"POST";
    
    // This is how we set header fields
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    // Convert your data and set your request's HTTPBody property;
    NSData *requestBodyData = [data dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = requestBodyData;
    
    // Create url connection and fire request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    conn = nil;
}

- (void)asynchronousJSON_PATCHRequestTo:(NSString*)url_name withData:(NSData*)data
{
    
    // Create the request.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url_name]];
    
    // Specify that it will be a POST request
    request.HTTPMethod = @"PATCH";
    
    // This is how we set header fields
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    // Convert your data and set your request's HTTPBody property;
//    NSData *requestBodyData = [data dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = data;
    NSLog(@"\n\n%@", request.HTTPBody);
    
    // Create url connection and fire request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    conn = nil;
}

-(NSString*)toJSON:(NSDictionary*)dictionary
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
    
    if([NSJSONSerialization isValidJSONObject:jsonData])
    {
        jsonData = [NSJSONSerialization dataWithJSONObject:jsonData options:NSJSONWritingPrettyPrinted error:&error];
    }
    if(!jsonData)
    {
        NSLog(@"toJSON: error: %@", error.localizedDescription);
        return @"{}";
    }
    else
    {
        NSLog(@"\n\n%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

-(NSData*)JSON_data:(NSDictionary*)dictionary
{
    NSError *error;
    NSData *jsonData;// = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
    
    //--- Commented by Aditya
    //if([NSJSONSerialization isValidJSONObject:jsonData])

    //--- Added by Aditya
    if([NSJSONSerialization isValidJSONObject:dictionary])
   
    {
        //------ Commented by Aditya ---
        //jsonData = [NSJSONSerialization dataWithJSONObject:jsonData options:NSJSONWritingPrettyPrinted error:&error];
        
        //------ Added by Aditya ------
        jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
    }
    if(!jsonData)
    {
        NSLog(@"toJSON: error: %@", error.localizedDescription);
        return nil;
    }
    else
    {
//        NSLog(@"\n\n%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
        NSLog(@"\n\n%@", jsonData);
        return jsonData;
    }
}

#pragma mark - IBAction Methods

- (IBAction)GO_tapped:(id)sender
{
    
    //----------- Added by Aditya ---------

    [locationManager startUpdatingLocation];
    
    //-------------------------------------
    
//    NSLog(@"\n\nlatitude: %@\nlongitude: %@\n\n", latitude, longitude);

    //-------------Commented by Aditya. Moved to response from GPS ----------
    
//    NSDictionary *childDict = @{@"utf8": @"✓", @"authenticity_token":@"EvZva3cKnzo3Y0G5R3NktucCr99o/2UWOPVAmJYdBOc=", @"user":@{@"username":self.userID,@"current_lat":self.latitude,@"current_longitude":self.longitude}, @"commit":@"Create User", @"action":@"update", @"controller":@"users"};
//    
//    NSString *urlString = [NSString stringWithFormat:@"http://protected-wildwood-8664.herokuapp.com/users/%@", userID];
//    NSLog(@"%@\n\n", urlString);
//    
//    [self asynchronousJSON_PATCHRequestTo:urlString withData:[self JSON_data:childDict]];
}
@end
