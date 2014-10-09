//
//  MyView.m
//  AppWithoutViewController
//
//  Created by Aditya Narayan on 10/9/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "MyView.h"

@implementation MyView
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextAddRect(context, self.frame);
    CGContextStrokePath(context);
}






@end



