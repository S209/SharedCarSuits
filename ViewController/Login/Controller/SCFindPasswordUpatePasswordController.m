//
//  SCFindPasswordUpatePasswordController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCFindPasswordUpatePasswordController.h"
#import "SCFindPasswordUpatePasswordView.h"
#import "SCHomeTabBarController.h"
#import "AppDelegate.h"
@interface SCFindPasswordUpatePasswordController ()<SCFindPasswordUpatePasswordViewDelegate>

@end

@implementation SCFindPasswordUpatePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"找回密码"];
    [self sy_leftBarButtonItem];
    [self setupView];
}

- (void)setupView
{
    SCFindPasswordUpatePasswordView * upatePasswordView = [[SCFindPasswordUpatePasswordView alloc] init];
    [self.view addSubview:upatePasswordView];
    upatePasswordView.deleate = self;
    [upatePasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
}

- (void)complete
{
    SCHomeTabBarController * homeTabBarController = [[SCHomeTabBarController alloc] init];
    [AppDelegate getAppDelegate].window.rootViewController = homeTabBarController;
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
