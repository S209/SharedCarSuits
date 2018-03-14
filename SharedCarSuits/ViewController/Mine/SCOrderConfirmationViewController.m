//
//  SCOrderConfirmationViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/4.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCOrderConfirmationViewController.h"

@interface SCOrderConfirmationViewController ()

@end

@implementation SCOrderConfirmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sy_leftBarButtonItem];
    [self setNavigationWithTitle:@"订单确认"];
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
