//
//  DEMOAppDelegate.m
//  SimpleTABAPP
//
//  Created by Aditya on 12/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import "DEMOAppDelegate.h"

#import "DEMOFirstViewController.h"

#import "DEMOSecondViewController.h"

#import "DEMO3ViewController.h"

#import "DEMO4ViewController.h"

@implementation DEMOAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[DEMOFirstViewController alloc] initWithNibName:@"DEMOFirstViewController" bundle:nil];
    UIViewController *viewController2 = [[DEMOSecondViewController alloc] initWithNibName:@"DEMOSecondViewController" bundle:nil];
    UIViewController *viewController3 = [[DEMO3ViewController alloc] initWithNibName:@"DEMO3ViewController" bundle:nil];
    UIViewController *viewController4 = [[DEMO4ViewController alloc] initWithNibName:@"DEMO4ViewController" bundle:nil];
    
    UINavigationController *navcntrl1    = [[UINavigationController alloc] initWithRootViewController:viewController1];
    UINavigationController *navcntrl2    = [[UINavigationController alloc] initWithRootViewController:viewController2];
    UINavigationController *navcntrl3    = [[UINavigationController alloc] initWithRootViewController:viewController3];
    UINavigationController *navcntrl4   = [[UINavigationController alloc] initWithRootViewController:viewController4];
    
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[navcntrl1, navcntrl2,navcntrl3,navcntrl4];
    self.window.rootViewController = self.tabBarController;
    
    self.tabBarController.moreNavigationController.navigationBar.tintColor = [UIColor blueColor];
    
    //self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



 

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
