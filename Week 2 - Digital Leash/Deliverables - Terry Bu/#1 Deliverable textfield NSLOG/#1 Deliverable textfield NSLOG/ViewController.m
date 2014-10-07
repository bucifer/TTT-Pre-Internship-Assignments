//
//  ViewController.m
//  #1 Deliverable textfield NSLOG
//
//  Created by Aditya Narayan on 9/9/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController
@synthesize textf;


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

- (IBAction)handleButtonClick:(id)sender {
    NSString *input = self.textf.text; //self refers to the ViewController
    NSLog(@"%@", input);
}

@end
