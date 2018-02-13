//
//  SCHomePageSectionTwoCellItemView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCHomePageSectionTwoCellItemView.h"

@interface SCHomePageSectionTwoCellItemView()
@property (nonatomic, weak) UIImageView * goodsImageView;
@property (nonatomic, weak) UILabel * goodsNameLabel;
@property (nonatomic, weak) UILabel * goodsPriceLabel;
@end
@implementation SCHomePageSectionTwoCellItemView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    CGFloat goodsImgWidth = (SCREEN_WIDTH - 30)/2;
    self.size = CGSizeMake(goodsImgWidth, ((SCREEN_WIDTH - 30)/2)*1.4);
    UIImageView * goodsImageView = [[UIImageView alloc] init];
    [self addSubview:goodsImageView];
    [goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(goodsImgWidth, goodsImgWidth));
        make.left.equalTo(self.mas_left).with.offset(0);
        make.top.equalTo(self.mas_top).with.offset(0);
    }];
    self.goodsImageView = goodsImageView;
    
    UILabel * goodsNameLabel = [[UILabel alloc] init];
    [self addSubview:goodsNameLabel];
    self.goodsNameLabel = goodsNameLabel;
    [goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.top.equalTo(goodsImageView.mas_bottom).with.offset(13);
    }];
    goodsNameLabel.font = [UIFont sy_font14];
    goodsNameLabel.textColor = [UIColor sc_colorWith444444];
    goodsNameLabel.textAlignment = NSTextAlignmentCenter;
    goodsNameLabel.text = @"奥迪17款新A4L脚垫新";
    
    UILabel * goodsPriceLabel = [[UILabel alloc] init];
    [self addSubview:goodsPriceLabel];
    goodsPriceLabel.text = @"¥138.0";
    self.goodsPriceLabel = goodsPriceLabel;
    goodsPriceLabel.font = [UIFont sy_font14];
    goodsPriceLabel.textColor = [UIColor sc_colorWith6C6DFD];
    [goodsPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(goodsNameLabel.mas_left).with.offset(0);
        make.top.equalTo(goodsPriceLabel.mas_bottom).with.offset(14);
    }];
}
@end
