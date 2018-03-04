//
//  SCReservationViewCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/17.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCReservationViewCell.h"
#import "SCShopListModel.h"
#import "SCStartView.h"
@interface SCReservationViewCell()
@property (nonatomic, weak) UIImageView * storeImageView;
@property (nonatomic, weak) UILabel * storeNameLabel;
@property (nonatomic, weak) SCStartView * startView;
@property (nonatomic, weak) UILabel * addressLabel;
@property (nonatomic, weak) UIButton * serviceItemsBtn;//服务项目
@property (nonatomic, weak) UIView * segmentView;
@property (nonatomic, weak) UIButton * checkStoreInfoBtn;
@property (nonatomic, weak) UIView * segmentSecondView;
@property (nonatomic, weak) UIButton * callBtn;//拨打电话
@property (nonatomic, weak) UIView * segmentThirdView;
@property (nonatomic, weak) UIImageView * navigationImageView;
@property (nonatomic, weak) UIImageView * whetherToConfirmImageView;
@property (nonatomic, weak) UILabel * distanceLabel;
@property (nonatomic, weak) UIView * bottomViewSegment;
@end
@implementation SCReservationViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)reservationViewCellWithTableView:(UITableView *)tableView
{
    static NSString * iDdes = @"reservationViewCell";
    [tableView registerClass:[SCReservationViewCell class] forCellReuseIdentifier:iDdes];
    SCReservationViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iDdes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView * storeImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:storeImageView];
        self.storeImageView = storeImageView;
        storeImageView.clipsToBounds = YES;
        storeImageView.contentMode = UIViewContentModeScaleAspectFill;
     
        
        UILabel * storeNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:storeNameLabel];
        self.storeNameLabel = storeNameLabel;
        storeNameLabel.font = [UIFont sy_boldFont16];
        storeNameLabel.textColor = [UIColor sc_colorWith444444];
    
        UILabel * addressLabel = [[UILabel alloc] init];
        [self.contentView addSubview:addressLabel];
        self.addressLabel = addressLabel;
        addressLabel.font = [UIFont sy_font12];
        addressLabel.numberOfLines = 2;

        SCStartView * startView = [[SCStartView alloc] initWithFrame:CGRectMake(187, 44, 80, 25)];
        [self.contentView addSubview:startView];
        self.startView = startView;

        UIImageView * whetherToConfirmImageView = [[UIImageView alloc] init];
        self.whetherToConfirmImageView = whetherToConfirmImageView;
        [self.contentView addSubview:whetherToConfirmImageView];
        
        
        UILabel * distanceLabel = [[UILabel alloc] init];
        self.distanceLabel = distanceLabel;
        [self.contentView addSubview:distanceLabel];
        distanceLabel.font = [UIFont sy_font12];
        distanceLabel.textColor = [UIColor sc_colorWith999999];
        distanceLabel.textAlignment = NSTextAlignmentRight;
        
        UIView * segmentView = [[UIView alloc] init];
        [self.contentView addSubview:segmentView];
        self.segmentView = segmentView;
        segmentView.backgroundColor = [UIColor sc_colorWithe5e5e5];
       
        UIButton * checkStoreInfoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:checkStoreInfoBtn];
        self.checkStoreInfoBtn = checkStoreInfoBtn;
        [checkStoreInfoBtn setTitle:@"查看门店信息图片" forState:UIControlStateNormal];
        checkStoreInfoBtn.layer.masksToBounds = YES;
        [checkStoreInfoBtn.layer setCornerRadius:4.0];
        [checkStoreInfoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        checkStoreInfoBtn.titleLabel.font = [UIFont sy_font12];
        checkStoreInfoBtn.backgroundColor = [UIColor sc_colorWith6C6DFD];
        [checkStoreInfoBtn addTarget:self action:@selector(checkStoreInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIView * segmentSecondView = [[UIView alloc] init];
        [self.contentView addSubview:segmentSecondView];
        self.segmentSecondView = segmentSecondView;
        segmentSecondView.backgroundColor = [UIColor sc_colorWithe5e5e5];
        
        UIButton * callBtn = [[UIButton alloc] init];
        [self.contentView addSubview:callBtn];
        self.callBtn = callBtn;
        [callBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 0)];
        [callBtn setImage:[UIImage imageNamed:@"store_list_ico_phone"] forState:UIControlStateNormal];
        [callBtn setTitleColor:[UIColor sc_colorWith444444] forState:UIControlStateNormal];
        callBtn.titleLabel.font = [UIFont sy_font14];
        [callBtn addTarget:self action:@selector(callBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView * segmentThirdView = [[UIView alloc] init];
        [self.contentView addSubview:segmentThirdView];
        self.segmentThirdView = segmentThirdView;
        segmentThirdView.backgroundColor = [UIColor sc_colorWithe5e5e5];
        
        
        UIImageView * navigationImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:navigationImageView];
        self.navigationImageView = navigationImageView;
        navigationImageView.backgroundColor = [UIColor redColor];
        navigationImageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * navigationImageTapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(navigationImageTap)];
        [navigationImageView addGestureRecognizer:navigationImageTapGest];
   
        UIView * bottomViewSegment = [[UIView alloc] init];
        [self.contentView addSubview:bottomViewSegment];
        self.bottomViewSegment = bottomViewSegment;
        bottomViewSegment.backgroundColor = [UIColor sc_colorWihtf8f8f8];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.storeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(160, 120));
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
    }];
    
    [self.whetherToConfirmImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.top.equalTo(self.storeImageView.mas_top).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(37.5, 33));
    }];
    
    [self.storeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.storeImageView.mas_right).with.offset(12);
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
        make.right.equalTo(self.whetherToConfirmImageView.mas_left).with.offset(-10);
    }];
    
    [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-16);
        make.top.equalTo(self.storeNameLabel.mas_bottom).with.offset(21);
    }];
    
    
    
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.storeImageView.mas_right).with.offset(15);
        make.top.equalTo(self.storeNameLabel.mas_bottom).with.offset(55);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
    }];
    
    NSArray * serviceItemsArray = @[@"洗车美容",@"换油保养",@"钣金喷漆"];
    NSArray * serviceItemsColorArray = @[[UIColor sc_colorWith2AB5E6],[UIColor sc_colorWith4ADA98],[UIColor sc_colorWithF6B943]];
    NSArray * serviceItemsHexStringArray = @[@"2AB5E6",@"4ADA98",@"F6B943"];
    CGFloat distanceLeft = 0;
    NSInteger tag;
    for (NSUInteger i = 0; i < serviceItemsArray.count; i++) {
        tag = 300+i;
        UIButton * btn = (UIButton *)[self.contentView viewWithTag:tag];
        [btn removeFromSuperview];
    }
    
    for (NSUInteger i = 0; i < serviceItemsArray.count; i++) {
        UIButton * serviceItemsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:serviceItemsBtn];
        serviceItemsBtn.tag = 300+i;
        [serviceItemsBtn setTitle:[NSString stringWithFormat:@"%@",[serviceItemsArray safeObjectAtIndex:i]] forState:UIControlStateNormal];
        serviceItemsBtn.layer.masksToBounds = YES;
        [serviceItemsBtn.layer setCornerRadius:4.0];
        [serviceItemsBtn setTitleColor:[serviceItemsColorArray safeObjectAtIndex:i] forState:UIControlStateNormal];
        [serviceItemsBtn addTarget:self action:@selector(serviceItemsBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        serviceItemsBtn.backgroundColor = [UIColor cdf_colorWithHexString:[serviceItemsHexStringArray safeObjectAtIndex:i] alpha:0.23];
        distanceLeft = 15 + (10 + 80)*i;
        [serviceItemsBtn.layer setBorderColor:[[UIColor cdf_colorWithHexString:[serviceItemsHexStringArray safeObjectAtIndex:i] alpha:0.23]CGColor]];
        [serviceItemsBtn.layer setBorderWidth:1.0];
        serviceItemsBtn.titleLabel.font = [UIFont sy_font13];
        [serviceItemsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(distanceLeft);
            make.top.equalTo(self.storeImageView.mas_bottom).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(80, 25));
        }];
    }
    
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.top.equalTo(self.storeImageView.mas_bottom).with.offset(45);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.bottomViewSegment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(10);
    }];
    
    [self.segmentSecondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.checkStoreInfoBtn.mas_right).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(0.5, 30));
        make.centerY.mas_equalTo(self.checkStoreInfoBtn.mas_centerY);
    }];


    [self.navigationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.top.equalTo(self.segmentView.mas_bottom).with.offset(0);
        make.bottom.equalTo(self.bottomViewSegment.mas_top).with.offset(-0);
        make.width.mas_equalTo(65);
    }];

    [self.segmentThirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.navigationImageView.mas_left).with.offset(-0);
        make.size.mas_equalTo(CGSizeMake(0.5, 30));
        make.centerY.mas_equalTo(self.checkStoreInfoBtn.mas_centerY);
    }];
    
    [self.callBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.segmentSecondView.mas_right).with.offset(10);
        make.right.equalTo(self.navigationImageView.mas_left).with.offset(-0);
        make.bottom.equalTo(self.bottomViewSegment.mas_top).with.offset(-0);
         make.top.equalTo(self.segmentView.mas_bottom).with.offset(0);
    }];
    
    [self.checkStoreInfoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.centerY.equalTo(self.callBtn.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(105, 25));
    }];
}

- (void)setShopModel:(SCShopListModel *)shopModel
{
    _shopModel = shopModel;
    
    [self.storeImageView sd_setImageWithURL:[NSURL URLWithString:shopModel.logoUrl] placeholderImage:nil];
    self.storeNameLabel.text = shopModel.name;

    self.addressLabel.text = shopModel.descriptionString;
    
    [self.callBtn setTitle:shopModel.phone forState:UIControlStateNormal];
    
    self.distanceLabel.text = shopModel.distance;
    
    if (shopModel.ifDefault) {
        [self.whetherToConfirmImageView setImage:[UIImage imageNamed:@"store_list_selected"]];
    }else{
        [self.whetherToConfirmImageView setImage:[UIImage imageNamed:@"store_list_normal"]];
    }

    self.startView.numberOfScore = shopModel.assess;
    self.startView.evaluateLabel.hidden = YES;
}

#pragma mark 打电话
- (void)callBtnClick:(UIButton *)sender
{
    NSString * phoneNumber = self.shopModel.phone;
    NSString * phoneNumberString = [NSString stringWithFormat:@"tel://%@",phoneNumber];
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:phoneNumberString]];
}

- (void)navigationImageTap
{
    if ([_delegate respondsToSelector:@selector(reservationViewCellNavigationWithModel:)]) {
        [self.delegate reservationViewCellNavigationWithModel:self.shopModel];
    }
}

- (void)checkStoreInfoBtnClick
{
    if ([_delegate respondsToSelector:@selector(reservationViewCellCheckStoreInfoWithModel:)]) {
        [self.delegate reservationViewCellCheckStoreInfoWithModel:self.shopModel];
    }
}

- (void)serviceItemsBtnClick:(UIButton *)sender
{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
