//
//  DEMOViewController.h
//  CreatesUiProgramatically
//
//  Created by Aditya on 13/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DEMOViewController : UIViewController

@property (nonatomic,retain) UILabel *headerLabel;
@property (nonatomic,retain) UIButton *sampleBt;
@property (nonatomic,retain) UISegmentedControl *sgctrl;
@property (nonatomic,retain) UIImageView *imgView;
@property (nonatomic,retain) UIScrollView *scrollView;

-(void)createLabel;
-(void)createButton;
-(void)createsegment;
-(void)createImageView;

-(void)createScrollView;


-(IBAction)sampleBtAction;
-(IBAction)pushcgctrl:(id)sender;


@end
