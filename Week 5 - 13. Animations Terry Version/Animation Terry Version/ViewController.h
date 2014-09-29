//
//  ViewController.h
//  Animation Terry Version
//
//  Created by Aditya Narayan on 9/29/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController




- (IBAction)gravityActionButton:(id)sender;


@property (nonatomic) UIDynamicAnimator *myAnimator;

@property (strong, nonatomic) IBOutlet UIImageView *myImageView;


@property (strong, nonatomic) IBOutlet UIStepper *myStepper;

@property (strong, nonatomic) IBOutlet UISwitch *mySwitch;

@property (strong, nonatomic) IBOutlet UILabel *myLabel;


@property (strong, nonatomic) IBOutlet UISegmentedControl *mySegmentedControl;


@property (strong, nonatomic) IBOutlet UISlider *mySlider;



@end
