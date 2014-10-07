//
//  main.m
//  #25 Use Your Hash Table
//
//  Created by Aditya Narayan on 9/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "TBDictionary.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        NSString* path = @"/Users/adityanarayan/Desktop/TerryBu/Assignments Completed/Input_Folder/names&addresses.txt";
        NSString* content = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:NULL];
        NSArray *lines = [content componentsSeparatedByString:@"\n"];
        NSLog(@"Jarvis says the # of lines we found in that file is %lu lines!\n", (unsigned long)lines.count);
        
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithObjects: nil];
        for (int i = 0; i < lines.count; i++) {
            NSString *line_target = lines[i];
            NSArray *pair = [line_target componentsSeparatedByString:@", "];
            Person *person = [[Person alloc]init];
            person.name = pair[0];
            person.address = pair[1];
            [resultArray addObject:person];
        }
        
        //just for testing purposes, loop through the result array, output all names and addresses
        for (int i = 0; i < resultArray.count; i++) {
            Person *person = resultArray[i];
            NSLog(@"%@ lives at %@", person.name, person.address);
        }
        
        //identify duplicate names by using NSMutableDictionary by using names as keys and the objects as values
        TBDictionary *myDictionary = [[TBDictionary alloc]init];
        
        for (int i=0; i < resultArray.count; i++) {
            Person * person = resultArray[i];
            [myDictionary setValue:person forKey: person.name];
            //shorthand syntax for adding key-value pairs into a Dictionary
        }
        
        NSLog(@"\n Here is your TBDictionary Results:\n*************\n");
        for (int i=0; i < myDictionary.keys.count; i++) {
            NSLog(myDictionary.keys[i]);
        }
        
        [myDictionary findValueAtKey:@"Tiffany Lan"];
        
    }
    return 0;
}

