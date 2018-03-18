//
//  SCOrderDetailOrderInfoViewCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/18.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCOrderDetailOrderInfoViewCell.h"
#import "SCOrderListModel.h"
@interface SCOrderDetailOrderInfoViewCell ()
@property (nonatomic, weak) UILabel * orderNumLabel;
@property (nonatomic, weak) UILabel * orderTimeLabel;
@end
@implementation SCOrderDetailOrderInfoViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)orderDetailOrderInfoViewCellWithTableView:(UITableView *)tableView
{
    static NSString * idDes = @"SCOrderDetailOrderInfoViewCellIdDES";
    [tableView registerClass:[SCOrderDetailOrderInfoViewCell class] forCellReuseIdentifier:idDes];
    SCOrderDetailOrderInfoViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * orderInformationLabel = [[UILabel alloc] init];
        [self.contentView addSubview:orderInformationLabel];
        orderInformationLabel.text = @"订单信息";
        orderInformationLabel.font = [UIFont sy_font8];
        orderInformationLabel.textColor = [UIColor sc_colorWith444444];
        [orderInformationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.top.equalTo(self.contentView.mas_top).with.offset(7.5);
        }];
        
        UIView * segmentView = [[UIView alloc] init];
        [self.contentView addSubview:segmentView];
        [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.right.equalTo(self.contentView.mas_right).with.offset(-0);
            make.top.equalTo(self.contentView.mas_top).with.offset(22);
            make.height.mas_equalTo(1);
        }];
        
        UILabel * orderNumberLabel = [[UILabel alloc] init];
        [self.contentView addSubview:orderNumberLabel];
        [orderNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.right.equalTo(self.contentView.mas_right).with.offset(-0);
            make.top.equalTo(segmentView.mas_bottom).with.offset(10);
        
        }];
        
        
        UILabel * orderTimeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:orderTimeLabel];
        [orderTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.right.equalTo(self.contentView.mas_right).with.offset(-0);
            make.top.equalTo(orderNumberLabel.mas_bottom).with.offset(10);
        }];
        
        UIView * bottomSegmentView = [[UIView alloc] init];
        [self.contentView addSubview:bottomSegmentView];
        bottomSegmentView.backgroundColor = [UIColor sc_colorWithf8f8f8];
        [bottomSegmentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(0);
            make.right.equalTo(self.contentView.mas_right).with.offset(-0);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
            make.height.mas_equalTo(2.5);
        }];
    }
    return self;
}

- (void)setListModel:(SCOrderListModel *)listModel
{
    _listModel = listModel;
    self.orderNumLabel.text = [NSString stringWithFormat:@"订单号：%@",listModel.carNum];
    self.orderTimeLabel.text = [NSString stringWithFormat:@"下单时间：%@",listModel.createTime];
}

+ (CGFloat)cellHeight
{
    return 70;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
