//
//  TerryDoublyLinkedList.h
//  DoublyLinkedList
//
//  Created by Aditya Narayan on 10/2/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface TerryDoublyLinkedList : NSObject

@property (nonatomic, strong) Node* head;
@property (nonatomic, strong) Node* tail;
@property (nonatomic) int length;


- (id) init;
- (void) addObject:(Node *)nodeToAdd;
- (void) printEverything;


@end
