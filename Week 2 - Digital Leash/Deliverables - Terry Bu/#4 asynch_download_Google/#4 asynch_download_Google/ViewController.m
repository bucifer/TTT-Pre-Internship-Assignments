//
//  ViewController.m
//  #4 asynch_download_Google
//
//  Created by Aditya Narayan on 9/11/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Create the request for asynchronous download
    NSURL *GoogleimgURL = [NSURL URLWithString:@"https://www.google.com/images/srpr/logo11w.png"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:GoogleimgURL];
    //specify that it is a GET request
    request.HTTPMethod = @"GET";
    
    self.imageData = [[NSMutableData alloc]init];
    
    //create url connection and fire the request you made before
    NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest: request delegate: self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark NSURLConnection Delegate Methods 
//pragma marks make it easy to use Xcode jump bar to jump to different sections of your code, just a way of labeling your code so you can find it easier later

- (void) connection:(NSURLConnection* )connection didReceiveResponse:(NSURLResponse *)response {
    //this handler, gets hit ONCE
    //response has been received, we initialize the instance var we created in h file
    //then we append data to it in the didReceiveData method
//    responseData = [[NSMutableData alloc] init];
}

- (void)connection: (NSURLConnection *)connection didReceiveData:(NSData *) dataYouGot {
    //this handler, gets hit SEVERAL TIMES
    //Append new data to the instance variable everytime new data comes in
    [self.imageData appendData:dataYouGot];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
    //Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //this handler, gets hit ONCE
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now or do whatever you want
    

    
//    //if you just log out responseData here, 
//    NSString *strData = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", strData);
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}


- (IBAction)getGoogle:(id)sender {
    NSLog(@"fjdsafjs");
    //Create new UIIMAGE from the data
    UIImage *image = [[[UIImage alloc]init] initWithData:self.imageData];
    [self.myImageView setImage:image];
}

@end
