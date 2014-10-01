//
//  ViewController.h
//  Amazon App Terry
//
//  Created by Aditya Narayan on 9/30/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <awsruntime/awsruntime.h>
#import <awss3/awss3.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *tableData;

@property (strong, nonatomic) NSString *urlString;

@property (strong, nonatomic) IBOutlet UIImageView *myImageView;

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@property (strong, nonatomic) AmazonS3Client *s3;

@property (strong, nonatomic) UIPopoverController *pop;


- (IBAction)editBarButtonAction:(id)sender;

- (IBAction)cameraBarButtonAction:(id)sender;



- (void) loadDataFromS3PutIntoTable;
- (void) uploadData:(NSData*)data format:(NSString*)format
       bucketName:(NSString*)bucketName withKey: (NSString*) key;
- (void)uploadDone:(NSError *)error;

@end
