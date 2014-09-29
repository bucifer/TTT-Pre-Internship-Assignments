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
    Product *ipad = [[Product alloc]initWithName:@"iPad" Image:@"ipad.png" url:@"https://www.apple.com/ipad/" Company:@"Apple"];
    Product *ipod_touch = [[Product alloc]initWithName:@"iPod Touch" Image:@"ipod_touch.png" url:@"http://www.apple.com/ipod-touch" Company:@"Apple"];
    Product *iphone = [[Product alloc]initWithName:@"iPhone" Image:@"iphone.png" url:@"https://www.apple.com/iphone/" Company:@"Apple"];
    apple1.products = [[NSMutableArray alloc]
                       initWithObjects:
                       ipad, ipod_touch, iphone, nil];
    
    Company *samsung2 = self.companies[1];
    //Put product objects into the products array for the company
    Product *s4 = [[Product alloc]initWithName:@"Galaxy S4" Image:@"galaxy_s4.png" url:@"http://www.samsung.com/global/microsite/galaxys4/" Company:@"Samsung"];
    Product *note = [[Product alloc]initWithName:@"Galaxy Note" Image:@"galaxy_note.jpg_256" url:@"http://www.samsung.com/global/microsite/galaxynote/note/index.html" Company:@"Samsung"];
    Product *tab = [[Product alloc]initWithName:@"Galaxy Tab" Image:@"galaxy_tab.jpg" url:@"http://www.samsung.com/us/mobile/galaxy-tab/" Company:@"Samsung"];
    samsung2.products = [[NSMutableArray alloc]
                         initWithObjects: s4, note, tab, nil];
    
    Company *htc3 = self.companies[2];
    Product *m8 = [[Product alloc]initWithName:@"HTC One M8" Image:@"htc_m8.jpg" url:@"http://www.htc.com/us/smartphones/htc-one-m8/" Company:@"HTC"];
    Product *remix = [[Product alloc]initWithName:@"HTC One Remix" Image:@"htc_one_remix.png" url:@"http://www.htc.com/us/smartphones/htc-one-remix/" Company:@"HTC"];
    Product *flyer = [[Product alloc]initWithName:@"HTC Flyer" Image:@"htc_flyer.png" url:@"http://www.amazon.com/HTC-Flyer-Android-Tablet-16/dp/B0053RJ3F8" Company:@"HTC"];
    htc3.products = [[NSMutableArray alloc]
                     initWithObjects: m8, remix, flyer, nil];
    
    
    Company *motorola4 = self.companies[3];
    Product *moto_x = [[Product alloc]initWithName:@"Moto X" Image:@"moto_x.png" url:@"https://www.motorola.com/us/motomaker?pid=FLEXR2" Company:@"Motorola"];
    Product *moto_g = [[Product alloc]initWithName:@"Moto G" Image:@"moto_g.jpg" url:@"http://www.motorola.com/us/moto-g-pdp-1/Moto-G-(1st-Gen.)/moto-g-pdp.html" Company:@"Motorola"];
    Product *moto_360 = [[Product alloc]initWithName:@"Moto 360" Image:@"moto_360.png" url:@"http://www.androidcentral.com/moto-360" Company:@"Motorola"];
    motorola4.products = [[NSMutableArray alloc]
                          initWithObjects: moto_x, moto_g, moto_360, nil];
    for (int i=0; i < motorola4.products.count; i++) {
        Product *selectedProduct = motorola4.products[i];
        selectedProduct.company = motorola.name;
    }
    
    [self copyOrOpenDB];
    
    return self;
}

#pragma mark Core Data methods

-(NSString*) archivePath
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    dbPathString = [docPath stringByAppendingPathComponent:@"store.data"];
    return dbPathString;
}

-(void)copyOrOpenDB
{
    model = [NSManagedObjectModel mergedModelFromBundles:nil];
    psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    NSString *path = [self archivePath];
    NSLog(path);
    storeURL = [NSURL fileURLWithPath:path];

    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if(![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]){
        [NSException raise:@"Open failed" format:@"Reason: %@", [error localizedDescription]];
    }
    context = [[NSManagedObjectContext alloc] init];
    [context setPersistentStoreCoordinator:psc];
    [context setUndoManager:nil];
    
    
    if (![fileManager fileExistsAtPath:dbPathString]) {

        
        for (int i=0; i < self.companies.count; i++) {
            Company *company = self.companies[i];
            [self createCompany:company.name image: company.image stockSymbol:company.stockSymbol];
            for (int j=0; j < company.products.count; j++) {
                Product *product = company.products[j];
                [self createProduct:product.name image:product.image url:product.url Company:product.company];
            }
        }
        [self saveChanges];
    }
    else {
        //else, we just read from Core Data
        [self readCompanyFromCoreData];
        [self readProductsFromCoreData];
    }
}

- (void) readCompanyFromCoreData {
        [self.companies removeAllObjects];
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        NSEntityDescription *e = [[model entitiesByName] objectForKey:@"Company"];
        [request setEntity:e];
        NSError *error = nil;
        NSArray *result = [context executeFetchRequest:request error:&error];
        if(!result){
            [NSException raise:@"Fetch Failed" format:@"Reason: %@", [error localizedDescription]];
        }
        self.companies = [[NSMutableArray alloc]initWithArray:result];
        NSLog(@"We read %lu counts of Company Objects", (unsigned long)self.companies.count);
}

- (void) readProductsFromCoreData {
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        NSEntityDescription *e = [[model entitiesByName] objectForKey:@"Product"];
        [request setEntity:e];
        NSError *error = nil;
        NSArray *result = [context executeFetchRequest:request error:&error];
        if(!result){
            [NSException raise:@"Fetch Failed" format:@"Reason: %@", [error localizedDescription]];
        }
        self.products = [[NSMutableArray alloc]initWithArray:result];
        //self.products is just for organization - it's not for presentation
        //for presentation, we have to associate each product to the appropriate company
    
        //this loop is to go through all the products we got from Core Data, and delegate it to the appropriate "products" array under each company
        for (int i=0; i < self.products.count; i++) {
            Product *product = self.products[i];
            for (int j=0; j < self.companies.count; j++) {
                Company *company = self.companies[j];
                if ([product.company isEqualToString:company.name]) {
                    [company.products addObject:product];
                }
            }
        }
    
        NSLog(@"We read from the Products Core Data and inserted them into appropriate company arrays");
}

-(void)createCompany:(NSString*)name image:(NSString*)image stockSymbol:(NSString*) stockSymbol;
{
    Company *company = [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:context];
    
    company.name = name;
    company.image = image;
    company.stockSymbol = stockSymbol;
}

-(void)createProduct:(NSString*)name image:(NSString*)image url:(NSString*) url Company: (NSString *)company{
    Product *product = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:context];
    
    product.name = name;
    product.image = image;
    product.url = url;
    product.company = company;
}


- (void) deleteProduct: (Product*) product {
    NSLog(@"deleteProduct method called");

    //Then we delete from our Core Data
    [context deleteObject:product];
    [self saveChanges];
    NSLog(@"Product %@ Delete successful", product.name);
}


-(void) saveChanges
{
    NSError *err = nil;
    BOOL successful = [context save:&err];
    if(!successful){
        NSLog(@"Error saving: %@", [err localizedDescription]);
    }
    NSLog(@"Data Saved");
}


@end