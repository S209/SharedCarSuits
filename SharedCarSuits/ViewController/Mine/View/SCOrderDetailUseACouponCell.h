//
//  SCOrderDetailUseACouponCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/18.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCCouponModel;
@interface SCOrderDetailUseACouponCell : UITableViewCell
@property (nonatomic, strong) SCCouponModel * couponModel;
+ (instancetype)orderDetailUseACouponCellWithTabeleView:(UITableView *)tableview;
+ (CGFloat)cellHeight;

@end
