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
+ (UIColor *)sy_green4Color
{
    return [self cdf_colorWithHexString:@"#2CC7C5"];
}
+ (UIColor *)sc_colorWithF8F8F8
{
     return [self cdf_colorWithHexString:@"#F8F8F8"];
}
+ (UIColor *)sc_colorWith666666
{
  return [self cdf_colorWithHexString:@"#666666"];
}

+ (UIColor *)sc_colorWith999999
{
  return [self cdf_colorWithHexString:@"#999999"];
}

+ (UIColor *)sc_colorWithe5e5e5
{
    return [self cdf_colorWithHexString:@"#e5e5e5"];
}
+ (UIColor *)sc_colorWith6162e3
{
   return [self cdf_colorWithHexString:@"#6162e3"];
}
@end
