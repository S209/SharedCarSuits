//
//  SCOrderConfirmationViewController.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/4.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCBaseViewController.h"
//待支付页面
@class SCOrderListModel,SCOrderInfoModel;
@interface SCOrderConfirmationViewController : SCBaseViewController
@property (nonatomic, assign) NSInteger orderType;
@property (nonatomic, strong) SCOrderInfoModel * infoModel;
@property (nonatomic, strong) SCOrderListModel * listModel;
@property (nonatomic, strong) NSArray <SCOrderListModel *> * listArray;
@end
