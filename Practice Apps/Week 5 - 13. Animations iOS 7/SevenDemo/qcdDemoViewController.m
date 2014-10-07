//
//  qcdDemoViewController.m
//  SevenDemo
//
//  Created by Aditya Narayan on 9/26/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "qcdDemoViewController.h"

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface qcdDemoViewController ()  <UICollisionBehaviorDelegate>

@property (nonatomic, strong) UIDynamicAnimator *animator;

@property (weak, nonatomic) IBOutlet UILabel *fallingLabel;


@property (weak, nonatomic) IBOutlet UIImageView *square2;
@property (weak, nonatomic) IBOutlet UIImageView *square3;
@property (weak, nonatomic) IBOutlet UIImageView *square4;

@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UISwitch *boolSwitch;

@property (weak, nonatomic) IBOutlet MKMapView *mapDisplay;

@property (weak, nonatomic) IBOutlet UIStepper *stepperCtrl;


@end

@implementation qcdDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}


- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    

    
}

- (IBAction)startGravity:(id)sender {
    
    [self initAnimation];
    
}


-(void) initAnimation
{
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[ self.fallingLabel,self.square2,self.square3,self.square4,self.slider,self.boolSwitch, self.mapDisplay,self.stepperCtrl]];
    
    [animator addBehavior:gravityBeahvior];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.fallingLabel,self.square2,self.square3,self.square4,self.slider,self.boolSwitch, self.mapDisplay,self.stepperCtrl]];
    // Creates collision boundaries from the bounds of the dynamic animator's
    // reference view (self.view).
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    collisionBehavior.collisionDelegate = self;
    
    [animator addBehavior:collisionBehavior];
    
    self.animator = animator;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
