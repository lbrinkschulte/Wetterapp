//
//  City.m
//  Wetterapp
//
//  Created by iOS Schulung on 19.08.15.
//  Copyright © 2015 Brimanke AG. All rights reserved.
//


#import "City.h"

@implementation City
-(instancetype)initWithName:(NSString *)name {
    self = [super init];
    if( self ) {
        self.name = name;
    }
    return self;
}
+(City *)cityWithName:(NSString *)name {
    return [[City alloc] initWithName:name];
    
}

-(void)updateWithJSONDictionary:(NSDictionary *)jsonDict {
    self.temperature = [jsonDict valueForKeyPath:@"main.temp"];
    self.temperature = [NSNumber numberWithFloat:self.temperature.floatValue - 273.15f];
    self.humidity = [jsonDict valueForKeyPath:@"main.humidity"];
    self.longitude = [jsonDict valueForKeyPath:@"coord.lon"];
    self.latitude = [jsonDict valueForKeyPath:@"coord.lat"];
    self.windspeed = [jsonDict valueForKeyPath:@"wind.speed"];
    self.winddirection = [jsonDict valueForKeyPath:@"wind.deg"];
}
-(NSString *)description {
    return [NSString stringWithFormat:@"Name: %@, Temp: %@°C, Humi: %@%%, longitude:%@, latitude:%@, Wind:%@, dir:%@", self.name, self.temperature, self.humidity, self.longitude, self.latitude, self.windspeed, self.winddirection];
}
@end