//
//  XZUnGeocorderViewController.m
//  正向地理编码与反向地理编码
//
//  Created by BlueLutoFlower on 2017/2/5.
//  Copyright © 2017年 XZ. All rights reserved.
//

#import "XZUnGeocorderViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface XZUnGeocorderViewController ()
@property (weak, nonatomic) IBOutlet UITextField *longitudeTF;
@property (weak, nonatomic) IBOutlet UITextField *langitudeTF;
@property (weak, nonatomic) IBOutlet UILabel *cityTF;

@end

@implementation XZUnGeocorderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)reverseGeocorderClick:(id)sender {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:[self.langitudeTF.text doubleValue] longitude:[self.longitudeTF.text doubleValue]];
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (placemarks.count == 0 || error) {
            NSLog(@"解析出错");
            return ;
        }
        
        for (CLPlacemark *placemark in placemarks) {
            NSLog(@"%@",placemark);
            self.cityTF.text = placemark.locality;
        }
    }];
    
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

@end
