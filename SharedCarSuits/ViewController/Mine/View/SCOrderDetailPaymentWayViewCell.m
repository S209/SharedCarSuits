//
//  SCOrderDetailPaymentWayViewCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/18.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCOrderDetailPaymentWayViewCell.h"

@interface SCOrderDetailPaymentWayViewCell ()
@property (nonatomic, weak) UIImageView * payWayImageView;
@end
@implementation SCOrderDetailPaymentWayViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)orderDetailPaymentWayViewCellWithTabeleView:(UITableView *)tableView
{
    static NSString * idDes = @"SCOrderDetailPaymentWayViewCell";
    [tableView registerClass:[SCOrderDetailPaymentWayViewCell class] forCellReuseIdentifier:idDes];
    SCOrderDetailPaymentWayViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * paymentWayLabel = [[UILabel alloc] init];
        [self.contentView addSubview:paymentWayLabel];
        paymentWayLabel.text = @"支付方式";
        paymentWayLabel.font = [UIFont sy_font16];
        paymentWayLabel.textColor = [UIColor blackColor];
        [paymentWayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.top.equalTo(self.contentView.mas_top).with.offset(13);
        }];
        
        UIImageView * payWayImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:payWayImageView];
        self.payWayImageView = payWayImageView;
        [payWayImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(paymentWayLabel.mas_centerY);
            make.right.equalTo(self.contentView.mas_right).with.offset(-30);
        }];
        
        UIView * segmentView = [[UIView alloc] init];
        [self.contentView addSubview:segmentView];
        [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(0);
            make.right.equalTo(self.contentView.mas_right).with.offset(-0);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
            make.height.mas_equalTo(5);
        }];
        segmentView.backgroundColor = [UIColor sc_colorWithf8f8f8];
    }
    return self;
}

+ (CGFloat)cellHeight
{
    return 50;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
