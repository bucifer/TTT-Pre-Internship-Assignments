//
//  Node.h
//  DoublyLinkedList
//
//  Created by Aditya Narayan on 10/2/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic, strong) NSObject *data;
@property (nonatomic, strong) Node *next;
@property (nonatomic, strong) Node *prev;

- (id)init: (NSObject *) data nextNode:(Node *)next prevNode:(Node *)prev;


@end
