//
//  SCNavigationDetailsPageView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/21.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCReservationViewCell.h"
@class SCShopListModel;
@interface SCNavigationDetailsPageView : UIView
@property (nonatomic, weak) id <SCReservationViewCellDelegate>delegate;
@property (nonatomic, strong) SCShopListModel * shopModel;
- (instancetype)initWithFrame:(CGRect)frame;
@end
