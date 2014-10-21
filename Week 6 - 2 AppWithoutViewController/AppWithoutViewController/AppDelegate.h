//
//  AppDelegate.h
//  AppWithoutViewController
//
//  Created by Aditya Narayan on 10/9/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MyView* myContentView;

@end

