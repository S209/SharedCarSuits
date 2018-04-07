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
//@property (nonatomic, strong) SCOrderInfoModel * infoModel;
@property (nonatomic, strong) SCOrderListModel * listModel;
@end
