//
//  SCReceiveTableViewCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/28.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCCouponModel;
typedef NS_ENUM(NSInteger, SCCouponType){
    SCCouponTypeWithReceive = 0,
    SCCouponTypeWithMyCoupon =1,
};
@protocol SCReceiveTableViewCellDelegate<NSObject>
@required
- (void)receiveCouponWithCouponModel:(SCCouponModel *)model;
@end
@interface SCReceiveTableViewCell : UITableViewCell
@property (nonatomic, assign) SCCouponType couponType;
@property (nonatomic, weak) id <SCReceiveTableViewCellDelegate>delegate;
+ (instancetype)receiveTableViewCellWithTableView:(UITableView *)tableView andObj:(SCCouponModel *)model;
+ (CGFloat)cellHeight;
@end
