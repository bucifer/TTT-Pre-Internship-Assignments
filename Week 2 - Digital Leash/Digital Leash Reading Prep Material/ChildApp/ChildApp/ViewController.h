//
//  ViewController.h
//  ChildApp
//
//  Created by Aditya Narayan on 1/17/14.
//  Copyright (c) 2014 TurnToTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<UITextFieldDelegate, NSURLConnectionDataDelegate, CLLocationManagerDelegate>
{
    NSString *userID;
    CLLocationManager *locationManager;
    NSString *latitude, *longitude;
    int callCount;
}

//- Properties
@property (nonatomic) NSString *userID;
@property (nonatomic) NSString *latitude, *longitude;

// IBOutlets
@property (weak, nonatomic) IBOutlet UITextField *username_textfield;

// IBActions
- (IBAction)GO_tapped:(id)sender;

@end
