//
//  SCLaunchViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCLaunchViewController.h"
#import "SCHomeTabBarController.h"
#import "SCLoginView.h"
#import <Masonry.h>
@interface SCLaunchViewController ()<SCLoginViewDelegate>
@property (nonatomic , strong) SCHomeTabBarController * homeTabBarController;
@end

@implementation SCLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)setNavigation
{
    self.navigationItem.title = @"登录验证";
}

#pragma mark 加载登录页面
- (void)setupLoginView
{
    SCLoginView * loginView = [[SCLoginView alloc] init];
    loginView.delegate = self;
    [self.view addSubview:loginView];
    [loginView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(NAVIGATIONBAR_HEIGHT);
    }];
}


#pragma mark loginViewWithDelegate
- (void)loginViewLoginWithAccount:(NSString *)account password:(NSString *)password
{
    
}
- (void)loginViewWithRegister
{
    
}
- (void)forgetPassword
{
    
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
