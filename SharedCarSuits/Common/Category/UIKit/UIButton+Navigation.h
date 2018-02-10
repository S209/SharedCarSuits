//
//  UIButton+Navigation.h
//  SoYoungMobile40
//
//  Created by You Tu on 15/6/8.
//  Copyright (c) 2015年 soyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Navigation)

+ (instancetype)sy_navLeftButtonWithImage:(UIImage *)buttImg;
+ (instancetype)sy_navRightButtonWithImage:(UIImage *)buttImg;
+ (instancetype)sy_navRightButtonWithTitle:(NSString *)title;
+ (instancetype)sy_navLeftButtonWithTitle:(NSString *)title;
+ (instancetype)sy_navRightButtonWithTitle:(NSString *)title color:(UIColor *)color;
+ (instancetype)sy_navRightButtonWithTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)color;
/// 右上角的搜索按钮
+ (instancetype)sy_navRightSearchBtn;
+ (instancetype)sy_navRightMoreBtn;

@end

