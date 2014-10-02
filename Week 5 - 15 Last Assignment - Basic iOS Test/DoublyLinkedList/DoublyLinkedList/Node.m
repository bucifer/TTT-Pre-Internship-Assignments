//
//  Node.m
//  DoublyLinkedList
//
//  Created by Aditya Narayan on 10/2/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "Node.h"

@implementation Node


- (id)init: (NSObject *) data nextNode:(Node *)next prevNode:(Node *)prev {
    self = [super init];
    if (self)
    {
        self.data = data;
        self.next = next;
        self.prev = prev;
    }
    return self;
}



@end
