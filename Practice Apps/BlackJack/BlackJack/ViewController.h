//
//  ViewController.h
//  BlackJack
//
//  Created by Aditya Narayan on 10/17/14.
//  Copyright (c) 2014 TerrysCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController




@property (strong, nonatomic) NSMutableArray* availableCardsInDeck;


@property (strong, nonatomic) IBOutlet UIImageView *dealerCardOne;
@property (strong, nonatomic) IBOutlet UIImageView *dealerCardTwo;




@property (strong, nonatomic) IBOutlet UIButton *playButton;



@property (strong, nonatomic) IBOutlet UIImageView *playerCardOne;
@property (strong, nonatomic) IBOutlet UIImageView *playerCardTwo;


- (IBAction)playButtonPressAction:(id)sender;



@end

