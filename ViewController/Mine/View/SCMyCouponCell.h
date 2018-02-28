//
//  SCMyCouponCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/28.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCCouponModel;
@interface SCMyCouponCell : UITableViewCell
+ (instancetype)myCouponCellWithTableView:(UITableView *)tableView andObj:(SCCouponModel *)model;
+ (CGFloat)cellHeight;
@end
