//
//  SCReservationAlertView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/24.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCReservationAlertView.h"
#import "SCManager+CommonMethods.h"
@implementation SCReservationAlertView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        UIWindow * window = [UIApplication sharedApplication].windows.lastObject;
        [window addSubview:self];
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.37];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        btn.frame = self.bounds;
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


- (void)showWithCarName:(NSString *)carName
{
    UIView * tipView = [[UIView alloc] init];
    [self addSubview:tipView];
    tipView.backgroundColor = [UIColor whiteColor];
    [tipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(194);
    }];
    
    [[SCManager shareInstance] bezierPathLeftTopAndRightTopWithView:tipView withRadius:8];
    
    
    
    UILabel * carInfoLabel = [[UILabel alloc] init];
    [tipView addSubview:carInfoLabel];
    carInfoLabel.backgroundColor = [UIColor whiteColor];
    carInfoLabel.text = @"车辆信息";
    carInfoLabel.font = [UIFont sy_boldFont16];
    carInfoLabel.textColor = [UIColor sc_colorWith444444];
    carInfoLabel.textAlignment = NSTextAlignmentCenter;
    [carInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tipView.mas_left).with.offset(0);
        make.right.equalTo(tipView.mas_right).with.offset(-0);
        make.top.equalTo(tipView.mas_top).with.offset(0);
        make.height.mas_equalTo(50);
    }];
    
    
    UIView * segmentView = [[UIView alloc] init];
    [tipView addSubview:segmentView];
    segmentView.backgroundColor = [UIColor sc_colorWihtf8f8f8];
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tipView.mas_left).with.offset(0);
        make.top.equalTo(carInfoLabel.mas_bottom).with.offset(0);
        make.right.equalTo(tipView.mas_right).with.offset(-0);
        make.height.mas_equalTo(5);
    }];
    
    UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tipView addSubview:cancelBtn];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor sc_colorWith999999] forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont sy_font16];
    [cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tipView.mas_left).with.offset(10);
        make.width.mas_equalTo(44);
        make.top.equalTo(tipView.mas_top).with.offset(0);
        make.height.mas_equalTo(50);
    }];
   
    UIButton * sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tipView addSubview:sureBtn];
    [sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor sc_colorWith6C6DFD] forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont sy_boldFont16];
    [sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(tipView.mas_right).with.offset(-10);
        make.width.mas_equalTo(44);
        make.top.equalTo(tipView.mas_top).with.offset(0);
        make.height.mas_equalTo(50);
    }];
    
    
    UIView * segmentTwoView = [[UIView alloc] init];
    [tipView addSubview:segmentTwoView];
    [segmentTwoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tipView.mas_left).with.offset(0);
        make.right.equalTo(tipView.mas_right).with.offset(-0);
        make.top.equalTo(segmentView.mas_bottom).with.offset(50);
        make.height.mas_equalTo(0.5);
    }];
    segmentTwoView.backgroundColor = [UIColor sc_colorWithe5e5e5];
    
    UILabel * carNumberLabel = [[UILabel alloc] init];
    [tipView addSubview:carNumberLabel];
    carNumberLabel.text = carName;
    carNumberLabel.textColor = [UIColor sc_colorWith444444];
    carNumberLabel.font = [UIFont sy_font16];
    carNumberLabel.textAlignment = NSTextAlignmentCenter;
    [carNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tipView.mas_left).with.offset(0);
        make.right.equalTo(tipView.mas_right).with.offset(-0);
        make.height.mas_equalTo(50);
        make.top.equalTo(segmentTwoView.mas_bottom).with.offset(0);
    }];
    
    UIView * segmentThreeView = [[UIView alloc] init];
    [tipView addSubview:segmentThreeView];
    [segmentThreeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tipView.mas_left).with.offset(0);
        make.right.equalTo(tipView.mas_right).with.offset(-0);
        make.top.equalTo(carNumberLabel.mas_bottom).with.offset(0);
        make.height.mas_equalTo(0.5);
    }];
    segmentThreeView.backgroundColor = [UIColor sc_colorWithe5e5e5];
    
}

- (void)diss
{
    [self removeFromSuperview];
}

- (void)btnClick
{
    [self diss];
}


- (void)sureBtnClick:(UIButton *)sender
{
    
}

- (void)cancelBtnClick:(UIButton *)sender
{
    
}
@end
