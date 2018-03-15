//
//  SCNoPayViewController.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/26.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCBaseViewController.h"

@interface SCNoPayListViewController : SCBaseViewController
- (void)loadNewDataWithOrderState:(NSInteger)orderState createTime:(NSString *)time;
@property (nonatomic, strong) NSMutableArray * dataArray;
@end
