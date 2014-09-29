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
    

    [self copyOrOpenDB];
    
    return self;
}

//There's gonna be a whole bunch of columns
//Company Table
//Product Table
//Download sqlite browser, use that interface to enter in all the column data

-(void)copyOrOpenDB
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    dbPathString = [docPath stringByAppendingPathComponent:@"terry.sqlite3"];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:dbPathString]) {
        //if we don't find something at the datapath, we copy one from the desktop.
        NSLog(@"we couldn't find a database at your dbPathstring so we are going to copy");
        NSError *copyError;
        NSString *desktopDBPath = @"/Users/adityanarayan/Desktop/terry.sqlite3";
        BOOL readFromDesktopSuccess = [fileManager fileExistsAtPath:desktopDBPath];
        if (readFromDesktopSuccess) {
            BOOL copySuccess;
            copySuccess = [fileManager copyItemAtPath:desktopDBPath toPath:dbPathString error:&copyError];
            if (!copySuccess) NSAssert1(0, @"Failed with message '%@'.", [copyError localizedDescription]);
        }
        else {
            NSLog(@"Failed to locate desktop database");
        }
    }
    else {
        //But if we do find something already existing, then we just open it
        NSLog(@"We found an existing db file at your dbPathString so reading from database");
        [self readCompanyFromDatabase];
        [self readProductsFromDatabase];
        }
}

- (void) readCompanyFromDatabase {
    sqlite3_stmt *statement ;
    if (sqlite3_open([dbPathString UTF8String], &navctrlDB)==SQLITE_OK) {
        [self.companies removeAllObjects];
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM COMPANY"];
        const char *query_sql = [querySQL UTF8String];
        if (sqlite3_prepare(navctrlDB, query_sql, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement)== SQLITE_ROW)
            {
                NSString *name = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                NSString *image = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                NSString *stockSymbol = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 3)];
                Company *company = [[Company alloc]init];
                company.name = name;
                company.image = image;
                company.stockSymbol = stockSymbol;
                company.products = [[NSMutableArray alloc] init];
                [self.companies addObject:company];
            }
        }
    }
    sqlite3_finalize(statement);
    sqlite3_close(navctrlDB);
    NSLog(@"We read from the Company Table");
}

- (void) readProductsFromDatabase {
    //put it in different statement
    sqlite3_stmt *statement;
    if (sqlite3_open([dbPathString UTF8String], &navctrlDB)==SQLITE_OK) {
    NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM PRODUCT"];
    const char *query_sql = [querySQL UTF8String];
        if (sqlite3_prepare(navctrlDB, query_sql, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement)== SQLITE_ROW)
            {
                NSString *name = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                NSString *image = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                NSString *url = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 3)];
                Product *product = [[Product alloc]init];
                product.name = name;
                product.image = image;
                product.url = url;
                NSString* Products_Company = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 4)];
                ////loop through every company in your companies array,
                ////with every row in the Product table, and if it equals a certain company, then you put it in the companies.product array
                for (int i=0; i < self.companies.count; i++) {
                    Company* selectedCompany = self.companies[i];
                    if ([selectedCompany.name isEqualToString: Products_Company]) {
                        NSLog(@"found a match at %@ with %@", selectedCompany.name, product.name);
                        [selectedCompany.products addObject: product];
                    }
                }
            }
        }
    }
    sqlite3_finalize(statement);
    sqlite3_close(navctrlDB);
    NSLog(@"We read from the Product Table");
}




- (void) deleteProduct: (Product*) product {
    NSLog(@"deleteProduct method called");
    [self.selectedCompany.products removeObject:product];
    //you send the delete SQL query
    [self deleteData:[NSString stringWithFormat:@"DELETE FROM PRODUCT WHERE NAME IS '%s'", [product.name UTF8String]]];
    NSLog(@"Product %@ Delete successful", product.name);
}

-(void)deleteData:(NSString *)deleteQuery {
    sqlite3_stmt *statement ;
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    dbPathString = [docPath stringByAppendingPathComponent:@"terry.sqlite3"];
    const char *dbPath = [dbPathString UTF8String];
    if (sqlite3_open(dbPath, &navctrlDB)==SQLITE_OK) {
            if (sqlite3_prepare_v2(navctrlDB, [deleteQuery UTF8String], -1, &statement, NULL)==SQLITE_OK) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Delete" message:@"Product Deleted" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
                [alert show];
                if (sqlite3_step(statement) == SQLITE_DONE) {
//                    NSLog(@"Sqlite3 step done");
                }
            }
            else {
                NSLog(@"Database Error Message : %s", sqlite3_errmsg(navctrlDB));
            }
        sqlite3_finalize(statement);
        sqlite3_close(navctrlDB);
    }
}


@end