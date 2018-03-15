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
@interface SCLaunchViewController ()<SCLoginViewDelegate,UIScrollViewDelegate>
@property (nonatomic , strong) SCHomeTabBarController * homeTabBarController;
@property (nonatomic, weak) SCLoginView * loginView;
@property (nonatomic, weak) UIView * segmentView;
@property (nonatomic, weak) UIScrollView * guideMapScrollView;
@end

@implementation SCLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupGuideMap];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)setupGuideMap{
    BOOL IsTheAppInstalledForTheFirstTime = [[[NSUserDefaults standardUserDefaults] objectForKey:SCIsTheAppInstalledForTheFirstTime] boolValue];
    if (!IsTheAppInstalledForTheFirstTime) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:SCIsTheAppInstalledForTheFirstTime];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        UIScrollView * guideMapScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self.view addSubview:guideMapScrollView];
        self.guideMapScrollView = guideMapScrollView;
        guideMapScrollView.delegate = self;
        guideMapScrollView.pagingEnabled = YES;
        NSArray * guideMapArray = @[@"guideMapOne",@"guideMapTwo",@"guideMapThree",@"guideMapFour"];
        CGFloat guideMapImageViewX = 0;
        for (NSUInteger i = 0; i < guideMapArray.count; i++) {
            guideMapImageViewX = SCREEN_WIDTH * i;
            UIImageView * guideMapImageView = [[UIImageView alloc] init];
            guideMapImageView.frame = CGRectMake(guideMapImageViewX, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [guideMapImageView setImage:[UIImage imageNamed:[guideMapArray safeObjectAtIndex:i]]];
            [guideMapScrollView addSubview:guideMapImageView];
            if (i == guideMapArray.count - 1) {
                guideMapImageView.userInteractionEnabled = YES;
                UIButton * guideMapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                [guideMapImageView addSubview:guideMapBtn];
                [guideMapBtn addTarget:self action:@selector(guideMapBtnClick) forControlEvents:UIControlEventTouchUpInside];
                CGFloat guideMapBtnX = (SCREEN_WIDTH-160)*0.5;
                guideMapBtn.frame = CGRectMake(guideMapBtnX, SCREEN_HEIGHT-93, 160, 40);
            }
        }
        guideMapScrollView.contentSize = CGSizeMake(guideMapArray.count * SCREEN_WIDTH, 0);
        guideMapScrollView.showsHorizontalScrollIndicator = NO;
    }else{
        BOOL flag = [[[NSUserDefaults standardUserDefaults] objectForKey:SCHasNeedLogin] boolValue];
        if (flag) {
            [self loadLoadingOrder];
        }else{
            SCHomeTabBarController * homeTabBarController = [[SCHomeTabBarController alloc] init];
            [AppDelegate getAppDelegate].window.rootViewController = homeTabBarController;
        }
    }
}


- (void)guideMapBtnClick{
    [self.guideMapScrollView removeFromSuperview];

    SCHomeTabBarController * homeTabBarController = [[SCHomeTabBarController alloc] init];
    [AppDelegate getAppDelegate].window.rootViewController = homeTabBarController;
}

#pragma mark
- (void)loadLoadingOrder
{
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont sy_boldFont17];
    titleLabel.textColor = [UIColor sc_colorWith444444];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    titleLabel.text = @"登录验证";
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(20);
    }];

    UIView * segmentView = [[UIView alloc] init];
    [self.view addSubview:segmentView];
    self.segmentView = segmentView;
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight);
        make.height.mas_equalTo(0.5);
    }];
    segmentView.backgroundColor = [UIColor sc_colorWithe5e5e5];
    
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
        make.top.equalTo(self.segmentView.mas_bottom).with.offset(0);
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}


#pragma mark loginViewWithDelegate
- (void)loginViewLoginWithAccount:(NSString *)account password:(NSString *)password
{
    
   
    
    [[SCManager shareInstance] logInWithLoginName:account passWord:password success:^(NSURLSessionDataTask *serializer, id responseObject) {
        SCHomeTabBarController * homeTabBarController = [[SCHomeTabBarController alloc] init];
        [AppDelegate getAppDelegate].window.rootViewController = homeTabBarController;
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
//        NSInteger code = [[responseObject objectForKey:@"code"] integerValue];
      
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

- (BOOL)prefersStatusBarHidden
{
    return YES;
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
