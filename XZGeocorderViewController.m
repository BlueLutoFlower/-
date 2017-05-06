//
//  XZGeocorderViewController.m
//  正向地理编码与反向地理编码
//
//  Created by BlueLutoFlower on 2017/2/5.
//  Copyright © 2017年 XZ. All rights reserved.
//

#import "XZGeocorderViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface XZGeocorderViewController ()

@property (weak, nonatomic) IBOutlet UITextField *addressTF;
@property (weak, nonatomic) IBOutlet UILabel *longitudeTF;
@property (weak, nonatomic) IBOutlet UILabel *langitudeTF;

@end

@implementation XZGeocorderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)GeocorderClick:(id)sender {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder geocodeAddressString:self.addressTF.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (placemarks.count == 0 || error) {
            NSLog(@"解析出错");
            return ;
        }
        
        for (CLPlacemark *placemark in placemarks) {
            NSLog(@"%@",placemark);
            self.langitudeTF.text = [NSString stringWithFormat:@"%f",placemark.location.coordinate.latitude];
            self.longitudeTF.text = [NSString stringWithFormat:@"%f",placemark.location.coordinate.longitude];
            
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
