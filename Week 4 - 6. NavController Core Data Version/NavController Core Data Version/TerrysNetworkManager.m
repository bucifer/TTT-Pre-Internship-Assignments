//
//  TerrysNetworkManager.m
//  NavController Core Data Version
//
//  Created by Aditya Narayan on 10/10/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#import "TerrysNetworkManager.h"

@implementation TerrysNetworkManager {
    NSMutableData *receivedStockPriceData;
}


- (void) fireYahooRequest {
    //making URL Request;
    NSURL *everything_url = [NSURL URLWithString:@"http://download.finance.yahoo.com/d/quotes.csv?s=%40%5EDJI,AAPL,SSNLF,htcxf,MSI&f=sl1&e=.csv"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:everything_url];
    //specify that it is a GET request
    request.HTTPMethod = @"GET";
    
    //create url connection and fire the request you made before
    NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest: request delegate: self];
    
    [self.parentTableVC.tableView reloadData];
}

#pragma mark NSURLConnection Delegate Methods
//pragma marks make it easy to use Xcode jump bar to jump to different sections of your code, just a way of labeling your code so you can find it easier later

- (void) connection:(NSURLConnection* )connection didReceiveResponse:(NSURLResponse *)response {
    
}

- (void)connection: (NSURLConnection *)connection didReceiveData:(NSData *) data {
    
    [receivedStockPriceData appendData:data];
    
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
    //Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (!self.parentTableVC.dao.companies.count == 0 )
        //company array null check - if it's null, then we don't make stupid requests which crash program
    {
        NSString *stockData = [[NSString alloc] initWithData:receivedStockPriceData encoding:NSUTF8StringEncoding];
        NSArray *stockPairs = [stockData componentsSeparatedByString:@"\n"];
        
        for (int i=0; i < stockPairs.count-1; i++) {
            NSString *line = stockPairs[i];
            NSArray *pair = [line componentsSeparatedByString:@","];
            Company *selectedCompany = self.parentTableVC.dao.companies[i];
            [selectedCompany setValue: @([pair[1] floatValue]) forKey:@"stockPrice"];
        }
        
        [self.parentTableVC.tableView reloadData];
    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}


@end
