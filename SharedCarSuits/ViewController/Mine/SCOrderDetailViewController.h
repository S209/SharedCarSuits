//
//  SCOrderDetailViewController.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/19.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCBaseViewController.h"
@class SCOrderListModel;
@interface SCOrderDetailViewController : SCBaseViewController
@property (nonatomic, assign)NSInteger OrderType;
@property (nonatomic, strong) SCOrderListModel * listModel;
@end
