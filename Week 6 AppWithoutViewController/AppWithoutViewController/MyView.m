//
//  MyView.m
//  AppWithoutViewController
//
//  Created by Aditya Narayan on 10/9/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "MyView.h"

@implementation MyView {
    NSString *someText;
    UITextField *myTextField;
}


- (void)drawRect:(CGRect)rect{
    
    UILabel *textLabel;
    // Set font and calculate used space
    UIFont *textFont = [UIFont fontWithName:@"Helvetica" size:24];
    // Position of the text
    
    CGFloat windowWidth = self.window.frame.size.width;
    CGFloat windowHeight = self.window.frame.size.height;

    textLabel = [[UILabel alloc] initWithFrame:CGRectMake(windowWidth/3, windowHeight/3, 100, 50)];
    // Set text attributes
    textLabel.textColor = [UIColor blackColor];
    textLabel.backgroundColor = [UIColor orangeColor];
    textLabel.font = textFont;
    textLabel.text = @"My Label";
    // Add Label to MyView's subview
    [self addSubview:textLabel];
    
    
    //Add TextField
    myTextField = [[UITextField alloc]initWithFrame:CGRectMake(50,0, 200, 50)];
    myTextField.borderStyle = UITextBorderStyleRoundedRect;
    myTextField.font = [UIFont systemFontOfSize:15];
    myTextField.placeholder = @"enter text";
    myTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    myTextField.keyboardType = UIKeyboardTypeDefault;
    myTextField.returnKeyType = UIReturnKeyDone;
    myTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    myTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self addSubview:myTextField];
    
    
    
    //Add Button
    UIButton *myButton;
    myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    myButton.frame = CGRectMake(50, 50, 200, 50);
    myButton.backgroundColor = [UIColor greenColor];
    [myButton setTitle:@"Press for NSLog" forState:UIControlStateNormal];
    [myButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview: myButton];
}



- (void) buttonAction {
    someText = myTextField.text;
    NSLog(@"%@", someText);
}


@end



