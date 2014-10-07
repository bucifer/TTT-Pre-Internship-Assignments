//
//  main.m
//  #23
//
//  Created by Aditya Narayan on 9/5/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h> //brackets for standard library imports
#import "Person.h" //quotes for importing non-libraries

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
//    Person *person1 = [[Person alloc] init]; //alloc is allocating memory and init initializes the object
//    person1.name = @"Terry Bu";
//    person1.address = @"2111 21st Rd, Astoria NY 11105";

    //        NSLog(@"Hello, %@!", person1.name);
    //        NSLog(@"%@", person1.address);
        
        //read from a file
        //*I originally had some path below involving NSBundle Mainbundle but it didn't work. Once simplified down to string form like below, it works
        
        NSString* path = @"/Users/adityanarayan/Desktop/TerryBu/Assignments Completed/Input_Folder/names&addresses.txt";
        NSString* content = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:NULL];
        
//        NSLog(@"%@", content);
        //parse the content string delimited by new lines first
        
        NSArray *lines = [content componentsSeparatedByString:@"\n"];
        NSLog(@"Jarvis says the # of lines we found in that file is %lu lines!\n", (unsigned long)lines.count);
        
        //when you initiate NSMutableArrays, remember to allocate it and then initialize it with nil like this. Otherwise it will throw errors when you try to addobjects to it
        NSMutableArray *resultArray = [[NSMutableArray alloc] initWithObjects: nil];
        
        for (int i = 0; i < lines.count; i++) {
            NSString *line_target = lines[i];
            NSArray *pair = [line_target componentsSeparatedByString:@", "];
            //now in pair array, we have name at pair[0] and address pair[1]
            //we then instantiate a person
            Person *person = [[Person alloc]init];
            person.name = pair[0];
            person.address = pair[1];
            //we now add the person to our resultArray
            [resultArray addObject:person];
        }
        
        //final resultarray output test - it should output a bunch of Person objects addresses Person: 0x1005....
        NSLog(@"%@", resultArray.description);

        //just for testing purposes, loop through the result array, output all names and addresses
        for (int i = 0; i < resultArray.count; i++) {
            Person *person = resultArray[i];
            NSLog(@"%@ lives at %@", person.name, person.address);
        }
        
        //identify duplicate names by using NSMutableDictionary by using names as keys and the objects as values
        NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc]init];
        
        for (int i=0; i < resultArray.count; i++) {
            Person * person = resultArray[i];
            myDictionary[person.name] = person;
            //shorthand syntax for adding key-value pairs into a Dictionary
        }
        
        NSLog(@"\nHere is your MutableDictionary Results:\n*************\n");
        NSLog(myDictionary.description);

        //output should print out ape sh*t crazy which is the value for the SECOND key-value pair for Duplicate Man
        NSLog([myDictionary[@"Duplicate Man"] address]);
        
        //When you make a NSMutable Dictionary, and you use duplicate keys, the initial key's value gets over-written by the 2nd key's value. You cannot have multiple keys in a dictionary, it won't list out like arrays, instead, they get overwritten. A good thing to remember.
        
        
    }
    return 0;
}

