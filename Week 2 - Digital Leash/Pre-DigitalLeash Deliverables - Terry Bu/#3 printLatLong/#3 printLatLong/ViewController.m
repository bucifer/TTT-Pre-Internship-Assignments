//
//  ViewController.m
//  #3 printLatLong
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
    
    if([CLLocationManager locationServicesEnabled]){
        NSLog(@"location services enabled");
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [self setLocationManager: locationManager];
        [self.locationManager setDelegate:self]; //locationManager was declared as a property of ViewController in the h file - that's why the dot syntax works here
        [self.locationManager startUpdatingLocation];
        NSLog(@"Started updating Location");
    }

}

//callback method
- (void)locationManager:(CLLocationManager *)locationManager
    didUpdateLocations:(NSArray *)locations {
        self.myLocation = [locations lastObject];
        NSLog(@"%f", self.myLocation.coordinate.latitude);
        NSLog(@"%f", self.myLocation.coordinate.longitude);
}

//button action
- (IBAction)getLocationButton:(id)sender {
    
    self.LatLabel.text = [NSString stringWithFormat: @"%.2f", self.myLocation.coordinate.latitude];
    self.LongLabel.text = [NSString stringWithFormat: @"%.2f", self.myLocation.coordinate.longitude];
    
    NSLog(@"the latitude is %f", self.myLocation.coordinate.latitude); //in order to make myLocation available to both the callback method and the button action, you needed to make myLocation a PROPERTY of ViewController - then the scope issue goes away
    NSLog(@"the longitude is %f", self.myLocation.coordinate.longitude);
    
}

//Below is error-message code
- (void)locationManager:(CLLocationManager *)locationManager
       didFailWithError:(NSError *)error {
        NSLog(@"Error while getting core location : %@",[error localizedFailureReason]);
        if ([error code] == kCLErrorDenied) {
            NSLog(@"denied");
        }
        [locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
