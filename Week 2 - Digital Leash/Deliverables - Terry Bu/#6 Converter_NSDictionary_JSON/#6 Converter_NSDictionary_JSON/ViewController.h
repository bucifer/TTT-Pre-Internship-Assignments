//
//  ViewController.h
//  #6 Converter_NSDictionary_JSON
//
//  Created by Aditya Narayan on 9/11/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) NSDictionary *myDictionary;
@property (strong, nonatomic) NSString *JSONThatCameFromMyDictionary;

@property (strong, nonatomic) NSString *myJSONString;
@property (strong, nonatomic) NSDictionary * DictionaryThatCameFromMyJSON;

- (IBAction)logMyDictionaryButton:(id)sender;

- (IBAction)logMyStringButton:(id)sender;

@end
