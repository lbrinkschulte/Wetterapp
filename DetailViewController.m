//
//  DetailViewController.m
//  Wetterapp
//
//  Created by iOS Schulung on 18.08.15.
//  Copyright © 2015 Brimanke AG. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property NSString *detailString;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"City Weather";
    self.detailLabel.text = self.detailString;
    self.navigationItem.title = self.detailString;
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
-(void)setDetail:(NSString *)detail{
    self.detailString = detail;
}

@end
