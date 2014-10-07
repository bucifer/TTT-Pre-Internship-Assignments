//
//  DEMOSimpleTableViewController.m
//  SimpleTableView
//
//  Created by Aditya on 20/10/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import "DEMOSimpleTableViewController.h"

@implementation DEMOSimpleTableViewController


-(id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    items = [[NSMutableArray alloc] init];
    for(int i=0;i< 10; i++){
        NSString *data = [[NSString alloc] initWithFormat:@"Row: %d",i+1];
        [items addObject:data];
    }
    
    return self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if(!cell){
        cell =
        [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    [[cell textLabel] setText: [items objectAtIndex:[indexPath row]]];
    [[cell imageView] setImage: [UIImage imageNamed:@"pika.gif"]];
    
    return cell;
}

@end
