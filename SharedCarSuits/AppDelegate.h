//
//  AppDelegate.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/1/29.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCUserModel;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, copy) NSString * latitudeAndLongitude;
@property (nonatomic, strong) SCUserModel * userModel;
@property (strong, nonatomic) UIWindow *window;
+ (AppDelegate *)getAppDelegate;
@end

