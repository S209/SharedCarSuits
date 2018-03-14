//
//  SCMyAppointmentViewCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/23.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMyAppointmentViewCell.h"

@interface SCMyAppointmentViewCell()
@property (nonatomic, weak) UIView * bottomView;
@property (nonatomic, weak) UIImageView * carImageView;
@property (nonatomic, weak) UILabel * serviceNameLabel;
@property (nonatomic, weak) UIImageView * checkImageView;
@property (nonatomic, weak) UILabel * consumptionTimeLabel;
@property (nonatomic, weak) UIImageView * timeImgeView;
@property (nonatomic, weak) UILabel * priceLabel;
@property (nonatomic, weak) UIView * segmentView;
@property (nonatomic, weak) UIButton * checkBtn;
@end
@implementation SCMyAppointmentViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)myAppointmentViewCellWithTabeleView:(UITableView *)tableView
{
    static NSString * idDes = @"SCMyAppointmentViewCellIDdes";
    [tableView registerClass:[SCMyAppointmentViewCell class] forCellReuseIdentifier:idDes];
    SCMyAppointmentViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView * bottomView = [[UIView alloc] init];
        [self.contentView addSubview:bottomView];
        self.bottomView = bottomView;
        bottomView.backgroundColor = [UIColor sc_colorWithf8f8f8];
        bottomView.layer.masksToBounds = YES;
        [bottomView.layer setCornerRadius:4.0];
        
        UIImageView * carImageView = [[UIImageView alloc] init];
        [bottomView addSubview:carImageView];
        self.carImageView = carImageView;
        carImageView.clipsToBounds = YES;
        carImageView.contentMode = UIViewContentModeScaleAspectFill;

        
        UILabel * serviceNameLabel = [[UILabel alloc] init];
        [bottomView addSubview:serviceNameLabel];
        self.serviceNameLabel = serviceNameLabel;
        serviceNameLabel.font = [UIFont sy_font16];
        serviceNameLabel.textColor = [UIColor sc_colorWith444444];

        
        UIImageView * checkImageView = [[UIImageView alloc] init];
        [bottomView addSubview:checkImageView];
        self.checkImageView = checkImageView;
        [checkImageView setImage:[UIImage imageNamed:@"store_list_normal"]];
        checkImageView.userInteractionEnabled = YES;
        
        UIButton * checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [bottomView addSubview:checkBtn];
        self.checkBtn = checkBtn;
        [checkBtn addTarget:self action:@selector(checkBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        checkBtn.selected = NO;
        
        UIImageView * timeImgeView = [[UIImageView alloc] init];
        [bottomView addSubview:timeImgeView];
        [timeImgeView setImage:[UIImage imageNamed:@"hyby_ico_time"]
         ];
        self.timeImgeView = timeImgeView;
        
        
        UILabel * consumptionTimeLabel = [[UILabel alloc] init];
        [bottomView addSubview:consumptionTimeLabel];
        consumptionTimeLabel.font = [UIFont sy_font12];
        consumptionTimeLabel.textColor = [UIColor sc_colorWithFC8739];
        self.consumptionTimeLabel = consumptionTimeLabel;

        
        UILabel * priceLabel = [[UILabel alloc] init];
        [self.contentView addSubview: priceLabel];
        self.priceLabel = priceLabel;
        [bottomView addSubview:priceLabel];
        priceLabel.font = [UIFont sy_font10];
        priceLabel.textColor = [UIColor sc_colorWith444444];
        
        UIView * segmentView = [[UIView alloc] init];
        [self.contentView addSubview:segmentView];
        self.segmentView = segmentView;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.top.equalTo(self.contentView.mas_top).with.offset(0);
        make.height.mas_equalTo(70);
    }];
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(10);
    }];
    
    [self.carImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomView.mas_left).with.offset(10);
        make.top.equalTo(self.bottomView.mas_top).with.offset(10);
        make.bottom.equalTo(self.bottomView.mas_bottom).with.offset(-10);
        make.width.mas_equalTo(74);
    }];
    
    [self.serviceNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.carImageView.mas_right).with.offset(16);
        make.top.equalTo(self.carImageView.mas_top).with.offset(0);
    }];
    
    [self.timeImgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.serviceNameLabel.mas_left).with.offset(0);
        make.bottom.equalTo(self.carImageView.mas_bottom).with.offset(-0);
        make.size.mas_equalTo(CGSizeMake(13, 13));
    }];
    
    [self.consumptionTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeImgeView.mas_right).with.offset(3.5);
        make.bottom.equalTo(self.carImageView.mas_bottom).with.offset(2);
    }];
    
    [self.checkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bottomView.mas_right).with.offset(-0);
        make.top.equalTo(self.bottomView.mas_top).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(37.5, 32.5));
    }];
    
    [self.checkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bottomView.mas_right).with.offset(-0);
        make.top.equalTo(self.bottomView.mas_top).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(37.5, 32.5));
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.checkImageView.mas_left).with.offset(-0);
        make.top.equalTo(self.serviceNameLabel.mas_bottom).with.offset(0);
    }];
}

+ (CGFloat)cellHeight
{
    return 80;
}

#pragma mark
- (void)checkBtnClick:(UIButton *)sender
{
    if (sender.selected) {
        sender.selected = NO;
        [self.checkImageView setImage:[UIImage imageNamed:@"store_list_normal"]];
    }else{
        sender.selected = YES;
        [self.checkImageView setImage:[UIImage imageNamed:@"store_list_selected"]];
    }
}

@end
