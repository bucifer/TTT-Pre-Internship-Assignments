//
//  ViewController.m
//  Animation Terry Version
//
//  Created by Aditya Narayan on 9/29/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}




-(void) initAnimation {
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc]initWithItems:@[self.myLabel, self.mySegmentedControl, self.mySlider, self.myStepper,self.mySwitch]];
    
    [animator addBehavior:gravityBehavior];
    
    self.myAnimator = animator;
    
}








- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gravityActionButton:(id)sender {
    [self initAnimation];
}
@end
