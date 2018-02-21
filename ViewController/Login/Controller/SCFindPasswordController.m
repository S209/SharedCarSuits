//
//  SCFindPasswordController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCFindPasswordController.h"
#import "SCRetrieveThePasswordView.h"
#import "SCFindPasswordUpatePasswordController.h"
#import "SCSharedCarSuitsClient.h"
@interface SCFindPasswordController ()<SCRetrieveThePasswordViewDelegate>

@end

@implementation SCFindPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"找回密码"];
    [self sy_leftBarButtonItem];
    [self setupView];
}

- (void)setupView
{
    SCRetrieveThePasswordView * passwordView = [[SCRetrieveThePasswordView alloc] init];
    passwordView.type = TypeRetrieveThePassword;
    [self.view addSubview:passwordView];
    [passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
    passwordView.delegate = self;
    
}


- (void)nextStep
{
    SCFindPasswordUpatePasswordController * updatePassword = [[SCFindPasswordUpatePasswordController alloc] init];
    [self.navigationController pushViewController:updatePassword animated:YES];
    
}

- (void)getVerificationCode
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
