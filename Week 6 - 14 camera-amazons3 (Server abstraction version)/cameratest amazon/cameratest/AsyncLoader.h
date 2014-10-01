//
//  AsyncLoader.h
//  DiscussionForum
//
//  Created by Akshay on 05/04/13.
//  Copyright (c) 2013 QCD Systems LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@class AsyncLoader;

@protocol AsyncLoaderDelegate

@optional -(void) loaderDidLoad:(AsyncLoader *)loader;

@end


@interface AsyncLoader : NSObject{
    
    NSURLConnection *connection;    
    NSMutableData *data;
    
}
@property (nonatomic)  NSString *url;
@property (nonatomic)  NSString *textTag;
@property (nonatomic)  NSString *imagTag;

@property (nonatomic) id  delegate;

@property (nonatomic)  NSString *text;
@property (nonatomic)  UIImage *image;
@property (nonatomic)  NSData *ldData;


-(void)load:(NSString*)anUrl txt:(NSString*)txt img:(NSString*)img delegate:(id)dg;
-(void)load:(NSString*)anUrl txt:(NSString*)txt img:(NSString*)img delegate:(id)dg
           params:(NSString*)params;

-(void)load:(NSString*)anUrl txt:(NSString*)txt img:(NSString*)img delegate:(id)dg
 paramKeys:(NSArray*)keys paramVals:(NSArray*)vals
 paramImage:(UIImage*)im fileName:(NSString*)fileName;

-(NSString *)encode:(NSString*)str;

@end

