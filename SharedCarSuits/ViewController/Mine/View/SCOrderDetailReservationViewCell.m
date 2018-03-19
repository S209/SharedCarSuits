//
//  SCOrderDetailReservationViewCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/18.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCOrderDetailReservationViewCell.h"
#import "SCOrderListModel.h"
@interface SCOrderDetailReservationViewCell()
@property (nonatomic, weak) UILabel * carInfoLabel;
@property (nonatomic, weak) UILabel * appointmentLabel;
@end
@implementation SCOrderDetailReservationViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)orderDetailReservationViewCellWithTableView:(UITableView *)tableView
{
    static NSString * idDes = @"SCOrderDetailReservationViewCellIDdes";
    [tableView registerClass:[SCOrderDetailReservationViewCell class] forCellReuseIdentifier:idDes];
    SCOrderDetailReservationViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
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
    UILabel * reservationInformationLabel = [[UILabel alloc] init];
    [self.contentView addSubview:reservationInformationLabel];
    reservationInformationLabel.text = @"预约信息";
    reservationInformationLabel.font = [UIFont sy_boldFont15];
    reservationInformationLabel.textColor = [UIColor sc_colorWith444444];
    [reservationInformationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(self.contentView.mas_top).with.offset(7.5);
    }];
    
    UIView * segmentView = [[UIView alloc] init];
    [self.contentView addSubview:segmentView];
    segmentView.backgroundColor = [UIColor sc_colorWithe5e5e5];
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.top.equalTo(self.contentView.mas_top).with.offset(45);
        make.height.mas_equalTo(0.5);
    }];
    
    UILabel * carInfoLabel = [[UILabel alloc] init];
    [self.contentView addSubview:carInfoLabel];
    self.carInfoLabel = carInfoLabel;
    carInfoLabel.font = [UIFont sy_font13];
    [carInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(segmentView.mas_bottom).with.offset(20);
    }];
    
    UILabel * appointmentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:appointmentLabel];
    self.appointmentLabel = appointmentLabel;
    appointmentLabel.font = [UIFont sy_font13];
    [appointmentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(carInfoLabel.mas_bottom).with.offset(20);;
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


- (void)setListModel:(SCOrderListModel *)listModel
{
    _listModel = listModel;
    self.carInfoLabel.text = [NSString stringWithFormat:@"车辆信息：%@",listModel.carNum];
    self.appointmentLabel.text = [NSString stringWithFormat:@"预约时间：%@",listModel.appointTime];
}

+ (CGFloat)cellHeight
{
    return 140;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
