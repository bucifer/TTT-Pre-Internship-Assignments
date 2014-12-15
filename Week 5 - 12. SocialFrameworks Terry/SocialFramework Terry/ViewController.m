//
//  ViewController.m
//  SocialFramework Terry
//
//  Created by Aditya Narayan on 9/29/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)facebookButton:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbPreview = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [fbPreview setInitialText:@"I am testing Facebook"];
        [fbPreview addURL:[NSURL URLWithString:@"http://Iamtesting.com"]];
        [fbPreview addImage:[UIImage imageNamed:@"bulbasaur"]];
        [self presentViewController:fbPreview animated:YES completion:Nil];
    }
    else {
        NSLog(@"unavailable");
    }
    
}

- (IBAction)twitterButton:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetComposeView = [SLComposeViewController
                                                  composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetComposeView setInitialText:@"I am tweeting"];
        [tweetComposeView addURL:[NSURL URLWithString:@"http://terrybu.com"]];
        [self presentViewController:tweetComposeView animated:YES completion:nil];
    }
}
@end
