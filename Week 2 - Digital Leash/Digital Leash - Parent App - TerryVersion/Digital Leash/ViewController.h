//
//  ViewController.h
//  Digital Leash
//
//  Created by Aditya Narayan on 9/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TerrysLocationManager.h"
#import "TerrysNetworkManager.h"

@class TerrysLocationManager;
@class TerrysNetworkManager;

@interface ViewController : UIViewController <UITextFieldDelegate>

//For Custom Objects
@property (strong, nonatomic) TerrysLocationManager * terrysLocationManager;
@property (strong, nonatomic) TerrysNetworkManager * terrysNetworkManager;
@property (strong, nonatomic) NSMutableURLRequest *myURLRequest;

@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;

//For Input Username and Create New User
@property (strong, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (strong, nonatomic) NSString *tempStringHolder;
//textfield that populates for YES or NO for Zone confirmation
@property (strong, nonatomic) IBOutlet UITextField *zoneConfirmationField;
//label that changes to notify confirmation when user clicks on "create new user" or "update existing user"
@property (strong, nonatomic) IBOutlet UILabel *ConfirmLabel;

@property (strong, nonatomic) IBOutlet UITextField *longitudeTextfield;
@property (strong, nonatomic) IBOutlet UITextField *latitudeTextfield;
@property (strong, nonatomic) IBOutlet UITextField *radiusTextfield;


//Action buttons
- (IBAction)createNewUserButton:(id)sender;
- (IBAction)updateUserButton:(id)sender;
- (IBAction)checkLocationButton:(id)sender;


//Custom Methods
- (void) setLatLongFields;
- (void) afterPostRequestConfirmation;
- (void) showAlertWhenStringTooShortForUsername;









@end
