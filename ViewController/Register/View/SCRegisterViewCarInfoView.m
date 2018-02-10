//
//  SCRegisterViewCarInfoView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCRegisterViewCarInfoView.h"

@implementation SCRegisterViewCarInfoView

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
    UILabel * brand = [[UILabel alloc] init];
    [self addSubview:brand];
    brand.text = @"品牌";
    brand.font = [UIFont sy_font16];
    brand.textColor = [UIColor sc_colorWith282828];
    [brand mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(self.mas_top).with.offset(50);
        make.right.equalTo(self.mas_right).with.offset(-15);
    }];
    
    UILabel * choiseBrandLabel = [[UILabel alloc] init];
    [self addSubview:choiseBrandLabel];
    choiseBrandLabel.text = @" 请选择品牌";
    choiseBrandLabel.font = [UIFont sy_font16];
    choiseBrandLabel.textColor = [UIColor sc_colorWith282828];
    [choiseBrandLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(brand.mas_bottom).with.offset(16);
        make.right.equalTo(self.mas_right).with.offset(-15);
    }];
    choiseBrandLabel.backgroundColor = [UIColor sc_colorWithF8F8F8];
    
    
    UILabel * carNumberLabel = [[UILabel alloc] init];
    [self addSubview:carNumberLabel];
    carNumberLabel.text = @"车牌号";
    carNumberLabel.font = [UIFont sy_font16];
    carNumberLabel.textColor = [UIColor sc_colorWith282828];
    [carNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(choiseBrandLabel.mas_bottom).with.offset(20);
        make.right.equalTo(self.mas_right).with.offset(-0);
    }];
    
    NSInteger spaceing = 10;
    CGFloat spaceX = 0;
    CGFloat size = (SCREEN_WIDTH-30-6*spaceing)/6.0;
    for (NSUInteger i = 0; i < 7; i++) {
        UIButton * carNumberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:carNumberBtn];
        spaceX = 15 + (size + spaceing)*i;
        [carNumberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(spaceX);
            make.top.equalTo(carNumberLabel.mas_bottom).with.offset(20);
            make.size.mas_equalTo(CGSizeMake(size, size));
        }];
        [carNumberBtn addTarget:self action:@selector(carNumberBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        carNumberBtn.layer.masksToBounds = YES;
        [carNumberBtn.layer setCornerRadius:4.0];
        carNumberBtn.tag = 300+i;
        carNumberBtn.backgroundColor = [UIColor sc_colorWithF8F8F8];
    }
    
    UIButton * sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:sureBtn];
    sureBtn.backgroundColor = [UIColor sc_colorWith6C6DFD];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.top.equalTo(carNumberLabel.mas_bottom).with.offset(135);
        make.height.mas_equalTo(40);
    }];
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont sy_boldFont16];
}


- (void)carNumberBtnClick:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    if (tag == 300) {
        [sender.layer setBorderColor: [[UIColor sc_colorWith6C6DFD]CGColor]];
    }
    if ([_delegate respondsToSelector:@selector(carNumberBtnClickWithIndex:)]) {
        [self.delegate carNumberBtnClickWithIndex:tag];
    }
}

- (void)sureBtnClick
{
    if ([_delegate respondsToSelector:@selector(sureBtnClick)]) {
        [self.delegate sureBtnClick];
    }
}

@end
