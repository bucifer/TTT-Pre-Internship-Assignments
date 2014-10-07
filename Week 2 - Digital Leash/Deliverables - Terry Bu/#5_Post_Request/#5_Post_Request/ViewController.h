//
//  ViewController.h
//  #5_Post_Request
//
//  Created by Aditya Narayan on 9/11/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate, UITextFieldDelegate> {

}

@property (strong, nonatomic) NSMutableURLRequest *request;

@property (strong, nonatomic)    NSString *userID;
@property (strong, nonatomic)    NSValue *longitude;
@property (strong, nonatomic)    NSValue *latitude;
@property (strong, nonatomic)    NSValue *radius;

- (IBAction)postButton:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *doneLabel;

@property (strong, nonatomic) IBOutlet UITextField *userid_textfield;

@end
