//
//  TerryDoublyLinkedList.m
//  DoublyLinkedList
//
//  Created by Aditya Narayan on 10/2/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "TerryDoublyLinkedList.h"

@implementation TerryDoublyLinkedList

- (id) init {
    self = [super init];
    if (self)
    {
        self.length = 0;
        self.head = NULL;
        self.tail = NULL;
    }
    return self;
}

- (void) printEverything {
    NSLog(@"The length of your doubly linked list is %d.", self.length);
    NSLog(@"The head is %@ and head data is %@", self.head, self.head.data);
    NSLog(@"The tail is %@ and tail data is %@", self.tail, self.tail.data);
}


@end
