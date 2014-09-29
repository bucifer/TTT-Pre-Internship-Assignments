//
//  DAO.h
//  NavCtrl
//
//  Created by Aditya Narayan on 9/16/14.
//  Copyright (c) 2014 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Product.h"
#import "sqlite3.h"
#import <CoreData/CoreData.h>

@interface DAO : NSObject {
    NSString *dbPathString;
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
    NSPersistentStoreCoordinator *psc;
    NSURL *storeURL;
}

@property (nonatomic, strong) NSMutableArray* companies;
@property (nonatomic, strong) NSMutableArray* products;

@property (nonatomic, strong) Company* selectedCompany;

- (id)init;
- (void) copyOrOpenDB;

-(void)createCompany:(NSString*)name image:(NSString*)image stockSymbol:(NSString*) stockSymbol;
-(void)createProduct:(NSString*)name image:(NSString*)image url:(NSString*) url Company:(NSString *) company;


- (void)deleteProduct: (Product *) product;

- (void) readCompanyFromCoreData;
- (void) readProductsFromCoreData;

@end
