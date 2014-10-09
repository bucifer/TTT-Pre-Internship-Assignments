//
//  ViewController.m
//  UIScrollViewPractice
//
//  Created by Aditya Narayan on 10/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.myScrollView setScrollEnabled:YES];
    [self.myScrollView setContentSize:(CGSizeMake(320, 800))];
    
    self.myTextFieldGetsCoveredByKeyboard.delegate = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    [self.myScrollView setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.myScrollView setContentOffset:CGPointZero animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.myTextFieldGetsCoveredByKeyboard resignFirstResponder];
    return YES;
}

-(void)dismissKeyboard {
    [self.myTextFieldGetsCoveredByKeyboard resignFirstResponder]; //or whatever your textfield you want this to apply to
}

@end
