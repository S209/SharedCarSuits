//
//  SCDeviceConst.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/9.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#ifndef SCDeviceConst_h
#define SCDeviceConst_h
#define SCREEN_WIDTH  [[UIScreen mainScreen] applicationFrame].size.width    //屏幕宽
#define SCREEN_HEIGHT [[UIScreen mainScreen] applicationFrame].size.height   //屏幕高，去除状态栏
#define NAVIGATIONBAR_HEIGHT 44 //导航条高
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
//#define IS_IPHONE_5      ([UIScreen mainScreen].bounds.size.height == 568)
#define IS_IPHONE_6      ([UIScreen mainScreen].bounds.size.height == 667)
#define IS_IPHONE_6P ([UIScreen mainScreen].bounds.size.height == 736)
#define IS_IPHONE_X      ([UIScreen mainScreen].bounds.size.height == 812)
#define SYStatusBarHeight (IS_IPHONE_X?44:20)
#define SYNavigationBarHeight (SYStatusBarHeight + 44)
#define SYTabBarHeight (IS_IPHONE_X?83:49)
#define SYTabBarSpacingBottom (IS_IPHONE_X?34:0)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#endif /* SCDeviceConst_h */
