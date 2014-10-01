//
//  ViewController.m
//  Amazon App Terry
//
//  Created by Aditya Narayan on 9/30/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "ViewController.h"

#define ACCESS_KEY_ID   @"AKIAJ575J3HW32KPXIDQ"
#define SECRET_KEY      @"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"
#define BUCKET          @"ios-cameraapp-images-bucket"


@interface ViewController ()
@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    @try {
//        // Initial the S3 Client.
//        self.s3= [[AmazonS3Client alloc] initWithAccessKey:ACCESS_KEY_ID withSecretKey:SECRET_KEY];
//        
//        // Create Bucket.
//        S3CreateBucketRequest *request = [[S3CreateBucketRequest alloc] initWithName:BUCKET];
//        S3CreateBucketResponse *response = [self.s3 createBucket:request];
//        if(response.error != nil)
//        {
//            NSLog(@"Error: %@", response.error);
//        }
//    }
//    @catch (NSException *exception) {
//        NSLog(@"There was an exception when connecting to s3: %@",exception.description);
//    }
    
    //Getting your list of objects from your bucket and display on table
    @try
    {
        S3ListObjectsRequest *req = [[S3ListObjectsRequest alloc] initWithName: BUCKET];
        S3ListObjectsResponse *resp = [self.s3 listObjects:req];
        NSMutableArray* objectSummaries = resp.listObjectsResult.objectSummaries;
        self.tableData = [[NSArray alloc] initWithArray: objectSummaries];
        [self.myTableView reloadData];
    }
    @catch (NSException *exception) {
        NSLog(@"Cannot list S3 %@",exception);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editBarButtonAction:(id)sender {
}

- (IBAction)cameraBarButtonAction:(id)sender {
}



#pragma mark table methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString *fileName = [[NSString alloc] initWithFormat:@"%@",
                          [self.tableData objectAtIndex: indexPath.row ]];
    cell.textLabel.text = @"hi";
    return cell;
}

@end
