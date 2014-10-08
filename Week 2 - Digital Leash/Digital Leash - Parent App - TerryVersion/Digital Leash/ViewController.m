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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Custom Object Methods

- (void) initTerrysLocationManagerCustomObject{
    self.terrysLocationManager = [[TerrysLocationManager alloc]init];
    self.terrysLocationManager.myVC = self;
}


- (void) initTerrysNetworkManagerCustomObject {
    self.terrysNetworkManager = [[TerrysNetworkManager alloc]init];
    self.terrysNetworkManager.myVC = self;
}




#pragma mark IBAction Methods
- (IBAction)checkLocationButton:(id)sender {
    [self.terrysNetworkManager checkLocation];
}

- (IBAction)createNewUserButton:(id)sender {
    
    if (self.usernameTextfield.text && self.usernameTextfield.text.length > 0)
        [self.terrysNetworkManager sendPOSTRequestCreateNewUser];
    else
        [self showAlertWhenStringTooShortForUsername];
    
}

- (IBAction)updateUserButton:(id)sender {
    if (self.usernameTextfield.text && self.usernameTextfield.text.length > 0) {
        [self.terrysNetworkManager sendUpdateRequest];
    }
    
    else {
        [self showAlertWhenStringTooShortForUsername];
    }
}



#pragma mark custom methods
- (void) setLatLongFields {
    self.latitudeTextfield.text = [[NSNumber numberWithDouble:self.terrysLocationManager.myCLLocation.coordinate.latitude]stringValue ];
    self.longitudeTextfield.text = @(self.terrysLocationManager.myCLLocation.coordinate.longitude).stringValue;
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




@end