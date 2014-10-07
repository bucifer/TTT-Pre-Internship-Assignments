//
//  ViewController.m
//  #6 Converter_NSDictionary_JSON
//
//  Created by Aditya Narayan on 9/11/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self startMyNSDictionary];
    [self turnDictionaryToJSON:self.myDictionary];
    
    [self startMyJSONString];
    [self turnJSONToNSDictionary:self.myJSONString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) startMyNSDictionary {
    self.myDictionary = @{@"fruit": @"apple",
                          @"animal": @"tiger",
                          @"game": @"poker"
                          };
}

- (void) startMyJSONString {
    self.myJSONString = @"{\"jamba\" : \"juice\",  \"scary\" : \"movie\"}";
}

- (void) turnDictionaryToJSON:(NSDictionary *) dictionary {
    NSError *error;
    NSData *myJSONData = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
    self.JSONThatCameFromMyDictionary = [[NSString alloc]initWithData:myJSONData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", self.JSONThatCameFromMyDictionary);
}


- (void) turnJSONToNSDictionary: (NSString *)myJSONString {
    NSData *data = [myJSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    self.DictionaryThatCameFromMyJSON = [NSJSONSerialization JSONObjectWithData: data options:0 error:&error];
    NSLog(@"%@", self.DictionaryThatCameFromMyJSON[@"jamba"]);
}

- (IBAction)logMyDictionaryButton:(id)sender {
    NSLog(self.DictionaryThatCameFromMyJSON.description);
}

- (IBAction)logMyStringButton:(id)sender {
    NSLog(self.JSONThatCameFromMyDictionary.description);
}
@end
