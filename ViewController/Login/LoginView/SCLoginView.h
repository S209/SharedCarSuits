//
//  SCLoginView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCLoginViewDelegate<NSObject>
@required
- (void)loginViewLoginWithAccount:(NSString *)account password:(NSString *)password;
- (void)loginViewWithRegister;
- (void)forgetPassword;
@end
@interface SCLoginView : UIView
@property (nonatomic, weak) id <SCLoginViewDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic, assign) BOOL isHideLoginTipsImageFlag;
@end
