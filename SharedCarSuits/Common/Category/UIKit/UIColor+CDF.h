//
//  UIColor+CDF.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/9.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef struct color_rgb{
    CGFloat red;
    CGFloat green;
    CGFloat blue;
} CDFRGB;
@interface UIColor (CDF)
+ (UIColor *)cdf_colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)cdf_colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;
/** 根据rgb来创建color */
+ (UIColor *)cdf_colorWithRGB:(CDFRGB)rgb;
/** 根据rgb来创建color */
+ (UIColor *)cdf_colorWithRGB:(CDFRGB)rgb alpha:(CGFloat)alpha;
@end
