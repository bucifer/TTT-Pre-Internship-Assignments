//
//  ViewController.h
//  #3 printLatLong
//
//  Created by Aditya Narayan on 9/11/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *myLocation;

@property (strong, nonatomic) IBOutlet UILabel *LatLabel;
@property (strong, nonatomic) IBOutlet UILabel *LongLabel;


- (IBAction)getLocationButton:(id)sender;

@end
