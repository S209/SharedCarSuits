//
//  SCMineViewHeaderView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/11.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMineViewHeaderView.h"

@interface SCMineViewHeaderView()
@property (nonatomic, weak) UIImageView * userIconImg;
@property (nonatomic, weak) UILabel * userNameLabel;
@property (nonatomic, weak) UILabel * userNumberLabel;
@property (nonatomic, weak) UIImageView * editorImageView;
@property (nonatomic, weak) UIImageView * coupleImageView;
@property (nonatomic, weak) UILabel * couponLabel;
@property (nonatomic, weak) UIImageView * carImageView;
@property (nonatomic, weak) UILabel * myGarageLabel;
@end
@implementation SCMineViewHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    self.size = CGSizeMake(SCREEN_WIDTH, 226);
    UIImageView * userIconImg = [[UIImageView alloc] init];
    [self addSubview:userIconImg];
    self.userIconImg = userIconImg;
    [userIconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 70));
        make.left.equalTo(self.mas_left).with.offset(20);
        make.top.equalTo(self.mas_top).with.offset(53);
    }];
    userIconImg.layer.masksToBounds = YES;
    [userIconImg.layer setCornerRadius:70];
    
    UILabel * userNameLabel = [[UILabel alloc] init];
    [self addSubview:userNameLabel];
    [userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userIconImg.mas_right).with.offset(15);
        make.top.equalTo(userIconImg.mas_top).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-0);
    }];
    userNameLabel.font = [UIFont sy_font14];
    userNameLabel.textColor = [UIColor whiteColor];
    
    
    UILabel * userNumberLabel = [[UILabel alloc] init];
    [self addSubview:userNumberLabel];
    self.userNumberLabel = userNumberLabel;
    userNumberLabel.font = [UIFont sy_font14];
    userNumberLabel.textColor = [UIColor whiteColor];
    [userNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userIconImg.mas_right).with.offset(15);
        make.bottom.equalTo(userIconImg.mas_bottom).with.offset(-10);
        make.right.equalTo(self.mas_right).with.offset(-0);
    }];
    
    UIImageView * editorImgView = [[UIImageView alloc] init];
    [self addSubview:editorImgView];
    [editorImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.centerY.mas_equalTo(userIconImg.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(65, 25));
    }];
    editorImgView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editor)];
    [editorImgView addGestureRecognizer:tapGest];

    UIView * segmentView = [[UIView alloc] init];
    [self addSubview:segmentView];
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(1, 23));
        make.bottom.equalTo(self.mas_bottom).with.offset(-20);
    }];
    
    UIImageView * coupleImageView = [[UIImageView alloc] init];
    [self addSubview:coupleImageView];
    self.coupleImageView = coupleImageView;
    [coupleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    UIImageView * carImageView = [[UIImageView alloc] init];
    [self addSubview:carImageView];
    self.carImageView = carImageView;
    [carImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    
}

#pragma mark 编辑
- (void)editor
{
    
}

@end
