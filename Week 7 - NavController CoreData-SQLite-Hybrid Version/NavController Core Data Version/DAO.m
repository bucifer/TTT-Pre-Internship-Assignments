//
//  DAO.m
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 9/23/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "DAO.h"

@implementation DAO

@synthesize managedObjectContext;

//we need this to retrieve managed object context and later save data (for both Controllers)
- (NSManagedObjectContext *) managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}



- (id)initFirstTime {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    CompanyCoreData *apple = [self TBinitCompany:@"Apple" image:@"apple.png" stockSymbol:@"AAPL" orderID:@0 moc:context];
    CompanyCoreData *samsung = [self TBinitCompany:@"Samsung" image:@"samsung.png" stockSymbol:@"SSNLF" orderID:@1 moc:context];
    CompanyCoreData *htc = [self TBinitCompany:@"HTC" image:@"htc.jpg" stockSymbol:@"HTCXF" orderID:@2 moc:context];
    CompanyCoreData *motorola = [self TBinitCompany:@"Motorola" image:@"motorola.gif" stockSymbol:@"MSI" orderID:@3 moc:context];
    
    self.companies = [[NSMutableArray alloc] initWithObjects:
                      apple, samsung, htc, motorola, nil];
    
    ProductCoreData *ipad = [self TBinitProduct:@"iPad" image:@"ipad.png" url:@"https://www.apple.com/ipad/" company:@"Apple" moc:context orderID:@0 uniqueID:@0];
    ProductCoreData *ipodTouch = [self TBinitProduct:@"iPod Touch" image:@"ipod_touch.png" url:@"http://www.apple.com/ipod-touch" company:@"Apple" moc:context orderID:@1 uniqueID:@1];
    ProductCoreData *iphone = [self TBinitProduct:@"iPhone" image:@"iphone.png" url:@"http://www.apple.com/iphone" company:@"Apple" moc:context orderID:@2 uniqueID:@3];
    
    ProductCoreData *s4 = [self TBinitProduct:@"Galaxy S4" image:@"galaxy_s4.png" url:@"http://www.samsung.com/global/microsite/galaxys4/" company:@"Samsung" moc:context orderID:@0 uniqueID:@4];
    ProductCoreData *note = [self TBinitProduct:@"Galaxy Note" image:@"galaxy_note.jpg_256" url:@"http://www.samsung.com/global/microsite/galaxynote/note/index.html?type=find" company:@"Samsung" moc:context orderID:@1 uniqueID:@5];
    ProductCoreData *tab = [self TBinitProduct:@"Galaxy Tab" image:@"galaxy_tab.jpg" url:@"http://www.samsung.com/us/mobile/galaxy-tab/" company:@"Samsung" moc:context orderID:@2 uniqueID:@6];

    ProductCoreData *m8 = [self TBinitProduct:@"HTC One M8" image:@"htc_m8.jpg" url:@"http://www.htc.com/us/smartphones/htc-one-m8/" company:@"HTC" moc:context orderID:@0 uniqueID:@7];
    ProductCoreData *remix = [self TBinitProduct:@"HTC One Remix" image:@"htc_one_remix.png" url:@"http://www.htc.com/us/smartphones/htc-one-remix/" company:@"HTC" moc:context orderID:@1 uniqueID:@8];
    ProductCoreData *flyer = [self TBinitProduct:@"HTC Flyer" image:@"htc_flyer.png" url:@"http://www.amazon.com/HTC-Flyer-Android-Tablet-16/dp/B0053RJ3F8" company:@"HTC" moc:context orderID:@2 uniqueID:@9];


    ProductCoreData *moto_x = [self TBinitProduct:@"Moto X" image:@"moto_x.png" url:@"https://www.motorola.com/us/motomaker?pid=FLEXR2" company:@"Motorola" moc:context orderID:@0 uniqueID:@1];
    ProductCoreData *moto_g = [self TBinitProduct:@"Moto G" image:@"moto_g.jpg" url:@"http://www.motorola.com/us/moto-g-pdp-1/Moto-G-(1st-Gen.)/moto-g-pdp.html" company:@"Motorola" moc:context orderID:@1 uniqueID:@11];
    ProductCoreData *moto_360 = [self TBinitProduct:@"Moto 360" image:@"moto_360.png" url:@"http://www.androidcentral.com/moto-360" company:@"Motorola" moc:context orderID:@2 uniqueID:@12];
    
    self.products = [[NSMutableArray alloc] initWithObjects:
                     ipad, ipodTouch, iphone, s4, note, tab, m8, remix, flyer, moto_x, moto_g, moto_360, nil];

    [self saveChanges];
    
    
    return self;
}

- (CompanyCoreData*) TBinitCompany: (NSString *)put_name image:(NSString*)put_image stockSymbol:(NSString *)put_symbol orderID:(NSNumber *)put_orderID moc:(NSManagedObjectContext *)context {
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CompanyCoreData" inManagedObjectContext:context];
    CompanyCoreData *company = [[CompanyCoreData alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    //if the insertIntoManagedObjectContext argument is nil, means this is just a pointer and not getting saved into context
    //http://stackoverflow.com/questions/8139033/use-nsmanagedobject-class-without-initwithentity for more info
    
    company.name = put_name;
    company.image = put_image;
    company.stockSymbol = put_symbol;
    company.order_id = put_orderID;
    
    return company;
}

- (ProductCoreData*) TBinitProduct: (NSString *)put_name image:(NSString*)put_image url:(NSString *)put_url company:(NSString *)put_company moc:(NSManagedObjectContext*) context orderID:(NSNumber *)put_order_id uniqueID:(NSNumber *)put_unique_id  {
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ProductCoreData" inManagedObjectContext:context];
    ProductCoreData *product = [[ProductCoreData alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    
    product.name = put_name;
    product.image = put_image;
    product.url = put_url;
    product.company = put_company;
    product.order_id = put_order_id;
    product.unique_id = put_unique_id;
    
    return product;
}


- (NSMutableArray *) requestCDAndFetchAndSort: (NSString *) entityName sortDescriptorByString:(NSString *)sortDescriptorString {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:entityName inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortDescriptorString ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error;
    NSArray *fetchedResult = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    
    return [fetchedResult mutableCopy];
}




- (void) deleteProduct: (ProductPresentationLayer*) product {
    NSLog(@"deleteProduct method called from childviewcontroller");
    
    NSString *tempName = product.name;
    
    //We delete product from the DAO presentation layer
    [self.childTableViewController.productsArrayForAppropriateCompany removeObject:product];
    
    
    //Then we delete product from Core Data layer
    
    //It's tricky because we are passing the PresentationLayer Product to this method
    //we have to find the CoreData product from our DAO.products array that matches this presentationlayer product and then run managedObjectContext delete
    //I decided to use a unique_id property to find the match using Predicate
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"unique_id == %@", product.unique_id];
    NSArray *filteredArray = [self.products filteredArrayUsingPredicate:predicate];
    
    [self.managedObjectContext deleteObject:filteredArray[0]];
    
    //Then we save
    [self saveChanges];
    
    //Just for logging
    NSLog(@"Product %@ Deleted", tempName);
}


-(void) saveChanges
{
    NSError *err = nil;
    BOOL successful = [self.managedObjectContext save:&err];
    if(!successful){
        NSLog(@"Error saving: %@", [err localizedDescription]);
    } else {
        NSLog(@"Data Saved without errors");
    }
}



@end
