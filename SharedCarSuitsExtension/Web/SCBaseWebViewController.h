//
//  SCBaseWebViewController.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/14.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCBaseViewController.h"
#import <WKWebViewJavascriptBridge.h>
typedef void(^SCWebHandler)(id data, WVJBResponseCallback responseCallback);
typedef void(^SCWebResponseCallback)(id responseData);
@interface SCBaseWebViewController : SCBaseViewController
@property (nonatomic, weak) WKWebView * wkWbView;
@property (nonatomic, strong) WKWebViewJavascriptBridge *bridge;
- (void)registerJSMethod:(NSString *)methodName completionHandler:(SCWebHandler)handler;
- (void)callJSMethod:(NSString *)methodName data:(id)data responseCallback:(SCWebResponseCallback)responseCallback;
- (void)callJSMethod:(NSString *)methodName;
- (void)callJSMethod:(NSString *)methodName data:(id)data;
@end
