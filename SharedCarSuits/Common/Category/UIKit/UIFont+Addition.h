//
//  UIFont+Addition.h
//  SoYoungMobile
//
//  Created by Levin on 10/24/13.
//  Copyright (c) 2013 Millennium Dreamworks. All rights reserved.
//
//  默认是苹方细体字体，如果要使用其他字体，需要将UILabel对象的useCustomFont属性设置为YES，再设置字体

#import <UIKit/UIKit.h>
/** 常用字体的类别 */
@interface UIFont (Addition)
/** 当前字体默认的间距 (self.lineHeight - self.pointSize) / 2 */
@property (nonatomic, assign, readonly) CGFloat sy_fontLineSpacing;

+ (UIFont *)pingfangFontOfSize:(CGFloat)fontSize;
+ (UIFont *)pingfangBoldFontOfSize:(CGFloat)fontSize;


/** 数字和价格常用的ArialMT字体 */
+ (UIFont *)sy_arialMTFontOfSize:(CGFloat)fontSize;
+ (UIFont *)sy_priceFontOfSize:(CGFloat)fontSize;
/** APP公共字体 PingFang 字体 */
+ (UIFont *)sy_pingFangSCMediumFontOfSize:(CGFloat)fontSize;
+ (UIFont *)sy_pingFangSCRegularFontOfSize:(CGFloat)fontSize;
+ (UIFont *)sy_pingFangTCSemiboldFontOfSize:(CGFloat)fontSize;
+ (UIFont *)sy_pingFangSCLightFontOfSize:(CGFloat)fontSize;

#pragma mark - 快捷
+ (UIFont *)sy_font7;
/** 苹方细体8号字体 */
+ (UIFont *)sy_font8;
/** 苹方细体9号字体 */
+ (UIFont *)sy_font9;
/** 苹方细体10号字体 */
+ (UIFont *)sy_font10;
/** 苹方细体11号字体 */
+ (UIFont *)sy_font11;
/** 苹方细体12号字体 */
+ (UIFont *)sy_font12;
/** 苹方细体13号字体 */
+ (UIFont *)sy_font13;
/** 苹方细体14号字体 */
+ (UIFont *)sy_font14;
/** 苹方细体15号字体 */
+ (UIFont *)sy_font15;
/** 苹方细体16号字体 */
+ (UIFont *)sy_font16;
/** 苹方细体17号字体 */
+ (UIFont *)sy_font17;
/** 苹方细体18号字体 */
+ (UIFont *)sy_font18;
/** 苹方细体19号字体 */
+ (UIFont *)sy_font19;
/** 苹方细体20号字体 */
+ (UIFont *)sy_font20;
/** 苹方细体22号字体 */
+ (UIFont *)sy_font22;
/** 苹方细体24号字体 */
+ (UIFont *)sy_font24;
/** 苹方细体9号字体加粗 */
+ (UIFont *)sy_boldFont9;
/** 苹方细体10号字体加粗 */
+ (UIFont *)sy_boldFont10;
/** 苹方细体11号字体加粗 */
+ (UIFont *)sy_boldFont11;
/** 苹方细体12号字体加粗 */
+ (UIFont *)sy_boldFont12;
/** 苹方细体13号字体加粗 */
+ (UIFont *)sy_boldFont13;
/** 苹方细体14号字体加粗 */
+ (UIFont *)sy_boldFont14;
/** 苹方细体15号字体加粗 */
+ (UIFont *)sy_boldFont15;
/** 苹方细体16号字体加粗 */
+ (UIFont *)sy_boldFont16;
/** 苹方细体17号字体加粗 */
+ (UIFont *)sy_boldFont17;
/** 苹方细体18号字体加粗 */
+ (UIFont *)sy_boldFont18;
/** 苹方细体19号字体加粗 */
+ (UIFont *)sy_boldFont19;
/** 苹方细体20号字体加粗 */
+ (UIFont *)sy_boldFont20;
+ (UIFont *)sy_MediumFont:(CGFloat)fontSize;
+ (UIFont *)sy_RegularFont:(CGFloat)fontSize;
+ (UIFont *)sy_SemiboldFont:(CGFloat)fontSize;
+ (UIFont *)sy_LightFont:(CGFloat)fontSize;

@end
