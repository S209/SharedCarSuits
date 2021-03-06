//
//  SCOrderDetailReservationViewCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/18.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCOrderListModel;
@interface SCOrderDetailReservationViewCell : UITableViewCell
+ (instancetype)orderDetailReservationViewCellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) SCOrderListModel * listModel;
+ (CGFloat)cellHeight;
@end
