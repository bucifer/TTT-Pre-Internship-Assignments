//
//  SecondViewController.m
//  TabApp
//
//  Created by Aditya Narayan on 9/26/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () {
    NSNumber* narutoCounter;
    
}

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"2nd View - sends notifis";

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:) name:@"Notify1" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:) name:@"Notify2" object:nil];
}

-(void)receiveNotification:(NSNotification *) notification{
    
    NSLog(@"First View Notification Received: %@", [notification name]);
    
    NSDictionary *notifyInfo = [notification userInfo];
    
    self.notifyField.text = [notifyInfo objectForKey:@"button_name"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)narutoButton:(id)sender {
    
    NSDictionary *notifyInfo = [NSDictionary dictionaryWithObject:@"Naruto Button Clicked" forKey:@"button_name"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Notify1" object:self userInfo:notifyInfo ];
    
}

- (IBAction)sasukeButton:(id)sender {
    NSDictionary *notifyInfo = [NSDictionary dictionaryWithObject:@"Sasuke Button Clicked" forKey:@"button_name"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Notify2" object:self userInfo:notifyInfo ];
}




@end
