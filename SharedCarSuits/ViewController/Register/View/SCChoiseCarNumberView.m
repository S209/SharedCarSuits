//
//  SCChoiseCarNumberView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/11.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCChoiseCarNumberView.h"
#import "SCManager+CommonMethods.h"
@implementation SCChoiseCarNumberView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.37];
        [self setupAreaView];
    }
    return self;
}


- (void)btnClick:(UIButton *)sender
{
    self.hidden = YES;
}

- (void)setupAreaView
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.top.equalTo(self.mas_top).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);
    }];
    
    UIView * topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 50));
        make.bottom.equalTo(self.mas_bottom).with.offset(-223);
    }];
    
    UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [topView addSubview:cancelBtn];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor sc_colorWith999999] forState:UIControlStateNormal];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView.mas_left).with.offset(0);
        make.top.equalTo(topView.mas_top).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 50));
    }];
    
    
    UIButton * sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [topView addSubview:sureBtn];
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor sc_colorWith6C6DFD] forState:UIControlStateNormal];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(topView.mas_right).with.offset(-0);
        make.top.equalTo(topView.mas_top).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 50));
    }];
    
    UILabel * choiseInfoLabel = [[UILabel alloc] init];
    [topView addSubview:choiseInfoLabel];
    choiseInfoLabel.textAlignment = NSTextAlignmentCenter;
    choiseInfoLabel.text = @"选择信息";
    choiseInfoLabel.font = [UIFont sy_boldFont16];
    choiseInfoLabel.textColor = [UIColor sc_colorWith444444];
    [choiseInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView.mas_left).with.offset(0);
        make.right.equalTo(topView.mas_right).with.offset(-0);
        make.bottom.equalTo(topView.mas_bottom).with.offset(-0);
        make.top.equalTo(topView.mas_top).with.offset(0);
    }];
    
    
    [cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [[SCManager shareInstance] bezierPathLeftTopAndRightTopWithView:topView];
    UIView * segmentView = [[UIView alloc] init];
    [self addSubview:segmentView];
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.top.equalTo(topView.mas_bottom).with.offset(0);
        make.height.mas_equalTo(5);
    }];
    segmentView.backgroundColor = [UIColor sc_colorWithf8f8f8];
    
    UIView * bottomView = [[UIView alloc] init];
    [self addSubview:bottomView];
    bottomView.backgroundColor = [UIColor whiteColor];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.top.equalTo(segmentView.mas_bottom).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);
    }];
    
    NSArray * areaArray = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    CGFloat areaX = 0.0;
    CGFloat areaY = 0.0;
    CGFloat ColumnSpace = 6.5;
    CGFloat RowSpace = 10;
    CGFloat areaWidth = (SCREEN_WIDTH - 30 - ColumnSpace*9)/10;
    CGFloat areaHeight = (218 - 30 - RowSpace*3)/4;
    NSInteger wrapRow = 0;
    NSInteger wrapColumn = 0;
    for (NSUInteger i = 0; i < areaArray.count; i++) {
        wrapRow = i%10;
        wrapColumn = i/10;
        areaX = 15 + (areaWidth+ColumnSpace)*wrapRow;
        areaY = 15 + (areaHeight+RowSpace)*wrapColumn;
        
        UIButton * areaBtn = [[UIButton alloc] init];
        [bottomView addSubview:areaBtn];
        areaBtn.backgroundColor = [UIColor sc_colorWithf8f8f8];
        [areaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bottomView.mas_left).with.offset(areaX);
            make.top.equalTo(bottomView.mas_top).with.offset(areaY);
            make.size.mas_equalTo(CGSizeMake(areaWidth, areaHeight));
        }];
        [areaBtn setTitle:[areaArray safeObjectAtIndex:i] forState:UIControlStateNormal];
        areaBtn.titleLabel.font = [UIFont sy_font16];
        [areaBtn setTitleColor:[UIColor sc_colorWith666666] forState:UIControlStateNormal];
        areaBtn.layer.masksToBounds = YES;
        [areaBtn.layer setCornerRadius:8];
        [areaBtn addTarget:self action:@selector(areaBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        areaBtn.tag = 300+i;
    }
    
}


- (void)cancelBtnClick
{
    if ([_delegate respondsToSelector:@selector(choiseCarNumberViewDidCancel)]) {
        [self.delegate choiseCarNumberViewDidCancel];
    }
}
- (void)sureBtnClick
{
    
    if ([_delegate respondsToSelector:@selector(choiseCarNumberViewDidSure)]) {
        [self.delegate choiseCarNumberViewDidSure];
    }
}

- (void)areaBtnClick:(UIButton *)sender
{
    NSString * content = sender.titleLabel.text;
    if (self.carNumberIndex <= 6) {
        self.carNumberIndex++;
        if ([_delegate respondsToSelector:@selector(choiseCarNumberViewDidItemWithContent: andIndex:)]) {
            [self.delegate choiseCarNumberViewDidItemWithContent:content andIndex:self.carNumberIndex];
        }
    }
}
@end
