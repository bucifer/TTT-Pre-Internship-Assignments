//
//  DAO.m
//  Digital Leash - Parent App
//
//  Created by Aditya Narayan on 10/7/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "DAO.h"

@implementation DAO


- (void) startUpdatingLocationWithCoreLocationManager {
    //For CLLocation
    if([CLLocationManager locationServicesEnabled]){
        NSLog(@"location services enabled");
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
//        [self.locationManager setDelegate:self];
//        [self.locationManager startUpdatingLocation];
        NSLog(@"Started updating Location");
    }
}



@end
