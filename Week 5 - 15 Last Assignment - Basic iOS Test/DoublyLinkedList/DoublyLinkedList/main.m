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
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        Node *firstNode = [[Node alloc] init:@"YoTerryFirstData" nextNode:NULL prevNode:NULL];
        Node *secondNode = [[Node alloc] init:@"24" nextNode:NULL prevNode:firstNode];
        
        TerryDoublyLinkedList *tdlist = [[TerryDoublyLinkedList alloc]init];
        [tdlist printEverything];
        
    }
    return 0;
}

