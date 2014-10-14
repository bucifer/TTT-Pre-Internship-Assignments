//
//  terrysLocationManager.m
//  Digital Leash - Parent App
//
//  Created by Aditya Narayan on 10/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "TerrysLocationManager.h"

@implementation TerrysLocationManager {
    int callCount;
}

- (id) init {
    self = [super init];
    if (self) {
        // Any custom setup work goes here
        [self startUpdatingLocationWithCoreLocationManager];
    }
    return self;
}




- (void) startUpdatingLocationWithCoreLocationManager {
    if([CLLocationManager locationServicesEnabled]){
        NSLog(@"location services enabled");
        id l = [[CLLocationManager alloc] init];
        self.locationManager = l;
        [l release];
        [self.locationManager setDelegate:self];
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];

        if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
            [self.locationManager requestAlwaysAuthorization];
        }
        
        [self.locationManager startUpdatingLocation];
    }
}


#pragma mark CLLocationManager Delegate Method
- (void)locationManager:(CLLocationManager *)locationManager didUpdateLocations:(NSArray *)locations {
    NSLog(@"Started updating Location");
    
    //Make an update only in beginning and then every 5th call
    if (callCount == 0 || callCount % 5 == 0) {
        self.myCLLocation = [locations lastObject];
        NSLog(@"%f", self.myCLLocation.coordinate.latitude);
        NSLog(@"%f", self.myCLLocation.coordinate.longitude);
        
        [self.myVC setLatLongFields];
        
    }
    
    callCount++;
}




- (void)locationManager: (CLLocationManager *)manager didFailWithError: (NSError *)error {
    NSLog(@"%@", [error localizedDescription]);
}






@end
