//
//  ViewController.h
//  #4 asynch_download_Google
//
//  Created by Aditya Narayan on 9/11/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate>

@property (strong, nonatomic) NSMutableData* imageData;
@property (strong, nonatomic) IBOutlet UIImageView *myImageView;


- (IBAction)getGoogle:(id)sender;

@end
