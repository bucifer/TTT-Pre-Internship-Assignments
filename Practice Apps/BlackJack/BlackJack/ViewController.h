//
//  ViewController.h
//  BlackJack
//
//  Created by Aditya Narayan on 10/17/14.
//  Copyright (c) 2014 TerrysCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCardButton.h"

@interface ViewController : UIViewController




@property (strong, nonatomic) NSMutableArray* availableCardsInDeck;

@property (strong, nonatomic) IBOutlet CustomCardButton *dealerCardOne;
@property (strong, nonatomic) IBOutlet CustomCardButton *dealerCardTwo;
@property (strong, nonatomic) IBOutlet CustomCardButton *playerCardOne;
@property (strong, nonatomic) IBOutlet CustomCardButton *playerCardTwo;

@property (strong, nonatomic) IBOutlet UILabel *dealerScore;
@property (strong, nonatomic) IBOutlet UILabel *playerScore;


@property (strong, nonatomic) IBOutlet UIButton *playButton;




- (IBAction)playButtonPressAction:(id)sender;



@end

