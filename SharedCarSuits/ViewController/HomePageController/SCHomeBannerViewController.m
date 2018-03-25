//
//  SCHomeBannerViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/14.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCHomeBannerViewController.h"
#import "SCHomeBannerModel.h"
@interface SCHomeBannerViewController ()

@end

@implementation SCHomeBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sy_leftBarButtonItem];
    [self setupView];
}

- (void)setupView
{
 [self.wkWbView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_bannerModel.src]]];
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