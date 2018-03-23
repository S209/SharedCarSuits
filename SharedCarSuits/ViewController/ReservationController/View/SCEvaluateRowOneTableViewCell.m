//
//  SCEvaluateRowOneTableViewCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/23.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCEvaluateRowOneTableViewCell.h"
#import "SCStartView.h"
#import "XHMessageTextView.h"
#import "SCOrderListModel.h"
@interface SCEvaluateRowOneTableViewCell ()<UITextViewDelegate>
@property (nonatomic, weak) UILabel * serviceNameLabel;
@property (nonatomic, weak) SCStartView * startView;
@property (nonatomic, weak) UILabel * segmentLabel;
@property (nonatomic, weak) UILabel * segmentTwoLabel;
@property (nonatomic, weak) UILabel * serviceLabel;
@property (nonatomic, weak) UILabel * unitLabel;
@property (nonatomic, weak) XHMessageTextView * textView;
@property (nonatomic, weak) UIView * bottomSegmentView;
@property (nonatomic, weak) UILabel * priceLabel;
@end
@implementation SCEvaluateRowOneTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)evaluateRowOneTableViewCellWithTableView:(UITableView *)tableView
{
    static NSString * idDes = @"SCEvaluateRowOneTableViewCellIDdes";
    [tableView registerClass:[SCEvaluateRowOneTableViewCell class] forCellReuseIdentifier:idDes];
    SCEvaluateRowOneTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * serviceNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:serviceNameLabel];
        self.serviceNameLabel = serviceNameLabel;
        serviceNameLabel.font = [UIFont sy_boldFont18];
        serviceNameLabel.textColor = [UIColor blackColor];
        [serviceNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.top.equalTo(self.contentView.mas_top).with.offset(15);
        }];
        
        SCStartView * startView = [[SCStartView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-165, 17, 165, 50)];
        [self.contentView addSubview:startView];
        self.startView = startView;

        UILabel * segmentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:segmentLabel];
        self.segmentLabel = segmentLabel;
        segmentLabel.backgroundColor = [UIColor sc_colorWithe5e5e5];
        [segmentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.top.equalTo(self.contentView.mas_top).with.offset(50);
            make.height.mas_equalTo(0.5);
        }];
        
        UILabel * serviceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:serviceLabel];
        self.serviceLabel = serviceLabel;
        serviceLabel.font = [UIFont sy_font14];
        serviceLabel.textColor = [UIColor sc_colorWith666666];
        [serviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.top.equalTo(segmentLabel.mas_bottom).with.offset(9);
        }];
        
        UILabel * unitLabel = [[UILabel alloc] init];
        [self.contentView addSubview:unitLabel];
        self.unitLabel = unitLabel;
        unitLabel.text = @"¥";
        unitLabel.font = [UIFont sy_font10];
        unitLabel.textColor = [UIColor sc_colorWith6C6DFD];
        [unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.top.equalTo(serviceLabel.mas_bottom).with.offset(15);
        }];
        
        UILabel * priceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:priceLabel];
        self.priceLabel = priceLabel;
        priceLabel.textColor = [UIColor sc_colorWith6C6DFD];
        priceLabel.font = [UIFont sy_font19];
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(unitLabel.mas_right).with.offset(5);
            make.top.equalTo(unitLabel.mas_top).with.offset(0);
        }];
        
        UILabel * segmentTwoLabel = [[UILabel alloc] init];
        [self.contentView addSubview:segmentTwoLabel];
        self.segmentTwoLabel = segmentTwoLabel;
        segmentTwoLabel.backgroundColor = [UIColor sc_colorWithe5e5e5];
        [segmentTwoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.top.equalTo(segmentLabel.mas_bottom).with.offset(90);
            make.height.mas_equalTo(0.5);
        }];
        
        XHMessageTextView * textView = [[XHMessageTextView alloc] init];
        [self.contentView addSubview:textView];
        self.textView = textView;
        textView.delegate = self;
        textView.placeHolderTextColor = [UIColor sc_colorWithCCCCCC];
        textView.placeHolder = @"请输入对本次服务的评价，分享给其他人吧";
        [textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.top.equalTo(segmentTwoLabel.mas_bottom).with.offset(5);
            make.height.mas_equalTo(129);
        }];
        
        
        UIView * bottomSegmentView = [[UIView alloc] init];
        [self.contentView addSubview:bottomSegmentView];
        self.bottomSegmentView = bottomSegmentView;
        bottomSegmentView.backgroundColor = [UIColor sc_colorWithf8f8f8];
        [bottomSegmentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(0);
            make.right.equalTo(self.contentView.mas_right).with.offset(-0);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
            make.height.mas_equalTo(10);
        }];
    }
    return self;
}

+ (CGFloat)cellHeight
{
    return 274;
}

- (void)setListModel:(SCOrderListModel *)listModel
{
    _listModel = listModel;
    //1：洗车美容 //2：换油保养 //3：钣金喷漆
    if (listModel.orderType == 1) {
        self.serviceNameLabel.text = @"洗车美容";
    }else if(listModel.orderType == 2){
        self.serviceNameLabel.text = @"换油保养";
    }else if (listModel.orderType == 3){
        self.serviceNameLabel.text = @"钣金喷漆";
    }

    NSArray * projectArray = [listModel.orderProjectName componentsSeparatedByString:@";"];
    NSMutableString * mutableString = [[NSMutableString alloc] init];
    for (NSUInteger i = 0; i < projectArray.count;i++) {
        NSString * string = [projectArray safeObjectAtIndex:i];
        [mutableString appendString:string];
        if (i < projectArray.count -1) {
            [mutableString appendString:@" | "];
        }
    }
    self.serviceLabel.text = mutableString;
    self.priceLabel.text = listModel.price;
}


- (void)textViewDidEndEditing:(UITextView *)textView
{
    self.contentString = textView.text;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
