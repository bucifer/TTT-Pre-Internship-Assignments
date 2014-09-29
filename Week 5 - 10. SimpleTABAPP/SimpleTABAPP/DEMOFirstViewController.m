//
//  DEMOFirstViewController.m
//  SimpleTABAPP
//
//  Created by Aditya on 12/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import "DEMOFirstViewController.h"

@interface DEMOFirstViewController ()

@end

@implementation DEMOFirstViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        
        
        counter1 = 0;
        counter2 = 0;

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(receiveNotification:) name:@"Test1" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(receiveNotification:) name:@"Test2" object:nil];
    }
    return self;
}


-(void)receiveNotification:(NSNotification *) notification{
    
    NSLog(@"First View Notification Received: %@", [notification name]);
    
    NSDictionary *extraInfo = [notification userInfo];
    
    if ([[notification name] isEqualToString:@"Test1"]) {
        counter1++;
        txtCounter1.text = [NSString stringWithFormat:@"%@: %d",
                             [extraInfo objectForKey:@"button_name"], counter1];
    }
    else{
        counter2++;
        txtCounter2.text = [NSString stringWithFormat:@"%@: %d",
                             [extraInfo objectForKey:@"button_name"], counter2];
    }
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
