//
//  SCOrderDetailServiceNameViewCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/18.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCOrderDetailServiceNameViewCell.h"

@interface SCOrderDetailServiceNameViewCell()
@property (nonatomic, weak) UILabel * servieceNameLabel;
@property (nonatomic, weak) UIView * segmentView;
@property (nonatomic, weak) UILabel * serviceNameLabel;
@property (nonatomic, weak) UILabel * priceLabel;
@property (nonatomic, copy) NSString * priceString;
@end
@implementation SCOrderDetailServiceNameViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)orderDetailServiceNameViewCellWithTableView:(UITableView *)tableView price:(NSString *)price
{
    static NSString * idDes = @"SCOrderDetailServiceNameViewCellIDdes";
    [tableView registerClass:[SCOrderDetailServiceNameViewCell class] forCellReuseIdentifier:idDes];
    SCOrderDetailServiceNameViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
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
    UILabel * servieceNameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:servieceNameLabel];
    servieceNameLabel.font = [UIFont sy_boldFont9];
    servieceNameLabel.textColor = [UIColor sc_colorWith282828];
    self.servieceNameLabel = servieceNameLabel;
    servieceNameLabel.text = @"洗车美容";
    [servieceNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(self.contentView.mas_top).with.offset(20);
    }];
    
    UIView * segmentView = [[UIView alloc] init];
    [self.contentView addSubview:segmentView];
    self.segmentView = segmentView;
    segmentView.backgroundColor = [UIColor sc_colorWithe5e5e5];
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.height.mas_equalTo(0.5);
        make.top.equalTo(servieceNameLabel.mas_bottom).with.offset(13);
    }];
    
    UILabel * serviceNameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:serviceNameLabel];
    serviceNameLabel.text = @"镀膜洗车 | 车室清洗 | 车室护理";
    serviceNameLabel.font = [UIFont sy_font17];
    serviceNameLabel.textColor = [UIColor sc_colorWith666666];
    self.serviceNameLabel = serviceNameLabel;
    [serviceNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.height.mas_equalTo(0.5);
        make.top.equalTo(segmentView.mas_bottom).with.offset(9);
    }];
    
    
    UILabel * priceLabel = [[UILabel alloc] init];
    [self.contentView addSubview:priceLabel];
    self.priceLabel = priceLabel;
    priceLabel.font = [UIFont sy_font9];
    priceLabel.textColor = [UIColor sc_colorWith6C6DFD];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(13);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.top.equalTo(serviceNameLabel.mas_bottom).with.offset(10);
    }];
    
    UILabel * unitLabel = [[UILabel alloc] init];
    [self.contentView addSubview:unitLabel];
    unitLabel.text = @"¥";
    unitLabel.textColor = [UIColor sc_colorWith6C6DFD];
    [unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(priceLabel.mas_bottom).with.offset(0);
        make.right.equalTo(priceLabel.mas_left).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(4, 5));
    }];
    
    UIView * bottomSegmentView = [[UIView alloc] init];
    [self.contentView addSubview:bottomSegmentView];
    [bottomSegmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(2.5);
    }];
}


- (void)setPriceString:(NSString *)priceString
{
    _priceString = priceString;
    self.priceLabel.text = priceString;
}

+ (CGFloat)cellHeight
{
    return 68;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
