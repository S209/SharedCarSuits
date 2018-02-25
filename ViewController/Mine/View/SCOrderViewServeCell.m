//
//  SCOrderViewServiceCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/25.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCOrderViewServeCell.h"

@interface SCOrderViewServeCell()
@property (nonatomic, weak) UILabel * serveLabel;
@property (nonatomic, weak) UIView * segmentView;
@property (nonatomic, weak) UIScrollView * serveScrollView;
@property (nonatomic, weak) UILabel * priceLabel;
@property (nonatomic, weak) UIView * bottomSegmentView;
@end
@implementation SCOrderViewServeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//+ (instancetype)orderViewServeCellWithTableView:(UITableView *)tableView
//{
//    
//}
@end
