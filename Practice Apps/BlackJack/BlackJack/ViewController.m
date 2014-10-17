//
//  ViewController.m
//  BlackJack
//
//  Created by Aditya Narayan on 10/17/14.
//  Copyright (c) 2014 TerrysCompany. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.playButton.layer.cornerRadius = 10;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)playButtonPressAction:(id)sender {
    
    UIImage *playerFirstCardRandomGenerated = [UIImage imageNamed:[self randomCardNumberStringGenerator]];
    UIImage *playerSecondCardRandomGenerated = [UIImage imageNamed:[self randomCardNumberStringGenerator]];
    
    [self.playerCardOne setImage:playerFirstCardRandomGenerated];
    [self.playerCardTwo setImage:playerSecondCardRandomGenerated];
    
    
    
    UIImage *dealerFirstCardRandomGenerated = [UIImage imageNamed:[self randomCardNumberStringGenerator]];
    UIImage *dealerSecondCardRandomGenerated = [UIImage imageNamed:[self randomCardNumberStringGenerator]];
    
    [self.dealerCardOne setImage:dealerFirstCardRandomGenerated];
    [self.dealerCardTwo setImage:dealerSecondCardRandomGenerated];
    
}


- (NSString *) randomCardNumberStringGenerator {
    int r = arc4random_uniform(52);
    return [NSString stringWithFormat:@"%d", r];
}

@end
