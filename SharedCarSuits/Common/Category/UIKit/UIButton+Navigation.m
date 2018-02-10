//
//  UIButton+Navigation.m
//  SoYoungMobile40
//
//  Created by You Tu on 15/6/8.
//  Copyright (c) 2015年 soyoung. All rights reserved.
//

#import "UIButton+Navigation.h"
//#import "UIBarButtonItem+Spacing.h"

#define kNavLeftBarItemButtonTitleFont ([UIFont sy_font15])
#define kNavRightBarItemButtonTitleFont ([UIFont sy_font15])
#define kBarButtonItemTextColor ([UIColor sy_green4Color])

@implementation UIButton (Navigation)

+ (instancetype)sy_navRightSearchBtn
{
    return [self sy_navRightButtonWithImage:[UIImage imageNamed:@"icon_search_green"]];
}

+ (instancetype)sy_navRightMoreBtn
{
    return [self sy_navRightButtonWithImage:[UIImage imageNamed:@"SYTopMoreIcon"]];
}

+ (instancetype)sy_navLeftButtonWithImage:(UIImage *)buttImg
{
    UIButton *backButton = [self buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, (44.0f - buttImg.size.height) / 2, buttImg.size.width, buttImg.size.height);
    [backButton setImage:buttImg forState:UIControlStateNormal];
    return backButton;
}

+ (instancetype)sy_navRightButtonWithImage:(UIImage *)buttImg
{
    UIButton *backButton = [self buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, (44.0f - buttImg.size.height) / 2, buttImg.size.width, buttImg.size.height);
    [backButton setImage:buttImg forState:UIControlStateNormal];
    return backButton;
}

+ (instancetype)sy_navLeftButtonWithTitle:(NSString *)title
{
    UIButton *btn = [self buttonWithType:UIButtonTypeSystem];
    btn.titleLabel.font = kNavLeftBarItemButtonTitleFont;
    [btn setFrame:CGRectMake(5.0f, 6.0f, 0, 32.0f)];
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:kNavLeftBarItemButtonTitleFont}];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:kBarButtonItemTextColor forState:UIControlStateNormal];
    
    btn.width = size.width;
    
    return btn;
}

+ (instancetype)sy_navRightButtonWithTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)color
{
    UIButton *btn = [self buttonWithType:UIButtonTypeSystem];
    btn.titleLabel.font = font;
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:font}];
    
    [btn setFrame:CGRectMake(5.0f, 6.0f, size.width, size.height+20)];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    return btn;
}

+ (instancetype)sy_navRightButtonWithTitle:(NSString *)title
{
    UIButton *btn = [self buttonWithType:UIButtonTypeSystem];
    btn.titleLabel.font = kNavRightBarItemButtonTitleFont;
    [btn setFrame:CGRectMake(5.0f, 6.0f, 0, 32.0f)];
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:kNavRightBarItemButtonTitleFont}];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:kBarButtonItemTextColor forState:UIControlStateNormal];
    
    btn.width = size.width + 10.0f;
    
    return btn;
}

+ (instancetype)sy_navRightButtonWithTitle:(NSString *)title color:(UIColor *)color
{
    UIButton *btn = [self buttonWithType:UIButtonTypeSystem];
    btn.titleLabel.font = kNavRightBarItemButtonTitleFont;
    [btn setFrame:CGRectMake(5.0f, 6.0f, 0, 32.0f)];
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont sy_font13]}];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    
    btn.width = size.width + 10.0f;
    
    return btn;
}

@end
