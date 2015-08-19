//
//  City.h
//  Wetterapp
//
//  Created by iOS Schulung on 19.08.15.
//  Copyright © 2015 Brimanke AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject
-(instancetype)initWithName:(NSString *)name;
+(City *)cityWithName:(NSString *)name;

@property (nonatomic) NSString *name;
@property (nonatomic) NSNumber *longitude;
@property (nonatomic) NSNumber *latitude;
@property (nonatomic) NSNumber *humidity;
@property (nonatomic) NSNumber *windspeed;
@property (nonatomic) NSNumber *winddirection;
@property (nonatomic) NSNumber *temperature;

-(void)updateWithJSONDictionary:(NSDictionary *)jsonDict;
@end

Status API Training Shop Blog About Pricing

