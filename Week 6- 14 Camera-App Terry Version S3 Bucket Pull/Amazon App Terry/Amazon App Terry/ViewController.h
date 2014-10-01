//
//  ViewController.h
//  Amazon App Terry
//
//  Created by Aditya Narayan on 9/30/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *tableData;

@property (strong, nonatomic) NSString *urlString;

@property (strong, nonatomic) IBOutlet UIImageView *myImageView;

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

- (IBAction)editBarButtonAction:(id)sender;

- (IBAction)cameraBarButtonAction:(id)sender;

@end
