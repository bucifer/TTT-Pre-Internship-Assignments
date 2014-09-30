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
    
    //gravity
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc]initWithItems:@[self.myLabel, self.mySegmentedControl, self.mySlider, self.mySwitch, self.myImageView]];
    
    gravityBehavior.magnitude = 0.25;
    gravityBehavior.angle = 300;
    
    [animator addBehavior:gravityBehavior];
    
    //collision
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.myLabel, self.mySegmentedControl, self.mySlider, self.mySwitch, self.myImageView]];
    
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    collisionBehavior.collisionDelegate = self;
    
    [animator addBehavior:collisionBehavior];
    
    UIDynamicItemBehavior *elasticity = [[UIDynamicItemBehavior alloc]initWithItems:@[self.mySwitch, self.myImageView]];
    elasticity.elasticity = 1.0;
    [animator addBehavior:elasticity];
    
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
