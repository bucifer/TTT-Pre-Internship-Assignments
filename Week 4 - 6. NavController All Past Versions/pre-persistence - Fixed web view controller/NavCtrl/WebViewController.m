//
//  WebViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 9/15/14.
//  Copyright (c) 2014 Aditya Narayan. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

@synthesize selectedProduct;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (void)viewDidAppear:(BOOL)animated {
    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:selectedProduct.url] ] ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_myWebView release];
    [super dealloc];
}
@end
