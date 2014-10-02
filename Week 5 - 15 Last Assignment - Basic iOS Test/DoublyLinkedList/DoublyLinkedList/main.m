//
//  main.m
//  DoublyLinkedList
//
//  Created by Aditya Narayan on 10/2/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
#import "TerryDoublyLinkedList.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        TerryDoublyLinkedList *tdlist = [[TerryDoublyLinkedList alloc]init];
        //Logging out list for test
        [tdlist printEverything];

        //adding first object
        Node *firstNode = [[Node alloc] init:@"YoTerryFirstData"];
        [tdlist addObjectAtEnd:firstNode];
        
        //adding second object
        Node *secondNode = [[Node alloc] init:@"YoTerrySecondData"];
        [tdlist addObjectAtEnd:secondNode];
        
        //adding third object
        Node *thirdNode = [[Node alloc] init:@"YoTerryThirdData"];
        [tdlist addObjectAtEnd:thirdNode];
        
        //adding 4th object
        Node *fourthNode = [[Node alloc] init:@"YoTerryFourthData"];
        [tdlist addObjectAtEnd:fourthNode];
        
        [tdlist testPrevsAndNexts];
        //Logging out list for test
        [tdlist printEverything];
        
        //deleting 4th object for test
        [tdlist removeObjectFromHead:fourthNode];

        [tdlist printEverything];
        [tdlist testPrevsAndNexts];


    }
    return 0;
}

