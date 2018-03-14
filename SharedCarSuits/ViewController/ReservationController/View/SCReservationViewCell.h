//
//  SCReservationViewCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/17.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCShopListModel;
@protocol SCReservationViewCellDelegate<NSObject>
@required
//设置默认
- (void)reservationViewCellDefaultWithModel:(SCShopListModel *)listModel;
//查看门店信息
- (void)reservationViewCellCheckStoreInfoWithModel:(SCShopListModel *)listModel;
//导航
- (void)reservationViewCellNavigationWithModel:(SCShopListModel *)listModel;
@end
@interface SCReservationViewCell : UITableViewCell
@property (nonatomic, weak)id <SCReservationViewCellDelegate>delegate;
+ (instancetype)reservationViewCellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) SCShopListModel * shopModel;
@end
