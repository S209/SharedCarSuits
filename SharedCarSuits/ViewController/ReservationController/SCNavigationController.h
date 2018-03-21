//
//  SCNavigationController.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCBaseViewController.h"
@class SCShopListModel;
@interface SCNavigationController : SCBaseViewController
@property (nonatomic, strong) SCShopListModel * listModel;
@property (nonatomic, assign) CGFloat startlat;//起点经度
@property (nonatomic, assign) CGFloat startlng;//起点维度
@end
