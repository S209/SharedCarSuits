//
//  SCManager+MBProgressHUD.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCManager.h"

@interface SCManager (MBProgressHUD)
+ (void)dismissInfo:(NSString *)title;
+ (void)showGlobalProgressHUDWithTitle:(NSString *)title;
+ (void)showGlobalCompleteHUDWithTitle:(NSString *)title;
+ (void)showTextHudWithTitle:(NSString *)title;
+ (void)dismissGlobalHUD;
+ (void)showGlobalProgressHUDForView:(UIView *)view withTitle:(NSString *)title;
+ (void)dismissGlobalHUDForView:(UIView *)view;
@end
