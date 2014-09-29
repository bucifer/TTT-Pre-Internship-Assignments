//
//  WebViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 9/15/14.
//  Copyright (c) 2014 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface WebViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIWebView *myWebView;

@property (strong) Product* selectedProduct;

@end
