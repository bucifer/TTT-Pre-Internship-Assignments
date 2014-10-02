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
        //let's test this list
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
        
        [tdlist testPrevsAndNexts];
        
//        NSLog(@"%@", firstNode.prev);
//        NSLog(@"%@", firstNode.next);
//        NSLog(@"%@", secondNode.prev);
//        NSLog(@"%@", secondNode.next);
//        NSLog(@"%@", thirdNode.prev);
//        NSLog(@"%@", thirdNode.next);

    }
    return 0;
}

