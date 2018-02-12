//
//  SCManager+MBProgressHUD.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCManager+MBProgressHUD.h"
#import <MBProgressHUD.h>
@implementation SCManager (MBProgressHUD)

+ (void)dismissInfo:(NSString *)title
{
    UIWindow * window = [[[UIApplication sharedApplication] windows] firstObject];
    [MBProgressHUD hideAllHUDsForView:window animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = MBProgressHUDModeText;
    //长文本提示需要端行，不能用title
    hud.detailsLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    hud.detailsLabel.text = title;
    hud.label.font = [UIFont sy_font14];
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:1.5];
}

+ (void)showGlobalProgressHUDWithTitle:(NSString *)title
{
    UIWindow *window = [[[UIApplication sharedApplication] windows] firstObject];
    [MBProgressHUD hideAllHUDsForView:window animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.label.text = title;
    hud.label.font = [UIFont sy_font14];
    [hud showAnimated:YES];
}

+ (void)showGlobalCompleteHUDWithTitle:(NSString *)title
{
    UIWindow *window = [[[UIApplication sharedApplication] windows] firstObject];
    [MBProgressHUD hideAllHUDsForView:window animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
    hud.label.text = title;
    hud.label.font = [UIFont sy_font14];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:1];
}

+ (void)showTextHudWithTitle:(NSString *)title
{
    UIWindow *window = [[[UIApplication sharedApplication] windows] firstObject];
    [MBProgressHUD hideAllHUDsForView:window animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];hud.mode = MBProgressHUDModeText;
    hud.label.text= title;
    hud.label.font = [UIFont sy_font14];
    hud.mode = MBProgressHUDModeCustomView;
    [hud showAnimated:YES];
}

+ (void)dismissGlobalHUD
{
    UIWindow *window = [[[UIApplication sharedApplication] windows] firstObject];
    [MBProgressHUD hideHUDForView:window animated:YES];
}

+ (void)showGlobalProgressHUDForView:(UIView *)view withTitle:(NSString *)title
{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = title;
    hud.label.font = [UIFont sy_font14];
    [hud showAnimated:YES];
}

+ (void)dismissGlobalHUDForView:(UIView *)view
{
     [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
