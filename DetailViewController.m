//
//  DetailViewController.m
//  Wetterapp
//
//  Created by iOS Schulung on 18.08.15.
//  Copyright © 2015 Brimanke AG. All rights reserved.
//

#import "DetailViewController.h"
#import "City.h"

@interface DetailViewController()
@property City *city;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windDirectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *windSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.city.name;
    self.nameLabel.text = self.city.name;
    if(self.city.humidity ) {
        //        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        //        NSLog( @"%@",[formatter stringFromNumber:@3.4212]);
        // Wir gehen davon aus, wenn das gesetzt ist, ist alles gesetzt
        self.humidityLabel.text = [NSString stringWithFormat:@"%@%%", self.city.humidity.stringValue ];
        
        self.windDirectionLabel.text = [NSString stringWithFormat:@"%@°", self.city.winddirection.stringValue ];
        self.windSpeedLabel.text = [NSString stringWithFormat:@"%@ m/s", self.city.windspeed.stringValue ];
        self.longitudeLabel.text = self.city.longitude.stringValue;
        self.latitudeLabel.text = self.city.latitude.stringValue;
        self.tempLabel.text = [NSString stringWithFormat:@"%@°C", self.city.temperature.stringValue ];
    } else {
        self.humidityLabel.text = @"??";
        self.windDirectionLabel.text = @"??";
        self.windSpeedLabel.text = @"??";
        self.longitudeLabel.text = @"??";
        self.latitudeLabel.text = @"??";
        self.windSpeedLabel.text = @"??";
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
-(void)setDetail:(City *)city {
    self.city = city;
}
@end