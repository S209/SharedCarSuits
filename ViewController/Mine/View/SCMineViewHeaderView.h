//
//  SCMineViewHeaderView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/11.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCUserModel;
@protocol SCMineViewHeaderViewDelegate<NSObject>
@required
- (void)mineViewHeaderViewClickEditor;
- (void)mineViewHeaderMyGarage;
- (void)mineMyCoupon;
@end
@interface SCMineViewHeaderView : UIView
@property (nonatomic, weak) id <SCMineViewHeaderViewDelegate>delegate;
@property (nonatomic, strong) SCUserModel * userModel;
@end
