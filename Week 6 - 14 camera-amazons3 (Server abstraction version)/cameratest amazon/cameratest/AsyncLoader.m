//
//  AsyncLoader.m
//  DiscussionForum
//
//  Created by Akshay on 05/04/13.
//  Copyright (c) 2013 QCD Systems LLC. All rights reserved.
//

#import "AsyncLoader.h"

@implementation AsyncLoader

@synthesize delegate;

@synthesize url;
@synthesize textTag;
@synthesize imagTag;
@synthesize image;
@synthesize text;
@synthesize ldData;

-(void)load:(NSString*)anUrl txt:(NSString*)txt img:(NSString*)img delegate:(id)dg
{
    self.url = anUrl;
    self.textTag = txt;
    self.imagTag = img;
    self.delegate = dg;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:anUrl]
    cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(void)load:(NSString*)anUrl txt:(NSString*)txt img:(NSString*)img delegate:(id)dg
     params:(NSString*)params
{
    self.textTag = txt;
    self.imagTag = img;
    self.delegate = dg;
    
    NSLog(@"URL:%@",anUrl);
    NSLog(@"PARAMS:%@",params);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:anUrl]
    cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    request.HTTPMethod = @"POST";
    
    NSData *ndata = [params dataUsingEncoding:NSUTF8StringEncoding];
    [request addValue:@"8bit" forHTTPHeaderField:@"Content-Transfer-Encoding"];
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:@"%i", [ndata length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:ndata];    
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

}

-(void)load:(NSString*)anUrl txt:(NSString*)txt img:(NSString*)img delegate:(id)dg
  paramKeys:(NSArray*)keys paramVals:(NSArray*)vals
 paramImage:(UIImage*)im fileName:(NSString*)fileName
{
    self.textTag = txt;
    self.imagTag = img;
    self.delegate = dg;
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:anUrl]
    cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    
    request.HTTPMethod = @"POST";
    
    
	//Add content-type to Header. Need to use a string boundary for data uploading.
	NSString *boundary = @"0xKhTmLbOuNdArY";
	NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
	[request addValue:contentType forHTTPHeaderField: @"Content-Type"];
	
	//create the post body
	NSMutableData *body = [NSMutableData data];
	[body appendData:[[NSString stringWithFormat:@"--%@\r\n",boundary] dataUsingEncoding:NSASCIIStringEncoding]];
	if (im!=nil) {
        
        NSData *imageData = UIImageJPEGRepresentation ( im, 1.0);
        
        if(fileName==nil)fileName = [[NSString alloc] initWithFormat:@"%f.jpg", [[NSDate date] timeIntervalSince1970 ] ];
        
		[body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", @"files[]", fileName] dataUsingEncoding:NSUTF8StringEncoding]];
		[body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
		[body appendData:imageData];
		[body appendData:[[NSString stringWithFormat:@"\r\n--%@",boundary] dataUsingEncoding:NSASCIIStringEncoding]];
		[body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	}
	//add (key,value) pairs (no idea why all the \r's and \n's are necessary ... but everyone seems to have them)
	for (int i=0; i<[keys count]; i++) {
		[body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",[keys objectAtIndex:i]] dataUsingEncoding:NSASCIIStringEncoding]];
		[body appendData:[[NSString stringWithFormat:@"%@",[vals objectAtIndex:i]] dataUsingEncoding:NSASCIIStringEncoding]];
		[body appendData:[[NSString stringWithFormat:@"\r\n--%@",boundary] dataUsingEncoding:NSASCIIStringEncoding]];
		if(i<[keys count]-1)[body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSASCIIStringEncoding]];
		else [body appendData:[[NSString stringWithFormat:@"--"] dataUsingEncoding:NSASCIIStringEncoding]];
	}
	
	// set the body of the post to the reqeust
	[request setHTTPBody:body];
	
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
}



-(NSString *)encode:(NSString*)str{
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
        NULL, (CFStringRef)str, NULL,
        (CFStringRef)@"!*'();:@&=+$,/?%#[]",
        kCFStringEncodingUTF8 ));
    return encodedString;
}


- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData {
    
    if (data == nil)
        
        data = [[NSMutableData alloc] initWithCapacity:2048];
    
    [data appendData:incrementalData];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)theConnection

{
    NSLog(@"AsyncLoader Finished Loading");
    
    if(self.textTag!=Nil){
        [self setText: [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding]  ];
    }
    else{
        [self setImage:[[UIImage alloc] initWithData:data]];
    }
    self.ldData = data;
    
    if(self.textTag==Nil){
        [self setTextTag:@"NULL"];
    }
    else{
        [self setImagTag:@"NULL"];
    }

    
    [self.delegate loaderDidLoad:self];
    
    data = nil;
    connection = nil;
    [self setText:nil];
    [self setImage:nil];
 }

-(void)dealloc{
    
    NSLog(@"AsyncLoader Deallocated");
}




@end
