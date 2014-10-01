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
    
    //this is creating the S3Bucket logic - when a user starts the app for the first time, the user should be able to create that bucket on the background on initialization
    //but right now, let's just take baby-steps and figure out how to manipulate S3 better
    
//    @try {
//        // Initial the S3 Client.
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
    
    //Do not freaking delete this
    self.s3= [[AmazonS3Client alloc] initWithAccessKey:ACCESS_KEY_ID withSecretKey:SECRET_KEY];
    
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
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView reloadData];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editBarButtonAction:(id)sender {
    
    if ([self.myTableView isEditing]) {
        [sender setTitle:@"Press to Delete"];
    }
    else {
        [sender setTitle:@"Press to Quit Delete Mode"];
    }
    
    [self.myTableView setEditing:![self.myTableView isEditing]];
}

- (IBAction)cameraBarButtonAction:(id)sender {
    //this is for when you press on that camera icon, a popover pops up, allowing you to either take a photo or use the Photo library for existing photos
    if([self.pop isPopoverVisible]){
        [self.pop dismissPopoverAnimated:YES];
        self.pop = nil;
        return;
    }

    UIImagePickerController *ip = [[UIImagePickerController alloc]init];
    
    if( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ){
        
        [ip setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else
    {
        [ip setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        
    }
    
    [ip setAllowsEditing:TRUE];
    ip.delegate = self;
    
    self.pop = [[UIPopoverController alloc]initWithContentViewController:ip];
    
    self.pop.delegate = self;
    [self.pop presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
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
    cell.textLabel.text = fileName;
    return cell;
}

- (void)tableView: (UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
    
    NSString *fileName = [NSString stringWithFormat:@"%@",
                          [self.tableData objectAtIndex: indexPath.row ]];
    @try
    {
        S3GetObjectRequest *request = [[S3GetObjectRequest alloc]
                                       initWithKey:fileName withBucket:BUCKET];
        S3GetObjectResponse *response = [self.s3 getObject:request];
        NSData *downloadData = [response body];
        if(downloadData)self.myImageView.image = [UIImage imageWithData:downloadData];
    }
    @catch (NSException *exception) {
        NSLog(@"Cannot Load S3 Object %@",exception);
    }
}

- (void) tableView: (UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *fileName = [NSString stringWithFormat:@"%@",
                          [self.tableData objectAtIndex: indexPath.row ]];
    
    @try {
        NSLog(@"Delete %@ executed", fileName);
        [self.s3 deleteObjectWithKey:fileName withBucket:BUCKET];
    }
    @catch (NSException *exception) {
        NSLog(@"Cannot Delete:  %@",exception);
    }
    
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




@end
