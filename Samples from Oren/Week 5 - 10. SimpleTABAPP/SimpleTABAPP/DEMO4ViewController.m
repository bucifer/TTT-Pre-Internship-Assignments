//
//  DEMO4ViewController.m
//  SimpleTABAPP
//
//  Created by Aditya on 12/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import "DEMO4ViewController.h"

@interface DEMO4ViewController ()

@end

@implementation DEMO4ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"ISEL";
        self.tabBarItem.image = [UIImage imageNamed:@"second"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    img1view.image = [UIImage imageNamed:@"q2.jpg"];
    imgg.image = [UIImage imageNamed:@"logo1.gif"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
