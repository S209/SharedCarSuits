//
//  SCMyMsgCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/28.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMyMsgCell.h"
#import "SCMyMsgModel.h"
@interface SCMyMsgCell ()
@property (nonatomic, weak) UIImageView * msgImageView;
@property (nonatomic, weak) UILabel * msgTypeLabel;
@property (nonatomic, weak) UILabel * lastMsg;
@property (nonatomic, weak) UIView * segmentView;
@property (nonatomic, strong) SCMyMsgModel * msgModel;
@end
@implementation SCMyMsgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)myMsgCellWithTabeleView:(UITableView *)tableView withObj:(SCMyMsgModel *)msgModel
{
    static NSString * idDes = @"SCMyMsgCellIDdes";
    [tableView registerClass:[SCMyMsgCell class] forCellReuseIdentifier:idDes];
    SCMyMsgCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.msgModel = msgModel;
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
    UIImageView * msgImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:msgImageView];
    self.msgImageView = msgImageView;
    msgImageView.clipsToBounds = YES;
    msgImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    UILabel * msgTypeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:msgTypeLabel];
    self.msgTypeLabel = msgTypeLabel;
    msgTypeLabel.font = [UIFont sy_boldFont16];
    msgTypeLabel.textColor = [UIColor sc_colorWith444444];
    
    UILabel * lastMsg = [[UILabel alloc] init];
    [self.contentView addSubview:lastMsg];
    self.lastMsg = lastMsg;
    lastMsg.font = [UIFont sy_font12];
    lastMsg.textColor = [UIColor sc_colorWith999999];
    
    UIView * segmentView = [[UIView alloc] init];
    [self.contentView addSubview:segmentView];
    self.segmentView = segmentView;
    segmentView.backgroundColor = [UIColor sc_colorWithF4F4F4];
    
    [self.msgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(20);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [self.msgTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.msgImageView.mas_right).with.offset(9.5);
        make.top.equalTo(self.contentView.mas_top).with.offset(19);
    }];
    
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(1);
    }];
}

+ (CGFloat)cellHeight
{
    return 80;
}

- (void)setMsgModel:(SCMyMsgModel *)msgModel
{
    _msgModel = msgModel;
    
    self.lastMsg.text = msgModel.lastMsg;
    self.msgTypeLabel.text = msgModel.msgType;
    [self.msgImageView sd_setImageWithURL:[NSURL URLWithString:msgModel.imageName] placeholderImage:[UIImage imageNamed:@""]];
    
}
@end
