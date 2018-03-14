//
//  SCEvaluationViewSectionOneCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/2.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCEvaluationViewSectionOneCell.h"
#import "SCStartView.h"
@interface SCEvaluationViewSectionOneCell()
@property (nonatomic, weak) SCStartView * startView;
@end
@implementation SCEvaluationViewSectionOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
    UILabel * serviceNameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:serviceNameLabel];
    [serviceNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(self.contentView.mas_top).with.offset(0);
    }];
    
    UIView * segmentView = [[UIView alloc] init];
    [self.contentView addSubview:segmentView];
    
    UILabel * serviceLabel = [[UILabel alloc] init];
    [self.contentView addSubview:serviceLabel];
    [serviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.top.equalTo(segmentView.mas_bottom).with.offset(0);
        make.height.mas_equalTo(48);
    }];
    
    
    
    UILabel * priceLabel = [[UILabel alloc] init];
    [self.contentView addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(serviceLabel.mas_bottom).with.offset(0);
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
    }];
    
    
    UIView * segmentViewTwo = [[UIView alloc] init];
    [self.contentView addSubview:segmentViewTwo];
    [segmentViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(segmentView.mas_bottom
                         
                         
                         
                         );
    }];
    
    
    UITextView * textView = [[UITextView alloc] init];
    [self.contentView addSubview:textView];
    
    SCStartView * startView = [[SCStartView alloc] init];
    [self.contentView addSubview:startView];
    [startView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.top.equalTo(self.contentView.mas_top).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(160, 50));
    }];
    self.startView = startView;
    
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.top.equalTo(self.contentView.mas_top).with.offset(50);
        make.height.mas_equalTo(0.5);
    }];
    
    
    
}

+ (CGFloat)cellHeight
{
    return 280;
}
@end
