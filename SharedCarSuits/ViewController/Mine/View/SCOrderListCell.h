//
//  SCOrderListCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/26.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, OrderType){
    OrderTypeNoPay = 1,
    OrderTypePayed = 2,
    OrderTypeComplete = 3,
    OrderTypeCancel = 4,
};
@class SCOrderListModel;
@interface SCOrderListCell : UITableViewCell
+ (instancetype)orderListCellWithTableView:(UITableView *)tableView  orderType:(OrderType)orderTyp;
+ (CGFloat)cellHeightWithOrderType:(OrderType)orderType;
@property (nonatomic, strong) SCOrderListModel * listModel;
@end
