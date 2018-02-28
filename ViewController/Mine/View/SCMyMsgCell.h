//
//  SCMyMsgCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/28.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCMyMsgModel;
@interface SCMyMsgCell : UITableViewCell
+ (instancetype)myMsgCellWithTabeleView:(UITableView *)tableView withObj:(SCMyMsgModel *)msgModel;
+ (CGFloat)cellHeight;
@end
