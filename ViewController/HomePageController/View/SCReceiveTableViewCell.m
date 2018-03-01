//
//  SCReceiveTableViewCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/28.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCReceiveTableViewCell.h"
#import "SCCouponModel.h"
@interface SCReceiveTableViewCell()
@property (nonatomic, weak) UIImageView * bottomImageView;
@property (nonatomic, weak) UILabel * couponNameLabel;
@property (nonatomic, weak) UILabel * couponTimeLabel;
@property (nonatomic, weak) UILabel * couponTipsLabel;
@property (nonatomic, weak) UILabel * priceLabel;
@property (nonatomic, weak) UIView * segmentView;
@property (nonatomic, weak) UIButton * receiveBtn;
@property (nonatomic, strong) SCCouponModel * couponModel;
@end
@implementation SCReceiveTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

+ (instancetype)receiveTableViewCellWithTableView:(UITableView *)tableView andObj:(SCCouponModel *)model
{
    static NSString * idDes = @"SCMyCouponCellIDdes";
    [tableView registerClass:[SCReceiveTableViewCell class] forCellReuseIdentifier:idDes];
    SCReceiveTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.couponModel = model;
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
    self.priceLabel = priceLabel;
    
    UIView * segmentView = [[UIView alloc] init];
    [self.contentView addSubview:segmentView];
    self.segmentView = segmentView;
 
    UIButton * receiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:receiveBtn];
    self.receiveBtn = receiveBtn;
    [receiveBtn setTitle:@"我要领取" forState:UIControlStateNormal];
    [receiveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    receiveBtn.titleLabel.font = [UIFont sy_font12];
    receiveBtn.backgroundColor = [UIColor sc_colorWithF97945];
    [receiveBtn addTarget:self action:@selector(receiveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    receiveBtn.layer.masksToBounds = YES;
    [receiveBtn.layer setCornerRadius:4.0];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.bottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.top.equalTo(self.contentView.mas_top).with.offset(0);
        make.height.mas_equalTo(100);
    }];
    
    [self.couponNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomImageView.mas_left).with.offset(30);
        make.top.equalTo(self.bottomImageView.mas_top).with.offset(18);
    }];
    
    [self.couponTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.couponNameLabel.mas_left).with.offset(0);
        make.top.equalTo(self.couponNameLabel.mas_bottom).with.offset(10);
    }];
    
    [self.couponTipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.couponNameLabel.mas_left).with.offset(0);
        make.bottom.equalTo(self.bottomImageView.mas_bottom).with.offset(-5);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bottomImageView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(90, 50));
        make.right.equalTo(self.bottomImageView.mas_right).with.offset(-0);
    }];
    
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(15);
    }];
    
    [self.receiveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(65, 27));
        make.right.equalTo(self.bottomImageView.mas_right).with.offset(-16);
        make.bottom.equalTo(self.bottomImageView.mas_bottom).with.offset(-10);
    }];
    
}

+ (CGFloat)cellHeight
{
    return 115;
}

- (void)setCouponType:(SCCouponType)couponType
{
    _couponType = couponType;
    
    if (couponType == SCCouponTypeWithReceive) {
        self.segmentView.backgroundColor = [UIColor sc_colorWith6C6DFD];
    }else{
        self.segmentView.backgroundColor = [UIColor sc_colorWithF4F4F4];
    }
}

/*
 cpuponId = 171;
 createTime = "2018-02-19 20:15:58";
 description = "\U94a3\U91d1\U55b7\U6f06\U94a3\U91d1\U55b7\U6f06";
 endTime = "2018-04-29 20:00:00";
 isUsed = 0;
 name = "\U94a3\U91d1\U55b7\U6f06";
 number = 50AE676024C218DA;
 orderType = 3;
 price = 22;
 type = 1;
 */
- (void)setCouponModel:(SCCouponModel *)couponModel
{
    _couponModel = couponModel;
    self.couponNameLabel.text = couponModel.name;
    self.couponTimeLabel.text = couponModel.endTime;
    self.couponTipsLabel.text = couponModel.descriptionString;
    self.priceLabel.text = [NSString stringWithFormat:@"%zd",couponModel.price];

}

- (void)receiveBtnClick:(UIButton *)sender
{
    if ([_delegate respondsToSelector:@selector(receiveCouponWithCouponModel:)]){
        [self.delegate receiveCouponWithCouponModel:self
                       .couponModel] ;
    }
}
@end

