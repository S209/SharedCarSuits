//
//  SCMyCouponCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/28.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMyCouponCell.h"
#import "SCCouponModel.h"
@interface SCMyCouponCell()
@property (nonatomic, weak) UIImageView * bottomImageView;
@property (nonatomic, weak) UILabel * couponNameLabel;
@property (nonatomic, weak) UILabel * couponTimeLabel;
@property (nonatomic, weak) UILabel * couponTipsLabel;
@property (nonatomic, weak) UILabel * priceLabel;
@property (nonatomic, weak) UIView * segmentView;
@property (nonatomic, weak) UILabel * moneyUnitLabel;
@property (nonatomic, strong) SCCouponModel * couponModel;
@end
@implementation SCMyCouponCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)myCouponCellWithTableView:(UITableView *)tableView andObj:(SCCouponModel *)model
{
    static NSString * idDes = @"SCMyCouponCellIDdes";
    [tableView registerClass:[SCMyCouponCell class] forCellReuseIdentifier:idDes];
    SCMyCouponCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.couponModel = model;
    cell.backgroundColor = [UIColor sc_colorWihtf8f8f8];
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    UIImageView * bottomImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:bottomImageView];
    self.bottomImageView = bottomImageView;
    [bottomImageView setImage:[UIImage imageNamed:@"coupn_bg"]];
    bottomImageView.clipsToBounds = YES;
    bottomImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    UILabel * couponNameLabel = [[UILabel alloc] init];
    [bottomImageView addSubview:couponNameLabel];
    self.couponNameLabel = couponNameLabel;
    couponNameLabel.textColor = [UIColor sc_colorWith444444];
    couponNameLabel.font = [UIFont sy_boldFont16];
   
    UILabel * couponTimeLabel = [[UILabel alloc] init];
    [bottomImageView addSubview:couponTimeLabel];
    self.couponTimeLabel = couponTimeLabel;
    couponTimeLabel.font = [UIFont sy_font12];
    couponTimeLabel.textColor = [UIColor sc_colorWith666666];
    
    UILabel * couponTipsLabel = [[UILabel alloc] init];
    [bottomImageView addSubview:couponTipsLabel];
    self.couponTipsLabel = couponTipsLabel;
    couponTipsLabel.font = [UIFont sy_font12];
    couponTipsLabel.textColor = [UIColor sc_colorWithF64C38];
  
    
    UILabel * priceLabel = [[UILabel alloc] init];
    [bottomImageView addSubview:priceLabel];
    priceLabel.textAlignment = NSTextAlignmentCenter;
    self.priceLabel = priceLabel;
    
    UILabel * moneyUnitLabel = [[UILabel alloc] init];
    [bottomImageView addSubview:moneyUnitLabel];
    self.moneyUnitLabel = moneyUnitLabel;
    moneyUnitLabel.text = @"¥";
    moneyUnitLabel.textColor = [UIColor sc_colorWith6C6DFD];
    moneyUnitLabel.font = [UIFont sy_font16];
    
    UIView * segmentView = [[UIView alloc] init];
    [self.contentView addSubview:segmentView];
    self.segmentView = segmentView;
    segmentView.backgroundColor = [UIColor sc_colorWihtf8f8f8];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.bottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.top.equalTo(self.contentView.mas_top).with.offset(0);
        make.height.mas_equalTo(100);
    }];

    [self.couponNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomImageView.mas_left).with.offset(30);
        make.top.equalTo(self.bottomImageView.mas_top).with.offset(18);
    }];

    [self.couponTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.couponNameLabel.mas_left).with.offset(0);
        make.top.equalTo(self.couponNameLabel.mas_bottom).with.offset(6);
    }];

    [self.couponTipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.couponNameLabel.mas_left).with.offset(0);
        make.bottom.equalTo(self.bottomImageView.mas_bottom).with.offset(-15);
    }];
    
    [self.moneyUnitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.priceLabel.mas_left).with.offset(-0);
        make.top.equalTo(self.priceLabel.mas_top).with.offset(0);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bottomImageView.mas_centerY);
        make.right.equalTo(self.bottomImageView.mas_right).with.offset(-25);
        make.height.mas_equalTo(30);
    }];

    [self.moneyUnitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.priceLabel.mas_left).with.offset(-0);
        make.top.equalTo(self.priceLabel.mas_top).with.offset(0);
    }];

    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(15);
    }];
}

+ (CGFloat)cellHeight
{
    return 115;
}
- (void)setCouponModel:(SCCouponModel *)couponModel
{
    _couponModel = couponModel;
    self.couponNameLabel.text = couponModel.name;
    self.couponTimeLabel.text = [NSString stringWithFormat:@"有效期至 %@",couponModel.endTime];
    self.couponTipsLabel.text = [NSString stringWithFormat:@"限：%@",couponModel.descriptionString];
    
    NSString * priceString = [NSString stringWithFormat:@"%zd",couponModel.price];
    NSMutableAttributedString * priceAttributedString = [[NSMutableAttributedString alloc] initWithString:priceString];
    [priceAttributedString addAttribute:NSFontAttributeName value:[UIFont pingfangFontOfSize:40] range:NSMakeRange(0, priceString.length)];
    [priceAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor sc_colorWith6C6DFD] range:NSMakeRange(0, priceString.length)];
    self.priceLabel.attributedText = priceAttributedString;
}

@end
