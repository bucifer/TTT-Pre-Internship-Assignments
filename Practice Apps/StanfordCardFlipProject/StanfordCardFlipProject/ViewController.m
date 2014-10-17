//
//  ViewController.m
//  StanfordCardFlipProject
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
    
    self.myCardButton.layer.cornerRadius = 10;
    self.myCardButton.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cardButtonPressedAction:(UIButton *)sender {
    
    if ([sender currentTitle]) {
    UIImage *cardback = [UIImage imageNamed:@"cardbackresized"];
    [sender setBackgroundImage:cardback
                      forState:UIControlStateNormal];
    [sender setTitle:nil
            forState:UIControlStateNormal];
    }
    else {
        UIImage *cardfront = [UIImage imageNamed:@"cardfront"];
        [sender setBackgroundImage:cardfront forState:UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
    }
    
    self.flipCount++;
    self.flipCountLabel.text = [NSString stringWithFormat:@"Flipped Label Count: %d", self.flipCount];
    
}


@end
