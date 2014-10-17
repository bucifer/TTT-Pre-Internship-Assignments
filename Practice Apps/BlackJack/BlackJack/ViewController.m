//
//  ViewController.m
//  BlackJack
//
//  Created by Aditya Narayan on 10/17/14.
//  Copyright (c) 2014 TerrysCompany. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.playButton.layer.cornerRadius = 10;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)playButtonPressAction:(id)sender {
    
    NSMutableArray *myIntegers = [[NSMutableArray array]init];
    
    for (NSInteger i = 1; i <= 52; i++) {
        [myIntegers addObject:[NSNumber numberWithInteger:i]];
    }
    
    self.availableCardsInDeck= myIntegers;
    
    
    self.playerCardOne.cardValue = 3;

    
    [self.playerCardOne setBackgroundImage:[UIImage imageNamed:[self randomCardNumberStringGeneratorUnique]] forState:UIControlStateNormal  ];
    [self.playerCardTwo setBackgroundImage:[UIImage imageNamed:[self randomCardNumberStringGeneratorUnique]] forState:UIControlStateNormal  ];
    
    self.playerScore.text = [NSString stringWithFormat:@"%ld", (long)self.playerCardOne.cardValue];
    
    
    [self.dealerCardOne setBackgroundImage:[UIImage imageNamed:[self randomCardNumberStringGeneratorUnique]] forState:UIControlStateNormal  ];
    [self.dealerCardTwo setBackgroundImage:[UIImage imageNamed:[self randomCardNumberStringGeneratorUnique]] forState:UIControlStateNormal  ];
    
}


- (NSString *) randomCardNumberStringGeneratorUnique {
    
    NSLog(@"Available cards count: %lu", (unsigned long)self.availableCardsInDeck.count);
    int r = arc4random_uniform(self.availableCardsInDeck.count-1) + 1;
    NSLog(@"%d", r);
    
    if ([self.availableCardsInDeck containsObject:@(r)]) {
        NSLog(@"Deck still contains number %d", r);
        int temp = r;
        
        //we remove it from our deck first
        [self.availableCardsInDeck removeObject:@(r)];
        
        //we return the temp, since r is not in the deck anymore
        return [NSString stringWithFormat:@"%d", temp];
    }
    else {
        NSLog(@"Deck can't find number %d", r);
        NSLog(@"Looking for new Number ...");
        return [self randomCardNumberStringGeneratorUnique];
    }
    
    return nil;
}





@end
