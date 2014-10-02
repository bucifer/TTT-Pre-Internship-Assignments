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


- (void) addObjectAtEnd:(Node *) nodeToAdd {
    
    //no items in the list yet, set this first node as the head of the list
    if (self.head == NULL) {
        self.head = nodeToAdd;
    }
    //if the head is taken, but the tail is NULL, then naturally add the node to tail
    else if (self.head != NULL && self.tail == NULL){
        self.tail = nodeToAdd;
        
        //A (head) becomes the prev of B
        Node *a = self.head;
        a.next = nodeToAdd;
        nodeToAdd.prev = a;
        //B (tail or nodeToAdd) becomes the next of A;
    }
    else {
        //make pointer to retain "initially last element" B
        Node *InitiallylastNodePointer = self.tail;
        //tail gets replaced with the NEW element
        self.tail = nodeToAdd;
        //set "initially last"'s next-property to the NEW element
        InitiallylastNodePointer.next = nodeToAdd;
        //set the prev of the NEW element to the "initially last"
        nodeToAdd.prev = InitiallylastNodePointer;
    }
    self.length++;
    NSLog(@"\n\n New node added to end \n\n");
    [self printEverything];
}


- (void) removeObjectFromHead:(Node *) nodeToDelete {
    
    //pointer to retain the old head and to point to the new head
    Node *pointerToOldHead = self.head;
    Node *pointerToNewHead = self.head.next;
    
    //we need to have the head.next be the new head of the list
    self.head = pointerToNewHead;
    
    //do some cleanup work
    //we need to clear out the New Head's prev property because it was set to OLD head
    self.head.prev = NULL;
    //we also need to lower the list count
    self.length--;
    
    NSLog(@"%@ deleted successfuly \n\n", nodeToDelete);
}



- (void) printEverything {
    NSLog(@"The length of your doubly linked list is %d.", self.length);
    NSLog(@"The head is %@ and head data is %@", self.head, self.head.data);
    NSLog(@"The tail is %@ and tail data is %@", self.tail, self.tail.data);
}

- (void) testPrevsAndNexts {
    //let's test all prev and next values
    int count = 0;
    NSLog(@"element order#: %d is %@", count, self.head);
    NSLog(@"prev: %@", self.head.prev);
    NSLog(@"next: %@", self.head.next);
    count++;
    Node *pointerToNextElement = self.head.next;
    while (pointerToNextElement != NULL) {
        NSLog(@"element order#: %d is %@", count, pointerToNextElement);
        NSLog(@"prev: %@", pointerToNextElement.prev);
        NSLog(@"next: %@", pointerToNextElement.next);
        pointerToNextElement = pointerToNextElement.next;
        count++;
    }

}


@end
