//
//  AmazonS3Util.h
//  Amazon App Terry
//
//  Created by Aditya Narayan on 10/1/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <awss3/awss3.h>


@interface AmazonS3Util : NSObject
@property (nonatomic, retain) AmazonS3Client *s3;
@property (nonatomic, retain) id delegate;

-(id)initWithAccessKey:(NSString*)accessKey secretKey:(NSString*)secretKey bucket:(NSString*)bucket delegate:(id)delegate;

-(NSArray*)listFromBucket:(NSString*)bucketName;

-(NSData*)downloadFromBucket:(NSString*)bucketName withKey: (NSString*) key;

@end
