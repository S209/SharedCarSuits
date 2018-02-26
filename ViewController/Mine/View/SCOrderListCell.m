//
//  SCOrderListCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/26.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCOrderListCell.h"

@interface SCOrderListCell()
@property (nonatomic, weak) UILabel * serviceLabel;
@property (nonatomic, weak) UIView * segmentView;
@property (nonatomic, weak) UIView * segmentTwoView;
@property (nonatomic, weak) UILabel * projectLabel;
@property (nonatomic, weak) UILabel * moneyLabel;
@property (nonatomic, weak) UILabel * carInfoLabel;
@property (nonatomic, weak) UILabel * timeLabel;
@property (nonatomic, weak) UIButton * paymentBtn;
@property (nonatomic, weak) UIImageView * bottomImageView;
@property (nonatomic, weak) UIView * bottomSegmentView;
@end
@implementation SCOrderListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)orderListCellWithTableView:(UITableView *)tableView
{
    static NSString * idDes = @"SCOrderListCellIDdes";
    [tableView registerClass:[SCOrderListCell class] forCellReuseIdentifier:idDes];
    SCOrderListCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
    UILabel * serviceLabel = [[UILabel alloc] init];
    [self.contentView addSubview:serviceLabel];
    self.serviceLabel = serviceLabel;
    serviceLabel.font = [UIFont sy_boldFont16];
    serviceLabel.textColor = [UIColor sc_colorWith282828];
    serviceLabel.text = @"洗车美容";
    
    
    UIView * segmentView = [[UIView alloc] init];
    [self.contentView addSubview:segmentView];
    self.segmentView = segmentView;
    segmentView.backgroundColor = [UIColor sc_colorWithe5e5e5];
    
    UILabel * projectLabel = [[UILabel alloc] init];
    [self.contentView addSubview:projectLabel];
    self.projectLabel = projectLabel;
    projectLabel.font = [UIFont sy_font14];
    projectLabel.textColor = [UIColor sc_colorWith666666];
    projectLabel.text = @"镀膜洗车 | 车室清洗 | 车室护理";
    
    UILabel * moneyLabel = [[UILabel alloc] init];
    [self.contentView addSubview:moneyLabel];
    self.moneyLabel = moneyLabel;
    
    UILabel * carInfoLabel = [[UILabel alloc] init];
    [self.contentView addSubview:carInfoLabel];
    self.carInfoLabel = carInfoLabel;
    carInfoLabel.font = [UIFont sy_font12];
    carInfoLabel.textColor = [UIColor sc_colorWith444444];
    carInfoLabel.text = @"车辆信息：皖A KL466";
    
    UILabel * timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    timeLabel.font = [UIFont sy_font12];
    timeLabel.textColor = [UIColor sc_colorWith444444];
    timeLabel.text = @"预约时间：2018年02月17日 上午10：00";
    
    UIView * segmentTwoView = [[UIView alloc] init];
    self.segmentTwoView = segmentTwoView;
    [self.contentView addSubview:segmentTwoView];
    segmentTwoView.backgroundColor = [UIColor sc_colorWithe5e5e5];
    
    UIButton * paymentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:paymentBtn];
    self.paymentBtn = paymentBtn;
    [paymentBtn setTitle:@"立即支付" forState:UIControlStateNormal];
    [paymentBtn setTitleColor:[UIColor sc_colorWith6C6DFD] forState:UIControlStateNormal];
    paymentBtn.titleLabel.font = [UIFont sy_font12];
    paymentBtn.layer.masksToBounds = YES;
    [paymentBtn.layer setCornerRadius:2.0];
    [paymentBtn.layer setBorderColor:[[UIColor sc_colorWith6C6DFD] CGColor]];
    [paymentBtn.layer setBorderWidth:1.0];
    [paymentBtn addTarget:self action:@selector(paymentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView * bottomImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:bottomImageView];
    self.bottomImageView = bottomImageView;
    [bottomImageView setImage:[UIImage imageNamed:@"bg_footer"]];
   
    
    UIView * bottomSegmentView = [[UIView alloc] init];
    [self.contentView addSubview:bottomSegmentView];
    self.bottomSegmentView = bottomSegmentView;
    bottomSegmentView.backgroundColor = [UIColor sc_colorWithF4F4F4];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.serviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.top.equalTo(self.contentView.mas_top).with.offset(20);
    }];
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.top.equalTo(self.serviceLabel.mas_bottom).with.offset(14);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.projectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.top.equalTo(self.segmentView.mas_bottom).with.offset(18);
    }];
    
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.top.equalTo(self.projectLabel.mas_bottom).with.offset(20);
    }];
    
    [self.carInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(self.moneyLabel.mas_bottom).with.offset(20);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(self.carInfoLabel.mas_bottom).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
    }];
    
    [self.segmentTwoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.top.equalTo(self.timeLabel.mas_bottom).with.offset(20);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.paymentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.top.equalTo(self.segmentTwoView.mas_bottom).with.offset(12);
        make.size.mas_equalTo(CGSizeMake(69, 27));
    }];
    
    [self.bottomSegmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(5);
    }];
    
    [self.bottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.bottom.equalTo(self.bottomSegmentView.mas_top).with.offset(-0);
        make.height.mas_equalTo(5);
    }];
}


- (void)paymentBtnClick:(UIButton *)sender
{
    
}

+ (CGFloat)cellHeight
{
    return 255;
}
@end