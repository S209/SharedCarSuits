//
//  SCMineViewHeaderView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/11.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMineViewHeaderView.h"
#import "SCManager+CommonMethods.h"
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
        self.backgroundColor = [UIColor sc_colorWith6C6DFD];
    }
    return self;
}

- (void)setupView
{
    self.size = CGSizeMake(SCREEN_WIDTH, 282);
    UIImageView * userIconImg = [[UIImageView alloc] init];
    [self addSubview:userIconImg];
    self.userIconImg = userIconImg;
    [userIconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 70));
        make.left.equalTo(self.mas_left).with.offset(25);
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
    editorImgView.userInteractionEnabled = YES;
    [editorImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.centerY.mas_equalTo(userIconImg.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(65, 25));
    }];
    [editorImgView setImage:[UIImage imageNamed:@"me_bg_edit"]];
    editorImgView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editor)];
    [editorImgView addGestureRecognizer:tapGest];

    UIImageView * editorPenImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"me_ico_edit"]];
    editorPenImgView.userInteractionEnabled = YES;
    [editorImgView addSubview:editorPenImgView];
    [editorPenImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(12.5, 12.5));
        make.centerY.mas_equalTo(editorImgView.mas_centerY);
        make.left.equalTo(editorImgView.mas_left).with.offset(8);
    }];
    
    UILabel * editorLabel = [[UILabel alloc] init];
    [editorImgView addSubview:editorLabel];
    editorLabel.text = @"编辑";
    editorLabel.font = [UIFont sy_font14];
    editorLabel.textColor = [UIColor whiteColor];
    [editorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(editorImgView.mas_centerY);
        make.left.equalTo(editorPenImgView.mas_right).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(35, 15));
    }];
    [self setupBottomViewWithSupView:self];
}

- (void)setupBottomViewWithSupView:(UIView *)supView
{
    UIView * bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor sc_colorWith6162e3];
    bottomView.size = CGSizeMake(SCREEN_WIDTH, 118);
    [supView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(118);
    }];
    
    UIView * segmentView = [[UIView alloc] init];
    [bottomView addSubview:segmentView];
    segmentView.backgroundColor = [UIColor cdf_colorWithHexString:@"FFFFFF" alpha:0.37];
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(1, 23));
        make.top.equalTo(bottomView.mas_top).with.offset(20);
    }];
    
    

    //我的优惠券
    UILabel * couponLabel = [[UILabel alloc] init];
    [bottomView addSubview:couponLabel];
    couponLabel.font = [UIFont sy_font16];
    couponLabel.textColor = [UIColor whiteColor];
    couponLabel.text = @"我的优惠券";
    couponLabel.textAlignment = NSTextAlignmentLeft;
    [couponLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(segmentView.mas_left).with.offset(-0);
        make.left.equalTo(bottomView.mas_left).with.offset(67.5);
        make.top.equalTo(bottomView.mas_top).with.offset(20);
    }];

    UIImageView * myCouponImgView = [[UIImageView alloc] init];
    [bottomView addSubview:myCouponImgView];
    [myCouponImgView setImage:[UIImage imageNamed:@"me_myfunction_ico_mycoupon"]];
    [myCouponImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(couponLabel.mas_left).with.offset(-6);
        make.top.equalTo(bottomView.mas_top).with.offset(22);
        make.size.mas_equalTo(CGSizeMake(20.5, 17.5));
    }];


    //我的车库
    UILabel * myCarLabel = [[UILabel alloc] init];
    [bottomView addSubview:myCarLabel];
    myCarLabel.font = [UIFont sy_font16];
    myCarLabel.textColor = [UIColor whiteColor];
    myCarLabel.text = @"我的车库";
    myCarLabel.textAlignment = NSTextAlignmentLeft;
    [myCarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(segmentView.mas_right).with.offset(75);
        make.right.equalTo(bottomView.mas_right).with.offset(-0);
        make.top.equalTo(bottomView.mas_top).with.offset(20);
    }];
    
    UIButton * myCarBtn = [[UIButton alloc] init];
    [bottomView addSubview:myCarBtn];
    [myCarBtn addTarget:self action:@selector(myCarBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [myCarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(segmentView.mas_right).with.offset(75);
        make.right.equalTo(bottomView.mas_right).with.offset(-0);
        make.top.equalTo(bottomView.mas_top).with.offset(20);
    }];
    

    UIImageView * myCarImgView = [[UIImageView alloc] init];
    [bottomView addSubview:myCarImgView];
    [myCarImgView setImage:[UIImage imageNamed:@"me_myfunction_ico_mycar"]];
    [myCarImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(myCarLabel.mas_left).with.offset(-6);
        make.top.equalTo(bottomView.mas_top).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(20.5, 17.5));
    }];
    
    UIView * myContentView = [[UIView alloc] init];
    [bottomView addSubview:myContentView];
    myContentView.backgroundColor = [UIColor whiteColor];
    [myContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomView.mas_left).with.offset(0);
        make.right.equalTo(bottomView.mas_right).with.offset(-0);
        make.bottom.equalTo(bottomView.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(55);
    }];
    
    [[SCManager shareInstance] bezierPathLeftTopAndRightTopWithView:myContentView withRadius:15];
    
    
    UILabel * myContentLabel = [[UILabel alloc] init];
    [myContentView addSubview:myContentLabel];
    myContentLabel.text = @"我的内容";
    myContentLabel.font = [UIFont sy_font17];
    myContentLabel.textColor = [UIColor sc_colorWith444444];
    [myContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(myContentView.mas_left).with.offset(15);
        make.bottom.equalTo(myContentView.mas_bottom).with.offset(-15);
        make.right.equalTo(myContentView.mas_right).with.offset(-0);
    }];
   
}

#pragma mark 编辑
- (void)editor
{
    if ([_delegate respondsToSelector:@selector(mineViewHeaderViewClickEditor)]) {
        [self.delegate mineViewHeaderViewClickEditor];
    }
}

- (void)myCarBtnClick
{
    if ([_delegate respondsToSelector:@selector(mineViewHeaderMyGarage)]) {
        [self.delegate mineViewHeaderMyGarage];
    }
}

@end
