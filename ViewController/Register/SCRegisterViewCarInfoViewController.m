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
#import "SCChoiseCarNumberView.h"
#import "SCManager+RequestInterface.h"
@interface SCRegisterViewCarInfoViewController ()<SCRegisterViewCarInfoViewDelegate,SCChoiseAreaViewDelegate,SCChoiseCarNumberViewDelegate>
@property (nonatomic, weak) SCChoiseAreaView * areaView;
@property (nonatomic, weak) SCRegisterViewCarInfoView * carInfo;
@property (nonatomic, weak) SCChoiseCarNumberView * carNumberView;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, strong) NSMutableArray * carNumberArray;
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
    self.carNumberArray = [NSMutableArray arrayWithCapacity:6];
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
    
    SCChoiseCarNumberView * carNumberView = [[SCChoiseCarNumberView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    carNumberView.delegate = self;
    carNumberView.hidden = YES;
    self.carNumberView = carNumberView;
    [self.view addSubview:carNumberView];
    
}

#pragma mark 创建选择车牌的View
- (void)carNumberBtnClickWithIndex:(NSInteger)index
{
    if (index == 0) {
        self.areaView.hidden = NO;
        self.carNumberView.hidden = YES;
    }else{
        self.areaView.hidden = YES;
        self.carNumberView.hidden = NO;
    }
}

- (void)sureBtnClick
{
    NSMutableString * carNumberString = [[NSMutableString alloc] init];
    for (NSUInteger i = 0; i < self.carNumberArray.count; i++) {
        [carNumberString appendString:[self.carNumberArray safeObjectAtIndex:i]];
    }
    
    [[SCManager shareInstance] registeredWithPhoneNum:_phoneNumber passWord:_password carModel:self.content carNum:carNumberString success:^(NSURLSessionDataTask *serializer, id responseObject) {
        SCHomeTabBarController * homeTabBarController = [[SCHomeTabBarController alloc] init];
        [AppDelegate getAppDelegate].window.rootViewController = homeTabBarController;
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        
    }] ;
}

- (void)choiseBrandLabelClick
{
    
    
}

#pragma mark choiseAreaViewDelegate
- (void)choiseAreaViewClickCancelBtn
{
    [self.carInfo updateCarInfoWithInfo:@" " andIndex:0 btnClickState:NO];
}


- (void)ChoiseAreaViewClickSureBtn
{
    self.areaView.hidden = YES;
}

- (void)ChoiseAreaViewClickItemWithContent:(NSString *)content
{
    [self.carInfo updateCarInfoWithInfo:content andIndex:0 btnClickState:YES];
}

#pragma mark choiseCarNumberViewDelegate
- (void)choiseCarNumberViewDidCancel
{
    if (self.carNumberView.carNumberIndex >= 0) {
        [self.carInfo updateCarInfoWithInfo:@"" andIndex:self.carNumberView.carNumberIndex btnClickState:NO];
        self.carNumberView.carNumberIndex -= 1;
    }
}

- (void)choiseCarNumberViewDidSure
{
     self.carNumberView.hidden = YES;
}

- (void)choiseCarNumberViewDidItemWithContent:(NSString *)content andIndex:(NSInteger)index
{
    [self.carNumberArray insertObject:content atIndex:index-1];
    [self.carInfo updateCarInfoWithInfo:content andIndex:index btnClickState:YES];
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
