//
//  SCOrderDetailOrderInfoViewCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/18.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCOrderListModel;
@interface SCOrderDetailOrderInfoViewCell : UITableViewCell
+ (instancetype)orderDetailOrderInfoViewCellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) SCOrderListModel * listModel;
@property (nonatomic, assign) NSInteger orderType; //1,2,3,4
+ (CGFloat)cellHeightWithOrderType:(NSInteger)orderType;
@end
