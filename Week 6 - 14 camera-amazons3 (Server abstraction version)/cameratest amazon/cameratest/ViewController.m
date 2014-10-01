//
//  ViewController.m
//  CameraTest
//
//  Created by Aditya on 02/10/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    urlStr = @"http://bengalboard.com:8080/AmazonS3Web/AWSService";
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)edit:(id)sender{
    if([tblView isEditing]){
        [sender setTitle:@"Edit"];
    }
    else{
        [sender setTitle:@"Done"];
    }
    [tblView setEditing:![tblView isEditing]];
}

- (IBAction)takePicture:(id)sender{
    
    if([pop isPopoverVisible]){
        [pop dismissPopoverAnimated:YES];
        pop = nil;
        return;
    }
    
    UIImagePickerController *ip = [[UIImagePickerController alloc] init]; 
    
    if( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ){
      
        [ip setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else
    {
        [ip setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
 
    }
    
    [ip setAllowsEditing:TRUE];

    [ip setDelegate:self];
    
    pop = [[UIPopoverController alloc]initWithContentViewController:ip];
    
    [pop setDelegate:self];
    
    [pop presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    
}


-(void) loaderDidLoad:(AsyncLoader *)loader{
    
    if([@"ListFiles"isEqual:loader.textTag])
    {
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: loader.ldData options: NSJSONReadingMutableContainers error: nil];
        tableData =jsonArray;
        NSLog(@"Loading.........%d Records",[tableData count]);
        [tblView reloadData];
    }
    if([@"SaveImage"isEqual:loader.textTag])
    {
        NSLog(@"Save Image:%@", [loader text]);
        [self loadData];
    }
    if([@"DeleteImage"isEqual:loader.textTag])
    {
        NSLog(@"Delete Image:%@", [loader text]);
        [self loadData];
    }
    if([@"LoadImage"isEqual:loader.imagTag])
    {
        imageView.image = loader.image;
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [pop dismissPopoverAnimated:YES];
    pop = nil;
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [imageView setImage:image];
    
    AsyncLoader *loader = [[AsyncLoader alloc] init];
    [loader load:urlStr txt:@"SaveImage" img:nil delegate:self
    paramKeys:@[@"fileSave"] paramVals:@[@"TRUE"]
    paramImage:image fileName:nil];
 
    
    
}


-(void)loadData
{
    AsyncLoader *loader = [[AsyncLoader alloc] init];
    [loader load:urlStr txt:@"ListFiles" img:nil delegate:self params:@"listFile=uploads/"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if(!cell){
        cell =
        [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    [[cell textLabel] setText: [tableData objectAtIndex: indexPath.row ]];
    return cell;
}

- (void)tableView: (UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
    NSString *params = [[NSString alloc] initWithFormat:@"getFile=%@",[tableData objectAtIndex: indexPath.row ]];
    AsyncLoader *loader = [[AsyncLoader alloc] init];
    [loader load:urlStr txt:nil img:@"LoadImage" delegate:self params:params];
    
}

- (void) tableView: (UITableView *)tableView  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *params = [[NSString alloc] initWithFormat:@"delFile=%@",[tableData objectAtIndex: indexPath.row ]];
    AsyncLoader *loader = [[AsyncLoader alloc] init];
    [loader load:urlStr txt:@"DeleteImage" img:nil delegate:self params:params];
    
}


@end
