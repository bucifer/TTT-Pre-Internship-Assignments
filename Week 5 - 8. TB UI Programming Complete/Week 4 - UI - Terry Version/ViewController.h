//
//  ViewController.h
//  Week 4 - UI - Terry Version
//
//  Created by Aditya Narayan on 9/24/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,retain) UILabel *headerLabel;
@property (nonatomic,strong) UIImageView *myImageView;
@property (nonatomic, strong) UILabel *relativeLabel;

-(void) createLabel;
-(void) createButton;
-(void) createSegment;
-(void) createImageView;

-(void) createRelativeLabel;

-(IBAction)sampleButtonAction;
-(IBAction)pushSegmentControl:(id)sender;

@end
