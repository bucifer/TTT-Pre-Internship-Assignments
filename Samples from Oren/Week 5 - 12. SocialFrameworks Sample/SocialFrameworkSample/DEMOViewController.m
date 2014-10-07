//
//  DEMOViewController.m
//  SocialFrameworkSample
//
//  Created by Aditya on 12/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import "DEMOViewController.h"
#import <Social/Social.h>

@interface DEMOViewController ()

@end

@implementation DEMOViewController

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


- (IBAction)btnFacebookSharing_Clicked:(id)sender{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbSheetOBJ = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [fbSheetOBJ setInitialText:@"TurnToTech - NYC"];
        [fbSheetOBJ addURL:[NSURL URLWithString:@"http://turntotech.io"]];

        [self presentViewController:fbSheetOBJ animated:YES completion:Nil];
    }
}
- (IBAction)btnTwitterSharing_Clicked:(id)sender{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheetOBJ = [SLComposeViewController
                                                  composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheetOBJ setInitialText:@"TurnToTech - NYC"];
        [tweetSheetOBJ addURL:[NSURL URLWithString:@"http://turntotech.io"]];
        [self presentViewController:tweetSheetOBJ animated:YES completion:nil];
    }
}


@end
