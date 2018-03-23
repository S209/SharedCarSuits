//
//  SCEvaluateRowTwoTableViewCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/23.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCEvaluateRowTwoTableViewCell.h"
#import "SCStartView.h"
@interface SCEvaluateRowTwoTableViewCell()
@property (nonatomic, weak) UILabel * storeEvaluateLabel;
@property (nonatomic, weak) UIView * segmentView;
@property (nonatomic, weak) SCStartView * startView;
@end
@implementation SCEvaluateRowTwoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)evaluateRowTwoTableViewCellWithTableView:(UITableView *)tableView
{
    static NSString * idDes = @"SCEvaluateRowTwoTableViewCellIDdes";
    [tableView registerClass:[SCEvaluateRowTwoTableViewCell class] forCellReuseIdentifier:idDes];
    SCEvaluateRowTwoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
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
    UIImageView * storeImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:storeImageView];
    [storeImageView setImage:[UIImage imageNamed:@"footer_ico_store_normal"]];
    [storeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
    }];
    
    UILabel * storeEvaluateLabel = [[UILabel alloc] init];
    [self.contentView addSubview:storeEvaluateLabel];
    self.storeEvaluateLabel = storeEvaluateLabel;
    storeEvaluateLabel.text = @"店铺评分";
    storeEvaluateLabel.font = [UIFont sy_font15];
    storeEvaluateLabel.textColor = [UIColor sc_colorWith666666];
    [storeEvaluateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(storeImageView.mas_right).with.offset(5);
        make.top.equalTo(storeImageView.mas_top).with.offset(0);
    }];
    
    UIView * segmentView = [[UIView alloc] init];
    [self.contentView addSubview:segmentView];
    self.segmentView = segmentView;
    segmentView.backgroundColor = [UIColor sc_colorWithe5e5e5];
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.top.equalTo(self.contentView.mas_top).with.offset(45);
        make.height.mas_equalTo(0.5);
    }];
    
    NSArray * evaluateArray = @[@"门店环境",@"服务态度",@"服务质量",@"店铺质量"];
    CGFloat evaluateLabelY = 0;
    for (NSUInteger i = 0; i < evaluateArray.count; i++) {
        evaluateLabelY = 15 + (16+20)*i;
        UILabel * evaluateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:evaluateLabel];
        evaluateLabel.font = [UIFont sy_font16];
        evaluateLabel.text = [NSString stringWithFormat:@"%@",[evaluateArray safeObjectAtIndex:i]];
        evaluateLabel.textColor = [UIColor sc_colorWith666666];
        [evaluateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(segmentView.mas_bottom).with.offset(evaluateLabelY);
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
        }];
       
        SCStartView * startView = [[SCStartView alloc] init];
        [self.contentView addSubview:startView];
        startView.frame = CGRectMake(93, evaluateLabelY+48, 165, 50);
    }
}

+ (CGFloat)cellHeight
{
    return 204;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
