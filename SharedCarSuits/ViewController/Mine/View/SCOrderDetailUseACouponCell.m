//
//  SCOrderDetailUseACouponCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/18.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCOrderDetailUseACouponCell.h"

@implementation SCOrderDetailUseACouponCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)orderDetailUseACouponCellWithTabeleView:(UITableView *)tableview
{
    static NSString * idDes = @"SCOrderDetailUseACouponCellIDdes";
    [tableview registerClass:[SCOrderDetailUseACouponCell class] forCellReuseIdentifier:idDes];
    SCOrderDetailUseACouponCell * cell = [tableview dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * paymentWayLabel = [[UILabel alloc] init];
        [self.contentView addSubview:paymentWayLabel];
        paymentWayLabel.text = @"使用优惠券";
        paymentWayLabel.font = [UIFont sy_font16];
        paymentWayLabel.textColor = [UIColor blackColor];
        [paymentWayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.top.equalTo(self.contentView.mas_top).with.offset(7);
        }];
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
