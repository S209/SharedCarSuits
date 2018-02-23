//
//  UIViewController+Utility.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kSY_DEFAULT_LEFT_MARGIN (-1)
#define kSY_DEFAULT_LEFT_SPACING (18)
#define kSY_DEFAULT_RIGHT_MARGIN (-2)
#define kSY_DEFAULT_RIGHT_SPACING (10)
@interface UIViewController (Utility)
- (void)sy_leftBarButtonItem;
- (void)sy_rightBarDeleteItemWithDelete;
@end
