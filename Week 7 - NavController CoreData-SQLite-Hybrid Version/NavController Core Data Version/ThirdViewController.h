//
//  ThirdViewController.h
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 9/24/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductPresentationLayer.h"
#import "Reachability.h"

@interface ThirdViewController : UIViewController


@property (strong, nonatomic) ProductPresentationLayer* selectedProduct;

@property (strong, nonatomic) IBOutlet UIWebView *myWebView;

@property BOOL connectionLost;


@end
