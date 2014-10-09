//
//  ViewController.m
//  Digital Leash
//
//  Created by Aditya Narayan on 9/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UITextField *activeField;
}

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //initialize your new custom objects here
    [self initTerrysLocationManagerCustomObject];
    [self initTerrysNetworkManagerCustomObject];
    
    [self setUpScrollViewAndRegisterForKeyboardNotifications];
    [self setTextFieldDelegatesAndAddTapOutClearKeyBoard];
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

- (void) setTextFieldDelegatesAndAddTapOutClearKeyBoard {
    self.usernameTextfield.delegate = self;
    self.latitudeTextfield.delegate = self;
    self.longitudeTextfield.delegate = self;
    self.radiusTextfield.delegate = self;
    self.zoneConfirmationField.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}


- (void)setUpScrollViewAndRegisterForKeyboardNotifications
{
    [self.myScrollView setScrollEnabled:YES];
    [self.myScrollView setContentSize:(CGSizeMake(320, 800))];
    
    //viewcontroller starts listening for the keyboard events (keyboard show and keyboard hide) through this notificationCenter command
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

-(void)dismissKeyboard {
    [self.usernameTextfield resignFirstResponder];
    [self.latitudeTextfield resignFirstResponder];
    [self.longitudeTextfield resignFirstResponder];
    [self.radiusTextfield resignFirstResponder];
    [self.zoneConfirmationField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.latitudeTextfield resignFirstResponder];
    [self.longitudeTextfield resignFirstResponder];
    [self.radiusTextfield resignFirstResponder];
    [self.zoneConfirmationField resignFirstResponder];
    [self.usernameTextfield resignFirstResponder];
    return YES;
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    //we grab keyboard size
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    //*** Keyboard Padding Logic *** //
    
    //When we open up the keyboard,
    //we create UIEdgeInsets, basically padding for the ScrollView. We set the padding as high as the keyboard
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
    //we apply the padding to the scrollview so that nothing gets hidden beneath the keyboard
    self.myScrollView.contentInset = contentInsets;
    //this is to adjust the scroll functionality to the padding - without this, scroll doesn't detect the padding
    self.myScrollView.scrollIndicatorInsets = contentInsets;
    
    //*** CHECK IF YOUR TEXTFIELD EVER GETS COVERED BY THE KEYBOARD LOGIC ***//
    
    //we draw an imaginary rectangle the size of the screen
    CGRect aRect = self.view.frame;
    //we then subtract keyboard height from this rectangle
    aRect.size.height -= keyboardSize.height;
    //now this rectangle symbolizes the area of the screen NOT UNDER THE KEYBOARD WHEN IT IS SHOWING
    //So if this rectangle covers the textfield coordinates, then we are safe - no adjustment needs to be made
    //BUT if this rectangle DOESN'T COVER the textfield, then we scroll to the active textfield's y coordinate
    
    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, activeField.frame.origin.y);
        [self.myScrollView setContentOffset:scrollPoint animated:YES];
    }
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.myScrollView.contentInset = contentInsets;
    self.myScrollView.scrollIndicatorInsets = contentInsets;
    CGPoint scrollPoint = CGPointZero;
    [self.myScrollView setContentOffset:scrollPoint animated:YES];
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