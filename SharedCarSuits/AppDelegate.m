//
//  AppDelegate.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/1/29.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//
#import <Bugly/Bugly.h>
#import "AppDelegate.h"
#import "SCLaunchViewController.h"
#import "SCManager+CommonMethods.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
     [AMapServices sharedServices].apiKey = @"abf3b0e0c1ef6061e3e55c89d939a53b";
    [Bugly startWithAppId:@"a09e5cdc70"];
    [[SCManager shareInstance] getPositionWithGetPositionBlock:^(NSString *latitudeAndLongitude) {
        self.latitudeAndLongitude = latitudeAndLongitude;
    } getGeocoderBlock:^(NSString *geocoderString) {
        
    }];
    
    
    
    SCLaunchViewController * launchView = [[SCLaunchViewController alloc] init];
    UINavigationController * rootViewController = [[UINavigationController alloc] initWithRootViewController:launchView];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = rootViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

+ (AppDelegate *)getAppDelegate
{
    return (id)[[UIApplication sharedApplication] delegate];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
