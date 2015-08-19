//
//  URLReader.h
//  Wetterapp
//
//  Created by iOS Schulung on 19.08.15.
//  Copyright © 2015 Brimanke AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLReader : NSObject
+(URLReader *)urlReader;
+(NSURL *)urlForCity:(NSString *)city andCountry:(NSString *)country;
+(NSURL *)urlForID:(NSNumber *)id;
-(void) queryAsyncURL: (NSURL *)url handler: (void(^)(NSDictionary *))handler;
@end
