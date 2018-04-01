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
    [self setupWkWbView];
}

- (void)setupWkWbView
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

#pragma mark - WKNavigationDelegate
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView
{
    [webView reload];
}

- (void)webView:(UIWebView*)webView DidFailLoadWithError:(NSError*)error
{
    
}

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSString * title = webView.title;
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    self.title = webView.title;
//    if (webView.title.length == 0) {
//        [webView reload];
//    }
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{

}

- (void)webView:(WKWebView *)webView
didReceiveServerRedirectForProvisionalNavigation:
(null_unspecified WKNavigation *)navigation {
    
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
