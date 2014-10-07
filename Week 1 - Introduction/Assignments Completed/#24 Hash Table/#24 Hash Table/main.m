//
//  main.m
//  #24 Hash Table
//
//  Created by Aditya Narayan on 9/8/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBDictionary.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //Make your own dictionary
        //Key and a value is always connected
        //A Hash table, dictionary or an ASSOCIATIVE ARRAY are all same things
        //it's basically 2 arrays interacting with each other
        //one array of keys
        //another array of values
        //you can get the value if you know the key
        //you can get the key if you know the value
        
        TBDictionary *myTBDict = [[TBDictionary alloc]init];
        
        [myTBDict setValue:@"Obama" forKey:@"President"];
        [myTBDict setValue:@"Tiger" forKey:@"Animal"];
        [myTBDict setValue:@"Praying Mantis" forKey:@"Bug"];
        [myTBDict setValue:@"Knife" forKey:@"Weapon"];

        NSLog(@"Keys: %@", myTBDict.keys.description);
        NSLog(@"Values: %@", myTBDict.values.description);

        [myTBDict findValueAtKey:@"Bug"]; //should return praying mantis
        [myTBDict findValueAtKey:@"President"]; //should return obama
        [myTBDict findKeyAtValue:@"Knife"]; //should return Weapon
        [myTBDict findKeyAtValue:@"Tiger"]; //should return Animal

    }
    return 0;
}

