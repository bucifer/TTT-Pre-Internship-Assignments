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



- (id)coreDataInitFirstTime {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    CompanyCoreData *apple = [self coreDataInitCustomCDCompany:@"Apple" image:@"apple.png" stockSymbol:@"AAPL" orderID:@0 moc:context];
    CompanyCoreData *samsung = [self coreDataInitCustomCDCompany:@"Samsung" image:@"samsung.png" stockSymbol:@"SSNLF" orderID:@1 moc:context];
    CompanyCoreData *htc = [self coreDataInitCustomCDCompany:@"HTC" image:@"htc.jpg" stockSymbol:@"HTCXF" orderID:@2 moc:context];
    CompanyCoreData *motorola = [self coreDataInitCustomCDCompany:@"Motorola" image:@"motorola.gif" stockSymbol:@"MSI" orderID:@3 moc:context];
    
    self.companies = [[NSMutableArray alloc] initWithObjects:
                      apple, samsung, htc, motorola, nil];
    
    ProductCoreData *ipad = [self coreDataInitCustomCDProduct:@"iPad" image:@"ipad.png" url:@"https://www.apple.com/ipad/" company:@"Apple" moc:context orderID:@0 uniqueID:@0];
    ProductCoreData *ipodTouch = [self coreDataInitCustomCDProduct:@"iPod Touch" image:@"ipod_touch.png" url:@"http://www.apple.com/ipod-touch" company:@"Apple" moc:context orderID:@1 uniqueID:@1];
    ProductCoreData *iphone = [self coreDataInitCustomCDProduct:@"iPhone" image:@"iphone.png" url:@"http://www.apple.com/iphone" company:@"Apple" moc:context orderID:@2 uniqueID:@3];
    
    ProductCoreData *s4 = [self coreDataInitCustomCDProduct:@"Galaxy S4" image:@"galaxy_s4.png" url:@"http://www.samsung.com/global/microsite/galaxys4/" company:@"Samsung" moc:context orderID:@0 uniqueID:@4];
    ProductCoreData *note = [self coreDataInitCustomCDProduct:@"Galaxy Note" image:@"galaxy_note.jpg_256" url:@"http://www.samsung.com/global/microsite/galaxynote/note/index.html?type=find" company:@"Samsung" moc:context orderID:@1 uniqueID:@5];
    ProductCoreData *tab = [self coreDataInitCustomCDProduct:@"Galaxy Tab" image:@"galaxy_tab.jpg" url:@"http://www.samsung.com/us/mobile/galaxy-tab/" company:@"Samsung" moc:context orderID:@2 uniqueID:@6];

    ProductCoreData *m8 = [self coreDataInitCustomCDProduct:@"HTC One M8" image:@"htc_m8.jpg" url:@"http://www.htc.com/us/smartphones/htc-one-m8/" company:@"HTC" moc:context orderID:@0 uniqueID:@7];
    ProductCoreData *remix = [self coreDataInitCustomCDProduct:@"HTC One Remix" image:@"htc_one_remix.png" url:@"http://www.htc.com/us/smartphones/htc-one-remix/" company:@"HTC" moc:context orderID:@1 uniqueID:@8];
    ProductCoreData *flyer = [self coreDataInitCustomCDProduct:@"HTC Flyer" image:@"htc_flyer.png" url:@"http://www.amazon.com/HTC-Flyer-Android-Tablet-16/dp/B0053RJ3F8" company:@"HTC" moc:context orderID:@2 uniqueID:@9];


    ProductCoreData *moto_x = [self coreDataInitCustomCDProduct:@"Moto X" image:@"moto_x.png" url:@"https://www.motorola.com/us/motomaker?pid=FLEXR2" company:@"Motorola" moc:context orderID:@0 uniqueID:@1];
    ProductCoreData *moto_g = [self coreDataInitCustomCDProduct:@"Moto G" image:@"moto_g.jpg" url:@"http://www.motorola.com/us/moto-g-pdp-1/Moto-G-(1st-Gen.)/moto-g-pdp.html" company:@"Motorola" moc:context orderID:@1 uniqueID:@11];
    ProductCoreData *moto_360 = [self coreDataInitCustomCDProduct:@"Moto 360" image:@"moto_360.png" url:@"http://www.androidcentral.com/moto-360" company:@"Motorola" moc:context orderID:@2 uniqueID:@12];
    
    self.products = [[NSMutableArray alloc] initWithObjects:
                     ipad, ipodTouch, iphone, s4, note, tab, m8, remix, flyer, moto_x, moto_g, moto_360, nil];    
    
    return self;
}

- (CompanyCoreData*) coreDataInitCustomCDCompany: (NSString *)put_name image:(NSString*)put_image stockSymbol:(NSString *)put_symbol orderID:(NSNumber *)put_orderID moc:(NSManagedObjectContext *)context {
    
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

- (ProductCoreData*) coreDataInitCustomCDProduct: (NSString *)put_name image:(NSString*)put_image url:(NSString *)put_url company:(NSString *)put_company moc:(NSManagedObjectContext*) context orderID:(NSNumber *)put_order_id uniqueID:(NSNumber *)put_unique_id  {
    
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




- (void) deleteProduct: (ProductPresentationLayer*) product {
    NSLog(@"deleteProduct method called from childviewcontroller");
    
    NSString *tempName = product.name;
    
    //We delete product from the DAO presentation layer in 2 ways
    //first from DAO.products and
    //two from childtableviewcontroller's own array - this duplication happened due to NSPredicate usage --> check prepareForSegue between parentvc and childvc
    
    [self.products removeObject:product];
    [self.childTableViewController.productsArrayForAppropriateCompany removeObject:product];

    //Then we delete product from either Core Data or SQLite
    
    if (self.databaseManager.databaseChoice == CoreData) {
        //It's tricky for Core Data Layer because we are passing the PresentationLayer Product to this method
        //right now, self.products is filled with PresentationLayer objects. We need to find the right CoreDataLayer objects that correspond to them
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription
                                       entityForName:@"ProductCoreData" inManagedObjectContext:[self managedObjectContext]];
        [fetchRequest setEntity:entity];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"unique_id = %@", product.unique_id];
        [fetchRequest setPredicate:predicate];
        NSError *error;
        NSArray *fetchedResult = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
        
        ProductCoreData *correspondingProductCoreDataToDelete = fetchedResult[0];
        
        [self.managedObjectContext deleteObject:correspondingProductCoreDataToDelete];
        
        //Then we save
        [self saveChanges];
        
        //Just for logging
        NSLog(@"Product %@ Deleted from Core Data", tempName);
    }
    else if (self.databaseManager.databaseChoice == SQLite) {
        [self.databaseManager deleteDataFromSQLite:[NSString stringWithFormat:@"DELETE FROM PRODUCT WHERE ID IS %@", product.unique_id]];
        NSLog(@"Product %@ Delete successful", tempName);
    }
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
