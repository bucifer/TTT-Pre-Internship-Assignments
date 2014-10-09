//
//  ViewController.m
//  UIScrollViewPractice
//
//  Created by Aditya Narayan on 10/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    CGSize keyboardSize;
    int width;
    int height;
}

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
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    //For Later Use
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    CGPoint scrollPoint = CGPointMake(0, self.myTextFieldGetsCoveredByKeyboard.frame.origin.y-220);
    NSLog(@"scrollview height : %f", self.myScrollView.frame.size.height);
    NSLog(@"self.view height : %f", self.view.frame.size.height);
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
    [self.myTextFieldGetsCoveredByKeyboard resignFirstResponder];
}

- (void)keyboardWasShown:(NSNotification *)notification {
    // Get the size of the keyboard.
    keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    width = keyboardSize.width;
    height = keyboardSize.height;
    NSLog(@"keyboardstats --> width: %d height: %d", width, height);
}

- (void)keyboardWillHide:(NSNotification *)notification {

}

@end
