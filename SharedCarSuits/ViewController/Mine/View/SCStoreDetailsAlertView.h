//
//  SCStoreDetailsAlertView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/24.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kGaoDeMapPathHost @"iosamap://path"
#define kBaiDuMapPathHost @"baidumap://map/direction"
#define kQQMaoPathHost @"qqmap://"
#define kAppleMapPathHost @"apple_map"
typedef void (^MapClickBlock)(NSString * mapPathHost);
@interface SCStoreDetailsAlertView : UIView
@property (nonatomic, copy) MapClickBlock mapClickBlock;
- (void)showWithMapClick:(MapClickBlock)clickBlock;
- (void)diss;
@end
