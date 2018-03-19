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

@property (nonatomic, weak) UILabel * orderPaymentTimeLabel;
@property (nonatomic, weak) UILabel * orderCompleteLabel;
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
        orderInformationLabel.font = [UIFont sy_boldFont15];
        orderInformationLabel.textColor = [UIColor sc_colorWith444444];
        [orderInformationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.top.equalTo(self.contentView.mas_top).with.offset(7.5);
        }];
        
        UIView * segmentView = [[UIView alloc] init];
        [self.contentView addSubview:segmentView];
        segmentView.backgroundColor = [UIColor sc_colorWithe5e5e5];
        [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.right.equalTo(self.contentView.mas_right).with.offset(-0);
            make.top.equalTo(self.contentView.mas_top).with.offset(44);
            make.height.mas_equalTo(1);
        }];
        
        UILabel * orderNumberLabel = [[UILabel alloc] init];
        self.orderNumLabel = orderNumberLabel;
        [self.contentView addSubview:orderNumberLabel];
        orderNumberLabel.font = [UIFont sy_font15];
        [orderNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.right.equalTo(self.contentView.mas_right).with.offset(-0);
            make.top.equalTo(segmentView.mas_bottom).with.offset(10);
        
        }];
        
        
        UILabel * orderTimeLabel = [[UILabel alloc] init];
        self.orderTimeLabel = orderTimeLabel;
        [self.contentView addSubview:orderTimeLabel];
        orderTimeLabel.font = [UIFont sy_font15];
        [orderTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.right.equalTo(self.contentView.mas_right).with.offset(-0);
            make.top.equalTo(orderNumberLabel.mas_bottom).with.offset(10);
        }];
        
        UILabel * orderPaymentTimeLabel = [[UILabel alloc] init];
        self.orderPaymentTimeLabel = orderPaymentTimeLabel;
        orderPaymentTimeLabel.font = [UIFont sy_font15];
        [self.contentView addSubview:orderPaymentTimeLabel];
        [orderPaymentTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.right.equalTo(self.contentView.mas_right).with.offset(-0);
            make.top.equalTo(orderTimeLabel.mas_bottom).with.offset(10);
        }];
        
        UILabel * orderCompleteLabel = [[UILabel alloc] init];
        self.orderCompleteLabel = orderCompleteLabel;
        orderCompleteLabel.font = [UIFont sy_font15];
        [self.contentView addSubview:orderCompleteLabel];
        [orderCompleteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.right.equalTo(self.contentView.mas_right).with.offset(-0);
            make.top.equalTo(orderPaymentTimeLabel.mas_bottom).with.offset(10);
        }];
        
        
        UIView * bottomSegmentView = [[UIView alloc] init];
        [self.contentView addSubview:bottomSegmentView];
        bottomSegmentView.backgroundColor = [UIColor sc_colorWithf8f8f8];
        [bottomSegmentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(0);
            make.right.equalTo(self.contentView.mas_right).with.offset(-0);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
            make.height.mas_equalTo(5);
        }];
    }
    return self;
}

- (void)setListModel:(SCOrderListModel *)listModel
{
    _listModel = listModel;
    self.orderNumLabel.text = [NSString stringWithFormat:@"订单号：%@",listModel.carNum];
    self.orderTimeLabel.text = [NSString stringWithFormat:@"下单时间：%@",listModel.createTime];
    self.orderPaymentTimeLabel.text = [NSString stringWithFormat:@"付款时间：%@",listModel.payTime];
    self.orderCompleteLabel.text = [NSString stringWithFormat:@"完成时间：%@",listModel.finishTime];
}
- (void)setOrderType:(NSInteger)orderType
{
    _orderType = orderType;
    if (orderType == 3 || orderType == 4) {
        self.orderPaymentTimeLabel.hidden = YES;
        self.orderCompleteLabel.hidden = YES;
    }else{
        self.orderPaymentTimeLabel.hidden = NO;
        self.orderCompleteLabel.hidden = NO;
        [self.orderPaymentTimeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(0, 0));
        }];
        [self.orderCompleteLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(0, 0));
        }];
    }
    
}


+ (CGFloat)cellHeightWithOrderType:(NSInteger)orderType
{
    if (orderType == 3) {
        return 200;
    }else if (orderType == 4){
        return 200;
    }else if(orderType == 1){
        return 140;
    }else if (orderType == 2){
        return 165;
    }
    return 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
