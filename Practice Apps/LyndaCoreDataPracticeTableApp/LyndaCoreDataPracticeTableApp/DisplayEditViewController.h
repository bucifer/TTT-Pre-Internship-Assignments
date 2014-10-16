//
//  DisplayEditViewController.h
//  LyndaCoreDataPracticeTableApp
//
//  Created by Aditya Narayan on 10/16/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"

@interface DisplayEditViewController : UIViewController


@property (nonatomic, strong) Course *currentCourse;

@property (strong, nonatomic) IBOutlet UITextField *titleField;

@property (strong, nonatomic) IBOutlet UITextField *authorField;

@property (strong, nonatomic) IBOutlet UITextField *dateField;

@end
