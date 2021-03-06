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
    goodsNameLabel.textAlignment = NSTextAlignmentLeft;
    [goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.top.equalTo(goodsImageView.mas_bottom).with.offset(13);
    }];
    goodsNameLabel.font = [UIFont sy_font14];
    goodsNameLabel.textColor = [UIColor sc_colorWith444444];
    
    UILabel * goodsPriceLabel = [[UILabel alloc] init];
    [self addSubview:goodsPriceLabel];
    self.goodsPriceLabel = goodsPriceLabel;
    goodsPriceLabel.font = [UIFont sy_font14];
    goodsPriceLabel.textColor = [UIColor sc_colorWith6C6DFD];
    [goodsPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(goodsNameLabel.mas_left).with.offset(0);
        make.top.equalTo(goodsNameLabel.mas_bottom).with.offset(14);
        make.right.equalTo(self.mas_right).with.offset(-0);
    }];
}

- (void)setGoodsImageUrl:(NSString *)goodsImageUrl
{
    _goodsImageUrl = goodsImageUrl;
//    [self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:goodsImageUrl] placeholderImage:[UIImage imageNamed:@""]];
    [self.goodsImageView setImage:[UIImage imageNamed:goodsImageUrl]];
}

- (void)setGoodsNameString:(NSString *)goodsNameString
{
    _goodsNameString = goodsNameString;
    self.goodsNameLabel.text = goodsNameString;
}

- (void)setGoodsPricString:(NSString *)goodsPricString
{
    _goodsPricString = goodsPricString;
    self.goodsPriceLabel.text = [NSString stringWithFormat:@"¥%@",goodsPricString];
}
@end
