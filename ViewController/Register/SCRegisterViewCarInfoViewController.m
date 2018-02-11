//
//  SCRegisterViewCarInfoViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCRegisterViewCarInfoViewController.h"
#import "SCRegisterViewCarInfoView.h"
#import "SCHomeTabBarController.h"
#import "AppDelegate.h"
#import "SCChoiseAreaView.h"
@interface SCRegisterViewCarInfoViewController ()<SCRegisterViewCarInfoViewDelegate,SCChoiseAreaViewDelegate>
@property (nonatomic, weak) SCChoiseAreaView * areaView;
@property (nonatomic, weak) SCRegisterViewCarInfoView * carInfo;
@end

@implementation SCRegisterViewCarInfoViewController
- (void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"注册"];
    [self sy_leftBarButtonItem];
    [self setupView];
}

- (void)setupView
{
    SCRegisterViewCarInfoView * carInfo = [[SCRegisterViewCarInfoView alloc] init];
    self.carInfo = carInfo;
    carInfo.delegate = self;
    [self.view addSubview:carInfo];
    [carInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
    
    SCChoiseAreaView * areaView = [[SCChoiseAreaView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    areaView.delegate = self;
    areaView.hidden = YES;
    self.areaView = areaView;
    [self.view addSubview:areaView];
    
}

#pragma mark 创建选择车牌的View
- (void)carNumberBtnClickWithIndex:(NSInteger)index
{
    if (index == 0) {
        self.areaView.hidden = NO;
    }
}

- (void)sureBtnClick
{
    SCHomeTabBarController * homeTabBarController = [[SCHomeTabBarController alloc] init];
    [AppDelegate getAppDelegate].window.rootViewController = homeTabBarController;
}

#pragma mark choiseAreaViewDelegate
- (void)choiseAreaViewClickCancelBtn
{
    self.areaView.hidden = YES;
}


- (void)ChoiseAreaViewClickSureBtn
{
    
}

- (void)ChoiseAreaViewClickItemWithContent:(NSString *)content
{
    [self.carInfo updateCarInfoWithInfo:content andIndex:0];
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
