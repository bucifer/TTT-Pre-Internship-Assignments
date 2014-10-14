//
//  terrysLocationManager.h
//  Digital Leash - Parent App
//
//  Created by Aditya Narayan on 10/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "ViewController.h"

@class ViewController;

@interface TerrysLocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager* locationManager;
@property (nonatomic, strong) CLLocation *myCLLocation;
@property (nonatomic, retain) ViewController* myVC;

@property CLLocationCoordinate2D *latitude;
@property CLLocationCoordinate2D *longitude;

- (void) startUpdatingLocationWithCoreLocationManager;

@end
