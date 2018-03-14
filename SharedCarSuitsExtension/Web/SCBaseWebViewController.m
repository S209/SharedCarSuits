//
//  SCBaseWebViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/14.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCBaseWebViewController.h"
@interface SCBaseWebViewController ()<WKNavigationDelegate>

@end

@implementation SCBaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView
{
    WKWebView * wkWbView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:wkWbView];
    self.wkWbView = wkWbView;
    wkWbView.navigationDelegate = self;
}

#pragma mark 

- (void)registerJSMethod:(NSString *)methodName completionHandler:(SCWebHandler)handler{
    [self.bridge registerHandler:methodName handler:^(id data, WVJBResponseCallback responseCallback) {
        if (handler) {
            handler(data, responseCallback);
        }
    }];
}

- (void)callJSMethod:(NSString *)methodName data:(id)data responseCallback:(SCWebResponseCallback)responseCallback; {
    [self.bridge callHandler:methodName data:data responseCallback:^(id responseData) {
        if (responseCallback) {
            responseCallback(responseData);
        }
    }];
}

- (void)callJSMethod:(NSString *)methodName data:(id)data {
    [self callJSMethod:methodName data:data responseCallback:nil];
}

- (void)callJSMethod:(NSString *)methodName {
    [self callJSMethod:methodName data:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
