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

@interface DAO : NSObject {
    sqlite3 *navctrlDB;
    NSString *dbPathString;
}


@property (nonatomic, strong) NSMutableArray* companies;
@property (nonatomic, strong) Company* selectedCompany;

- (id)init;
- (void) copyOrOpenDB;
- (void)deleteProduct: (Product *) product;
-(void)deleteData:(NSString *)deleteQuery;
- (void) readCompanyFromDatabase;
- (void) readProductsFromDatabase;

@end
