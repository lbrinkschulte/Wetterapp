//
//  CityDataBase.h
//  Wetterapp
//
//  Created by iOS Schulung on 19.08.15.
//  Copyright © 2015 Brimanke AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityDatabase : NSObject
+(CityDatabase *)sharedInstance;
@property (readonly) NSArray *cities;
-(void)save;
-(void)load;
@end
