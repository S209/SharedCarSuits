//
//  SCOrderDetailServiceNameViewCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/18.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCOrderListModel;
@interface SCOrderDetailServiceNameViewCell : UITableViewCell
@property (nonatomic, strong) SCOrderListModel * listModel;
+ (instancetype)orderDetailServiceNameViewCellWithTableView:(UITableView *)tableView;
+ (CGFloat)cellHeight;
@end
