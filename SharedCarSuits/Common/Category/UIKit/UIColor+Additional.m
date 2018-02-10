//
//  UIColor+Additional.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/9.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "UIColor+Additional.h"
#import "UIColor+CDF.h"
@implementation UIColor (Additional)
+ (UIColor *)sc_colorWith282828
{
 return [self cdf_colorWithHexString:@"282828"];
}
+ (UIColor *)sc_colorWihtf8f8f8
{
   return [self cdf_colorWithHexString:@"f8f8f8"];
}
+ (UIColor *)sc_colorWith444444
{
    return [self cdf_colorWithHexString:@"444444"];
}
+ (UIColor *)sc_colorWith6C6DFD
{
    return [self cdf_colorWithHexString:@"6C6DFD"];
}
+ (UIColor *)sc_colorWithFC8739
{
    return [self cdf_colorWithHexString:@"FC8739"];
}
@end
