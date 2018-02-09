//
//  UIColor+CDF.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/9.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "UIColor+CDF.h"

@implementation UIColor (CDF)
+ (UIColor *)cdf_colorWithHexString:(NSString *)stringToConvert
{
    return [self cdf_colorWithHexString:stringToConvert alpha:1.0f];
}
+ (UIColor *)cdf_colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha
{
    @try {
        NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        
        // String should be 6 or 8 characters
        if ([cString length] < 6) return [UIColor blackColor];
        
        // strip 0X if it appears
        if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
        if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
        if ([cString length] < 6) return [UIColor blackColor];
        // Separate into r, g, b substrings
        NSRange range;
        if ([cString length] > 6) {
            range.location = 2;
        }else {
            range.location = 0;
        }
        
        range.length = 2;
        NSString *rString = [cString substringWithRange:range];
        
        range.location += 2;
        NSString *gString = [cString substringWithRange:range];
        
        range.location += 2;
        NSString *bString = [cString substringWithRange:range];
        
        unsigned int r, g, b ;
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        
        return [UIColor colorWithRed:((float) r / 255.0f)
                               green:((float) g / 255.0f)
                                blue:((float) b / 255.0f)
                               alpha:alpha];
    } @catch (NSException * ex) {
        return [UIColor blackColor];
    }
}

/** 根据rgb来创建color */
+ (UIColor *)cdf_colorWithRGB:(CDFRGB)rgb
{
   return [self cdf_colorWithRGB:rgb alpha:1];
}

/** 根据rgb来创建color */
+ (UIColor *)cdf_colorWithRGB:(CDFRGB)rgb alpha:(CGFloat)alpha
{
       return [UIColor colorWithRed:rgb.red green:rgb.green blue:rgb.blue alpha:alpha];
}

- (CDFRGB)rgb
{
    CGFloat components[3];
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[4];
    CGContextRef context = CGBitmapContextCreate(&resultingPixel,
                                                 1,
                                                 1,
                                                 8,
                                                 4,
                                                 rgbColorSpace,
                                                 kCGImageAlphaNoneSkipLast);
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);
    
    for (int component = 0; component < 3; component++) {
        components[component] = resultingPixel[component] / 255.0f;
    }
    CDFRGB rgb;
    rgb.red = components[0];
    rgb.green = components[1];
    rgb.blue = components[2];
    return rgb;
}


@end
