//
//  AmazonS3Util.m
//  Amazon App Terry
//
//  Created by Aditya Narayan on 10/1/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "AmazonS3Util.h"

@implementation AmazonS3Util

-(id)initWithAccessKey:(NSString*)accessKey secretKey:(NSString*)secretKey bucket:(NSString*)bucket delegate:(id)delegate
{
    self = [super init];
    
    // Initial the S3 Client.
    self.s3 = [[AmazonS3Client alloc] initWithAccessKey:accessKey withSecretKey:secretKey];
    self.delegate = delegate;
    
    // Create Bucket.
    S3CreateBucketRequest *request = [[S3CreateBucketRequest alloc] initWithName:bucket ];
    S3CreateBucketResponse *response = [self.s3 createBucket:request];
    if(response.error != nil)
    {
        NSLog(@"Error: %@", response.error);
    }
    
    return self;
}



-(NSArray*)listFromBucket:(NSString*)bucketName
{
    @try
    {
        S3ListObjectsRequest *req = [[S3ListObjectsRequest alloc] initWithName: bucketName ];
        S3ListObjectsResponse *resp = [self.s3 listObjects:req];
        NSMutableArray* objectSummaries = resp.listObjectsResult.objectSummaries;
        return [[NSArray alloc] initWithArray: objectSummaries];
    }
    @catch (NSException *exception) {
        NSLog(@"Cannot list S3 %@",exception);
        return [[NSArray alloc]init];
    }
    
}

-(NSData*)downloadFromBucket:(NSString*)bucketName withKey: (NSString*) key
{
    @try
    {
        S3GetObjectRequest *request = [[S3GetObjectRequest alloc]
                                       initWithKey:key withBucket:bucketName];
        S3GetObjectResponse *response = [self.s3 getObject:request];
        return [response body];
    }
    @catch (NSException *exception) {
        NSLog(@"Cannot Load S3 Object %@",exception);
        return  nil;
    }
    
}



@end
