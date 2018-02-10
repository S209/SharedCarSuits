//
//  SCRegisterViewUpatePasswordController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCRegisterViewUpatePasswordController.h"
#import "SCFindPasswordUpatePasswordView.h"
#import "SCRegisterViewCarInfoViewController.h"
@interface SCRegisterViewUpatePasswordController ()<SCFindPasswordUpatePasswordViewDelegate>

@end

@implementation SCRegisterViewUpatePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"注册"];
    [self setupView];
}

- (void)setupView
{
    SCFindPasswordUpatePasswordView * upatePasswordView = [[SCFindPasswordUpatePasswordView alloc] init];
    [self.view addSubview:upatePasswordView];
    upatePasswordView.deleate = self;
    upatePasswordView.update = UpdateTypeRegister;
    [upatePasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
}

#pragma mark 下一步
- (void)complete
{
    SCRegisterViewCarInfoViewController * carInfor = [[SCRegisterViewCarInfoViewController alloc] init];
    [self.navigationController pushViewController:carInfor animated:YES];
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
