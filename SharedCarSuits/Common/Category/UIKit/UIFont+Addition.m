//
//  UIFont+Addition.m
//  SoYoungMobile
//
//  Created by Levin on 10/24/13.
//  Copyright (c) 2013 Millennium Dreamworks. All rights reserved.
//

#import "UIFont+Addition.h"


@implementation UIFont (Addition)

- (CGFloat)sy_fontLineSpacing
{
    return (self.lineHeight - self.pointSize) / 2;
}

+ (UIFont *)pingfangFontOfSize:(CGFloat)fontSize
{
    return [self sy_pingFangSCLightFontOfSize:fontSize];
}

+ (UIFont *)pingfangBoldFontOfSize:(CGFloat)fontSize
{
    return [self sy_pingFangSCMediumFontOfSize:fontSize];
}

+ (UIFont *)sy_priceFontOfSize:(CGFloat)fontSize {
    return [self sy_arialMTFontOfSize:fontSize];
}

+ (UIFont *)sy_arialMTFontOfSize:(CGFloat)fontSize {
    return [self fontWithName:kSYFontArialMT size:fontSize];
}

+ (UIFont *)sy_pingFangSCRegularFontOfSize:(CGFloat)fontSize {
    UIFont * font = [UIFont fontWithName:kSYFontPingFangSCRegular size:fontSize];
    if (font == nil) {
        font = [UIFont systemFontOfSize:fontSize];
    }
    return font;
}

+ (UIFont *)sy_pingFangTCSemiboldFontOfSize:(CGFloat)fontSize {
    UIFont * font = [UIFont fontWithName:kSYFontPingFangSCSemibold size:fontSize];
    if (font == nil) {
        font = [UIFont systemFontOfSize:fontSize];
    }
    return font;
}
+ (UIFont *)sy_pingFangSCMediumFontOfSize:(CGFloat)fontSize {
    UIFont * font = [UIFont fontWithName:kSYFontPingFangSCMedium size:fontSize];
    if (font == nil) {
        font = [UIFont systemFontOfSize:fontSize];
    }
    return font;
}

+ (UIFont *)sy_pingFangSCLightFontOfSize:(CGFloat)fontSize {
    UIFont * font = [UIFont fontWithName:kSYFontPingFangSCLight size:fontSize];
    if (font == nil) {
        font = [UIFont systemFontOfSize:fontSize];
    }
    return font;
}

+ (UIFont *)sy_font8 {
    return [self pingfangFontOfSize:8];
}
+ (UIFont *)sy_font9 {
    return [self pingfangFontOfSize:9];
}
+ (UIFont *)sy_font10 {
    return [self pingfangFontOfSize:10];
}
+ (UIFont *)sy_font11 {
    return [self pingfangFontOfSize:11];
}
+ (UIFont *)sy_font12 {
    return [self pingfangFontOfSize:12];
}
+ (UIFont *)sy_font13 {
    return [self pingfangFontOfSize:13];
}
+ (UIFont *)sy_font14 {
    return [self pingfangFontOfSize:14];
}
+ (UIFont *)sy_font15 {
    return [self pingfangFontOfSize:15];
}
+ (UIFont *)sy_font16 {
    return [self pingfangFontOfSize:16];
}
+ (UIFont *)sy_font17 {
    return [self pingfangFontOfSize:17];
}
+ (UIFont *)sy_font18 {
    return [self pingfangFontOfSize:18];
}
+ (UIFont *)sy_font19 {
    return [self pingfangFontOfSize:19];
}
+ (UIFont *)sy_font20 {
    return [self pingfangFontOfSize:20];
}
+ (UIFont *)sy_font22 {
    return [self pingfangFontOfSize:22];
}
+ (UIFont *)sy_font24 {
    return [self pingfangFontOfSize:24];
}


+ (UIFont *)sy_boldFont9 {
    return [self pingfangBoldFontOfSize:9];
}
+ (UIFont *)sy_boldFont10 {
    return [self pingfangBoldFontOfSize:10];
}
+(UIFont *)sy_boldFont11 {
    return [self pingfangBoldFontOfSize:11];
}
+ (UIFont *)sy_boldFont12 {
    return [self pingfangBoldFontOfSize:12];
}
+ (UIFont *)sy_boldFont13 {
    return [self pingfangBoldFontOfSize:13];
}
+ (UIFont *)sy_boldFont14 {
    return [self pingfangBoldFontOfSize:14];
}
+ (UIFont *)sy_boldFont15 {
    return [self pingfangBoldFontOfSize:15];
}
+ (UIFont *)sy_boldFont16 {
    return [self pingfangBoldFontOfSize:16];
}
+ (UIFont *)sy_boldFont17 {
    return [self pingfangBoldFontOfSize:17];
}
+ (UIFont *)sy_boldFont18 {
    return [self pingfangBoldFontOfSize:18];
}
+ (UIFont *)sy_boldFont19 {
    return [self pingfangBoldFontOfSize:19];
}
+ (UIFont *)sy_boldFont20 {
    return [self pingfangBoldFontOfSize:20];
}
+ (UIFont *)sy_RegularFont:(CGFloat)fontSize
{
    return [self sy_pingFangSCRegularFontOfSize:fontSize];
}
+ (UIFont *)sy_MediumFont:(CGFloat)fontSize{
    return [self pingfangBoldFontOfSize:fontSize];
}
+ (UIFont *)sy_SemiboldFont:(CGFloat)fontSize{
    return [self sy_pingFangTCSemiboldFontOfSize:fontSize];
}
+ (UIFont *)sy_LightFont:(CGFloat)fontSize{
    return [self sy_pingFangSCLightFontOfSize:fontSize];
}
@end
