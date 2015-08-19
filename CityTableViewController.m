//
//  CityTableViewController.m
//  Wetterapp
//
//  Created by iOS Schulung on 18.08.15.
//  Copyright © 2015 Brimanke AG. All rights reserved.
//  + Arkadij


#import "CitiesTableViewController.h"

#import "CityDetailViewController.h"
#import "URLReader.h"
#import "CityDatabase.h"
#import "City.h"

@interface CitiesTableViewController () {
    NSArray *cityArray;
}
@end

@implementation CitiesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString( @"Cities", @"Cities" );
    [self initializeCities];
    [self sendQueries];
}
-(void)initializeCities {
    cityArray = [CityDatabase sharedInstance].cities;
}
- (IBAction)refresh:(id)sender {
    [self sendQueries];
}
-(void)sendQueries {
    URLReader *reader = [URLReader urlReader];
    for( City *city in cityArray ) {
        __block City *queryCity = city;
        // Hier werden die Wetterdaten für eine Stadt geladen
        NSURL *url = [URLReader urlForCity:city.name andCountry:@"DE"];
        
        void (^handler)(NSDictionary *) = ^(NSDictionary *dict ) {
            [queryCity updateWithJSONDictionary:dict];
            
            [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
        };
        
        // Async request wird durchgeführt
        [reader queryAsyncURL:url handler:handler];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView : (UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cityArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cityCell" forIndexPath:indexPath];
    
    City *city = cityArray[indexPath.row];
    cell.textLabel.text = city.name;
    if( city.temperature ) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%f°C", city.temperature.floatValue];
    } else {
        cell.detailTextLabel.text = @"?? °C";
    }
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [segue.identifier isEqualToString:@"showCityWeather"] ) {
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        [segue.destinationViewController setDetail:cityArray[path.row]];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end

