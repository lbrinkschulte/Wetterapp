//
//  URLReader.m
//  Wetterapp
//
//  Created by iOS Schulung on 19.08.15.
//  Copyright © 2015 Brimanke AG. All rights reserved.
//

#import "URLReader.h"
@interface URLReader() {
    BOOL dirty;
}
@end

@implementation URLReader
+(URLReader *)urlReader {
    return [[URLReader alloc] init];
}
+(NSURL *)urlForCity:(NSString *)city andCountry:(NSString *)country {
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@,%@", city, country]];
}

+(NSURL *)urlForID:(NSNumber *)id {
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?id=%ld", id.integerValue]];
}

-(void) queryAsyncURL: (NSURL *)url handler: (void(^)(NSDictionary *))handler {
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    void(^completionHandler)(NSData *data, NSURLResponse *response, NSError *error) = ^(NSData *data, NSURLResponse *response, NSError *error) {
        if( error ) {
            NSLog( @"Error %@", error);
        }
        if( data ) {
            NSError *jsonError;
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            handler( jsonDict );
        }
    };
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:completionHandler];
    [task resume];
}

@end