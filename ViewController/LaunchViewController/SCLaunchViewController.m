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
#import "AppDelegate.h"
#import "SCFindPasswordController.h"
#import "SCRegisterViewController.h"
#import "SCManager+RequestInterface.h"
#import "SCManager+CommonMethods.h"
@interface SCLaunchViewController ()<SCLoginViewDelegate>
@property (nonatomic , strong) SCHomeTabBarController * homeTabBarController;
@property (nonatomic, weak) SCLoginView * loginView;
@end

@implementation SCLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLoadingOrder];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavigationWithTitle:@"登录验证"];
 
}

- (void)loadLoadingOrder
{
    BOOL flag = [SCManager isLogin];
    if (flag) {
        SCHomeTabBarController * homeTabBarController = [[SCHomeTabBarController alloc] init];
        [AppDelegate getAppDelegate].window.rootViewController = homeTabBarController;
    }else{
         [self setupLoginView];
    }
}

#pragma mark 加载登录页面
- (void)setupLoginView
{
    SCLoginView * loginView = [[SCLoginView alloc] init];
    loginView.delegate = self;
    self.loginView = loginView;
    [self.view addSubview:loginView];
    [loginView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight);
    }];
}


#pragma mark loginViewWithDelegate
- (void)loginViewLoginWithAccount:(NSString *)account password:(NSString *)password
{
    
    [[SCManager shareInstance] logInWithLoginName:account passWord:password success:^(NSURLSessionDataTask *serializer, id responseObject) {
        SCHomeTabBarController * homeTabBarController = [[SCHomeTabBarController alloc] init];
        [AppDelegate getAppDelegate].window.rootViewController = homeTabBarController;
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] integerValue];
        if (code == 1001) {
            self.loginView.isHideLoginTipsImageFlag = NO;
        }else{
            self.loginView.isHideLoginTipsImageFlag = YES;
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {

    }];
}

- (void)loginViewWithRegister
{
    SCRegisterViewController * registerView = [[SCRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerView animated:YES];
}
- (void)forgetPassword
{
    SCFindPasswordController * findPassword = [[SCFindPasswordController alloc] init];
    [self.navigationController pushViewController:findPassword animated:YES];
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
