//
//  SCRetrieveThePasswordView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, TypeR){
    TypeRetrieveThePassword = 0,
    TypeRegister = 1,
};
@protocol SCRetrieveThePasswordViewDelegate<NSObject>
@required
- (void)nextStep;
@end
@interface SCRetrieveThePasswordView : UIView
- (instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic, weak) id <SCRetrieveThePasswordViewDelegate> delegate;
@property (nonatomic, assign) TypeR type;
@end
