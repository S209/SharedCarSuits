//
//  SCManager+CommonMethods.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCManager+CommonMethods.h"
#import <sys/utsname.h>
#import <objc/runtime.h>
#import "SCManager.h"
#import "GSKeyChain.h"
#import "SCLaunchViewController.h"
#import "AppDelegate.h"
#import <TZLocationManager.h>
#import "SCUserModel.h"
static NSString * const KEY_IN_KEYCHAIN_UUID = @"唯一识别的KEY_UUID";
static NSString * const KEY_UUID = @"唯一识别的key_uuid";
@implementation SCManager (CommonMethods)

- (void)bezierPathLeftTopAndRightTopWithView:(UIView *)view
{
    dispatch_async(dispatch_get_main_queue(), ^{
        // 处理耗时操作的代码块...
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:view.bounds.size];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = view.bounds;
        maskLayer.path = maskPath.CGPath;
        view.layer.mask = maskLayer;
    });
}

- (void)bezierPathLeftTopAndRightTopWithView:(UIView *)view withRadius:(CGFloat)radius
{
    dispatch_async(dispatch_get_main_queue(), ^{
        // 处理耗时操作的代码块...
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = view.bounds;
        maskLayer.path = maskPath.CGPath;
        view.layer.mask = maskLayer;
    });
}

- (void)countDownWithView:(UIButton *)codeButton
{
    __block int timeout= 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
                codeButton.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [codeButton setTitle:[NSString stringWithFormat:@"%@秒重发",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                codeButton.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}


- (NSString*)iphoneType
{
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString*platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    
    if([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    
    if([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    if([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    
    if([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    
    if([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    
    if([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    
    if([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    
    if([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    
    if([platform isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";
    
    if([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    
    if([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    
    if([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    
    if([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";
    
    if([platform isEqualToString:@"iPad1,1"]) return @"iPad 1G";
    
    if([platform isEqualToString:@"iPad2,1"]) return @"iPad 2";
    
    if([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    
    if([platform isEqualToString:@"iPad2,3"]) return @"iPad 2";
    
    if([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    
    if([platform isEqualToString:@"iPad2,5"]) return @"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad2,7"]) return @"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad3,1"]) return @"iPad 3";
    
    if([platform isEqualToString:@"iPad3,2"]) return @"iPad 3";
    
    if([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    
    if([platform isEqualToString:@"iPad3,4"]) return @"iPad 4";
    
    if([platform isEqualToString:@"iPad3,5"]) return @"iPad 4";
    
    if([platform isEqualToString:@"iPad3,6"]) return @"iPad 4";
    
    if([platform isEqualToString:@"iPad4,1"]) return @"iPad Air";
    
    if([platform isEqualToString:@"iPad4,2"]) return @"iPad Air";
    
    if([platform isEqualToString:@"iPad4,3"]) return @"iPad Air";
    
    if([platform isEqualToString:@"iPad4,4"]) return @"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,5"]) return @"iPad Mini 2G";

    if([platform isEqualToString:@"iPad4,6"]) return @"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,7"]) return @"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad4,8"]) return @"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad4,9"]) return @"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad5,1"]) return @"iPad Mini 4";
    
    if([platform isEqualToString:@"iPad5,2"]) return @"iPad Mini 4";
    
    if([platform isEqualToString:@"iPad5,3"]) return @"iPad Air 2";
    
    if([platform isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    
    if([platform isEqualToString:@"iPad6,3"]) return @"iPad Pro 9.7";
    
    if([platform isEqualToString:@"iPad6,4"]) return @"iPad Pro 9.7";
    
    if([platform isEqualToString:@"iPad6,7"]) return @"iPad Pro 12.9";
    
    if([platform isEqualToString:@"iPad6,8"]) return @"iPad Pro 12.9";
    
    if([platform isEqualToString:@"i386"]) return @"iPhone Simulator";
    
    if([platform isEqualToString:@"x86_64"]) return@"iPhone Simulator";
    
    return platform;
}


+(void)saveUUID:(NSString *)UUID{
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:UUID forKey:KEY_UUID];
    
    [GSKeyChain save:KEY_IN_KEYCHAIN_UUID data:usernamepasswordKVPairs];
}

+(NSString *)readUUID{
    
    NSMutableDictionary *usernamepasswordKVPair = (NSMutableDictionary *)[GSKeyChain load:KEY_IN_KEYCHAIN_UUID];
    
    return [usernamepasswordKVPair objectForKey:KEY_UUID];
    
}

+(void)deleteUUID{
    [GSKeyChain delete:KEY_IN_KEYCHAIN_UUID];
}

#pragma mark UserId
- (void)setUserUid:(NSString *)uId
{
    [[NSUserDefaults standardUserDefaults] setValue:uId forKey:SCUserId];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getUserId
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:SCUserId];
}

- (void)setSessionId:(NSString *)sessionId
{
    [[NSUserDefaults standardUserDefaults] setValue:sessionId forKey:SCSessionId];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getSessionId
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:SCSessionId];
}


+ (NSString *)getUserPassword
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:SCUserPassword];
}

- (void)setUserPassword:(NSString *)password
{
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:SCUserPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setUserLoginName:(NSString *)loginName
{
    [[NSUserDefaults standardUserDefaults] setObject:loginName forKey:SCUserLoginName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getUserLoginName
{
  return [[NSUserDefaults standardUserDefaults] objectForKey:SCUserLoginName];
}


+ (BOOL)isLogin
{
    NSString * userId =[self getUserId];
    if (userId.length) {
        return YES;
    }
    return NO;
}

+ (BOOL)hasNeedLogin
{
    BOOL flag = [[[NSUserDefaults standardUserDefaults] objectForKey:SCHasNeedLogin] boolValue];
    return flag;
}

+ (void)exit
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:SCHasNeedLogin];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[self shareInstance] setSessionId:@""];
    [[self shareInstance] setUserUid:@""];
    SCLaunchViewController * launchView = [[SCLaunchViewController alloc] init];
    UINavigationController * rootViewController = [[UINavigationController alloc] initWithRootViewController:launchView];
    [AppDelegate getAppDelegate].window.rootViewController = rootViewController;
}

- (NSString*)getPositionWithGetPositionBlock:(GetPositionBlock)getPositionBlock getGeocoderBlock:(GetGeocoderBlock)getGeocoderBlock
{
    
    [[TZLocationManager manager] startLocationWithSuccessBlock:^(CLLocation *location, CLLocation *oldLocation) {
        NSString * locationString = [NSString stringWithFormat:@"%f;%f",location.coordinate.latitude,location.coordinate.longitude];
        if (getPositionBlock) {
            getPositionBlock(locationString);
        }
    } failureBlock:^(NSError *error) {
        if (getPositionBlock) {
            NSString * locationString = @"0;0";
            if (getPositionBlock) {
                getPositionBlock(locationString);
            }
        }
    } geocoderBlock:^(NSArray *geocoderArray) {
        CLPlacemark * placeMark = [geocoderArray safeObjectAtIndex:0];
        if (getGeocoderBlock) {
            getGeocoderBlock(placeMark.subLocality);
        }
    }];
    return nil;
}

+ (SCUserModel *)getUserModel
{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:SCLoginModelUserDict];
    NSDictionary * userDict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    SCUserModel  * userModel = [SCUserModel yy_modelWithDictionary:userDict];
    return userModel;
}

+ (void)setUserModel:(SCUserModel *)userModel
{
    NSData * data = [userModel yy_modelToJSONData];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:SCLoginModelUserDict];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
