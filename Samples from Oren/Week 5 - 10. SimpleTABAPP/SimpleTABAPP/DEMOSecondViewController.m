//
//  DEMOSecondViewController.m
//  SimpleTABAPP
//
//  Created by Aditya on 12/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import "DEMOSecondViewController.h"

@interface DEMOSecondViewController ()

@end

@implementation DEMOSecondViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self
            selector:@selector(receiveNotification:) name:@"Test1" object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
            selector:@selector(receiveNotification:) name:@"Test2" object:nil];
    }
    return self;
}



-(IBAction)onePressed:(id)sender
{
    NSDictionary *extraInfo = [NSDictionary dictionaryWithObject:@"One" forKey:@"button_name"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Test1" object:self userInfo:extraInfo ];
}

-(IBAction)twoPressed:(id)sender
{
    NSDictionary *extraInfo = [NSDictionary dictionaryWithObject:@"Two" forKey:@"button_name"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Test2" object:self userInfo:extraInfo ];
    
}


-(void)receiveNotification:(NSNotification *) notification
{
    NSLog(@"Second View Notification Received: %@", [notification name]);

    NSDictionary *extraInfo = [notification userInfo];
    [txtNotify setText:[extraInfo objectForKey:@"button_name"]];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
