//
//  SCOrderListCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/26.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCOrderListCell.h"
#import "SCOrderListModel.h"
@interface SCOrderListCell()
@property (nonatomic, weak) UILabel * serviceLabel;
@property (nonatomic, weak) UIView * segmentView;
@property (nonatomic, weak) UIView * segmentTwoView;
@property (nonatomic, weak) UILabel * projectLabel;
@property (nonatomic, weak) UILabel * moneyLabel;
@property (nonatomic, weak) UILabel * carInfoLabel;
@property (nonatomic, weak) UILabel * timeLabel;
@property (nonatomic, weak) UILabel * completeLabel;
@property (nonatomic, weak) UIButton * paymentBtn;
@property (nonatomic, weak) UIImageView * bottomImageView;
@property (nonatomic, weak) UIView * bottomSegmentView;
@property (nonatomic, assign) OrderType orderType;
@property (nonatomic, weak) UILabel * unitLabel;
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

+ (instancetype)orderListCellWithTableView:(UITableView *)tableView  orderType:(OrderType)orderTyp
{
    static NSString * idDes = @"SCOrderListCellIDdes";
    [tableView registerClass:[SCOrderListCell class] forCellReuseIdentifier:idDes];
    SCOrderListCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.orderType = orderTyp;
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

    UIView * segmentView = [[UIView alloc] init];
    [self.contentView addSubview:segmentView];
    self.segmentView = segmentView;
    segmentView.backgroundColor = [UIColor sc_colorWithe5e5e5];
    
    UILabel * projectLabel = [[UILabel alloc] init];
    [self.contentView addSubview:projectLabel];
    self.projectLabel = projectLabel;
    projectLabel.font = [UIFont sy_font14];
    projectLabel.textColor = [UIColor sc_colorWith666666];

    
    UILabel * moneyLabel = [[UILabel alloc] init];
    [self.contentView addSubview:moneyLabel];
    moneyLabel.textColor = [UIColor sc_colorWith6C6DFD];
    self.moneyLabel = moneyLabel;
    
    UILabel * unitLabel = [[UILabel alloc] init];
    self.unitLabel = unitLabel;
    [self.contentView addSubview:unitLabel];
    unitLabel.text = @"¥";
    unitLabel.font = [UIFont sy_font10];
    unitLabel.textColor = [UIColor sc_colorWith6C6DFD];
    [unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(self.moneyLabel.mas_top).with.offset(0);
        make.left.equalTo(projectLabel.mas_left).with.offset(0);
    }];

    
    UILabel * carInfoLabel = [[UILabel alloc] init];
    [self.contentView addSubview:carInfoLabel];
    self.carInfoLabel = carInfoLabel;
    carInfoLabel.font = [UIFont sy_font12];
    carInfoLabel.textColor = [UIColor sc_colorWith444444];

    
    UILabel * timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    timeLabel.font = [UIFont sy_font12];
    timeLabel.textColor = [UIColor sc_colorWith444444];
    
    UILabel * completeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:completeLabel];
    self.completeLabel = completeLabel;
    completeLabel.font = [UIFont sy_font12];
    completeLabel.textColor = [UIColor sc_colorWith444444];
    
    UIView * segmentTwoView = [[UIView alloc] init];
    self.segmentTwoView = segmentTwoView;
    [self.contentView addSubview:segmentTwoView];
    segmentTwoView.backgroundColor = [UIColor sc_colorWithe5e5e5];
    
    UIButton * paymentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:paymentBtn];
    self.paymentBtn = paymentBtn;
    paymentBtn.titleLabel.font = [UIFont sy_font12];
    paymentBtn.layer.masksToBounds = YES;
    [paymentBtn.layer setCornerRadius:2.0];
    [paymentBtn.layer setBorderWidth:1.0];
    [paymentBtn addTarget:self action:@selector(paymentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [paymentBtn setTitle:@"立即支付" forState:UIControlStateNormal];
    [paymentBtn setTitleColor:[UIColor sc_colorWith6C6DFD] forState:UIControlStateNormal];
    [paymentBtn.layer setBorderColor:[[UIColor sc_colorWith6C6DFD] CGColor]];
   
    
    UIImageView * bottomImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:bottomImageView];
    self.bottomImageView = bottomImageView;
    [bottomImageView setImage:[UIImage imageNamed:@"bg_footer"]];
    bottomImageView.backgroundColor = [UIColor sc_colorWithF4F4F4];
    
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
        make.top.equalTo(self.contentView.mas_top).with.offset(50);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.projectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.top.equalTo(self.segmentView.mas_bottom).with.offset(16);
    }];
    
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.unitLabel.mas_right).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.top.equalTo(self.projectLabel.mas_bottom).with.offset(15);
    }];
    
    [self.carInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(self.moneyLabel.mas_bottom).with.offset(16);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(self.carInfoLabel.mas_bottom).with.offset(8);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
    }];

    
    [self.completeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(self.timeLabel.mas_bottom).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
    }];
    
    
    [self.segmentTwoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.top.equalTo(self.segmentView.mas_bottom).with.offset(145);
        make.height.mas_equalTo(0.5);
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
    if ([_delegate respondsToSelector:@selector(orderlistCellCancenOrderWithListModel:)]) {
        [self.delegate orderlistCellCancenOrderWithListModel:self.listModel];
    }
}

- (void)setOrderType:(OrderType)orderType
{
    _orderType = orderType;
    
    if (orderType == OrderTypeNoPay) {
        self.completeLabel.hidden = YES;
        [self.completeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(0, 0));
        }];
        
        [self.paymentBtn setTitle:@"立即支付" forState:UIControlStateNormal];
        self.paymentBtn.hidden = NO;
        [self.paymentBtn setTitleColor:[UIColor sc_colorWith6C6DFD] forState:UIControlStateNormal];
        [self.paymentBtn.layer setBorderColor:[[UIColor sc_colorWith6C6DFD] CGColor]];
        [self.paymentBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.top.equalTo(self.segmentTwoView.mas_bottom).with.offset(12);
            make.size.mas_equalTo(CGSizeMake(70, 27));
        }];
        self.bottomSegmentView.hidden = NO;
        self.segmentTwoView.hidden = NO;
    }else if (orderType == OrderTypePayed) {
        self.completeLabel.hidden = YES;
        [self.completeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(0, 0));
        }];
        [self.paymentBtn setTitle:@"取消预约" forState:UIControlStateNormal];
        self.paymentBtn.titleLabel.font = [UIFont sy_font12];
         self.paymentBtn.hidden = NO;
        [self.paymentBtn setTitleColor:[UIColor sc_colorWith999999] forState:UIControlStateNormal];
        [self.paymentBtn.layer setBorderColor:[[UIColor sc_colorWith999999] CGColor]];
        [self.paymentBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
   make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.top.equalTo(self.segmentTwoView.mas_bottom).with.offset(12);
            make.size.mas_equalTo(CGSizeMake(70, 27));
        }];
        self.segmentTwoView.hidden = NO;
    }else if (orderType== OrderTypeComplete || orderType == OrderTypeCancel){
        self.paymentBtn.hidden = YES;
        self.completeLabel.hidden = NO;
        self.segmentTwoView.hidden = YES;
        [self.completeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.top.equalTo(self.timeLabel.mas_bottom).with.offset(10);
            make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        }];
        [self.paymentBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.top.equalTo(self.segmentTwoView.mas_bottom).with.offset(12);
            make.size.mas_equalTo(CGSizeMake(0, 0));
        }];
    }
}

- (void)setListModel:(SCOrderListModel *)listModel
{
    _listModel = listModel;
//1：洗车美容 //2：换油保养 //3：钣金喷漆
    if (listModel.orderType == 1) {
        self.serviceLabel.text = @"洗车美容";
    }else if (listModel.orderType == 2){
        self.serviceLabel.text = @"换油保养";
    }else if(listModel.orderType == 3){
        self.serviceLabel.text = @"钣金喷漆";
    }
    
    NSArray * projectArray = [listModel.orderProjectName componentsSeparatedByString:@";"];
    
    NSMutableString * mutableString = [[NSMutableString alloc] init];
    
    for (NSUInteger i = 0; i < projectArray.count; i++) {
        NSString * string = [projectArray safeObjectAtIndex:i];
          [mutableString appendString:string];
        if (i < projectArray.count-1) {
            [mutableString appendString:@" | "];
        }
    }
    

    self.projectLabel.text = mutableString;
    self.carInfoLabel.text = [NSString stringWithFormat:@"车辆信息：%@",listModel.carNum];
    self.moneyLabel.text = listModel.price;
    self.timeLabel.text = [NSString stringWithFormat:@"预约时间：%@",listModel.appointTime];
}

+ (CGFloat)cellHeightWithOrderType:(OrderType)orderType
{
    if (orderType == OrderTypeNoPay||
        orderType == OrderTypePayed) {
        return 252;
    }else{
       return 255-47-15;
    }
}
@end
