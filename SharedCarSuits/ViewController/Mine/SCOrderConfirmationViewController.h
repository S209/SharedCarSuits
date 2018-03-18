//
//  SCOrderConfirmationViewController.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/4.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCBaseViewController.h"
//待支付页面
@interface SCOrderConfirmationViewController : SCBaseViewController
@property (nonatomic, assign) NSInteger orderType;
@property (nonatomic, copy) NSString * createTime;
@end
