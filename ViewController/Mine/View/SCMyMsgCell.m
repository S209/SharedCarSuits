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
    
}

+ (CGFloat)cellHeight
{
    return 80;
}

@end
