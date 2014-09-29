//
//  DAO.m
//  NavCtrl
//
//  Created by Aditya Narayan on 9/16/14.
//  Copyright (c) 2014 Aditya Narayan. All rights reserved.
//

#import "DAO.h"


@implementation DAO

- (id)init {
    
    Company *apple = [[Company alloc]initWithName:@"Apple" Image:@"apple.png" symbol:@"AAPL" ];
    Company *samsung = [[Company alloc]initWithName:@"Samsung" Image:@"samsung.png" symbol:@"SSNLF"];
    Company *htc = [[Company alloc]initWithName:@"HTC" Image:@"htc.jpg" symbol:@"htcxf"];
    Company *motorola = [[Company alloc]initWithName: @"Motorola" Image: @"motorola.gif" symbol:@"MSI"];

    

    
    
    
    self.companies = [[NSMutableArray alloc]
                      initWithObjects:
                      apple, samsung, htc, motorola, nil];
    
    Company *apple1 = self.companies[0];
    //Put product objects into the products array for the company
    Product *ipad = [[Product alloc]initWithName:@"iPad" Image:@"ipad.png" url:@"https://www.apple.com/ipad/"];
    Product *ipod_touch = [[Product alloc]initWithName:@"iPod Touch" Image:@"ipod_touch.png" url:@"http://www.apple.com/ipod-touch"];
    Product *iphone = [[Product alloc]initWithName:@"iPhone" Image:@"iphone.png" url:@"https://www.apple.com/iphone/"];
    apple1.products = [[NSMutableArray alloc]
                       initWithObjects:
                       ipad, ipod_touch, iphone, nil];
    
    
    Company *samsung2 = self.companies[1];
    //Put product objects into the products array for the company
    Product *s4 = [[Product alloc]initWithName:@"Galaxy S4" Image:@"galaxy_s4.png" url:@"http://www.samsung.com/global/microsite/galaxys4/"];
    Product *note = [[Product alloc]initWithName:@"Galaxy Note" Image:@"galaxy_note.jpg_256" url:@"http://www.samsung.com/global/microsite/galaxynote/note/index.html"];
    Product *tab = [[Product alloc]initWithName:@"Galaxy Tab" Image:@"galaxy_tab.jpg" url:@"http://www.samsung.com/us/mobile/galaxy-tab/"];
    samsung2.products = [[NSMutableArray alloc]
                         initWithObjects: s4, note, tab, nil];
    
    Company *htc3 = self.companies[2];
    Product *m8 = [[Product alloc]initWithName:@"HTC One M8" Image:@"htc_m8.jpg" url:@"http://www.htc.com/us/smartphones/htc-one-m8/"];
    Product *remix = [[Product alloc]initWithName:@"HTC One Remix" Image:@"htc_one_remix.png" url:@"http://www.htc.com/us/smartphones/htc-one-remix/"];
    Product *flyer = [[Product alloc]initWithName:@"HTC Flyer" Image:@"htc_flyer.png" url:@"http://www.amazon.com/HTC-Flyer-Android-Tablet-16/dp/B0053RJ3F8"];
    htc3.products = [[NSMutableArray alloc]
                     initWithObjects: m8, remix, flyer, nil];
    
    Company *motorola4 = self.companies[3];
    Product *moto_x = [[Product alloc]initWithName:@"Moto X" Image:@"moto_x.png" url:@"https://www.motorola.com/us/motomaker?pid=FLEXR2"];
    Product *moto_g = [[Product alloc]initWithName:@"Moto G" Image:@"moto_g.jpg" url:@"http://www.motorola.com/us/moto-g-pdp-1/Moto-G-(1st-Gen.)/moto-g-pdp.html"];
    Product *moto_360 = [[Product alloc]initWithName:@"Moto 360" Image:@"moto_360.png" url:@"http://www.androidcentral.com/moto-360"];
    motorola4.products = [[NSMutableArray alloc]
                          initWithObjects: moto_x, moto_g, moto_360, nil];
    
    return self;
}





@end
