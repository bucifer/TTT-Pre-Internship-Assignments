//
//  FirstViewController.m
//  TabApp
//
//  Created by Aditya Narayan on 9/26/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController () {
    NSInteger narutoCounter;
    NSInteger sasukeCounter;
}

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    narutoCounter = 0;
    sasukeCounter = 0;
    
    
    //Initiate NSNotificationCenter and set the view controller as an observer of notifications as soon as it loads - so it starts listening for notifications
    //First line listens to notificatins with name Notify1 and other with Notify 2
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:) name:@"Notify1" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:) name:@"Notify2" object:nil];
}

-(void)dismissKeyboard {
    [self.narutoTextfield resignFirstResponder];
    [self.sasukeField resignFirstResponder];
}

-(void)receiveNotification:(NSNotification *) notification{
    
    NSLog(@"First View Notification Received: %@", [notification name]);
    
    NSDictionary *notifyInfo = [notification userInfo];
    
    if ([[notification name] isEqualToString:@"Notify1"]) {
        NSLog(@"%@", [notifyInfo objectForKey:@"button_name"]);
        narutoCounter++;
        self.narutoTextfield.text = [NSString stringWithFormat:@"%ld", (long)narutoCounter];
    }
    if ([[notification name] isEqualToString:@"Notify2"]) {
        NSLog(@"%@", [notifyInfo objectForKey:@"button_name"]);
        sasukeCounter++;
        self.sasukeField.text = [NSString stringWithFormat:@"%ld", (long)sasukeCounter];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
