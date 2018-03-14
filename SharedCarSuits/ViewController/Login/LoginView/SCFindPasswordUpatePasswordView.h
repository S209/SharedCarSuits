//
//  SCFindPasswordUpatePasswordView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, UpdateType){
    UpdateTypePassword = 0,
    UpdateTypeRegister = 1,
};
@protocol SCFindPasswordUpatePasswordViewDelegate<NSObject>
@required
- (void)completeWithPassword:(NSString *)password;
@end
@interface SCFindPasswordUpatePasswordView : UIView
@property (nonatomic, weak) id <SCFindPasswordUpatePasswordViewDelegate>deleate;
@property (nonatomic, assign) UpdateType update;
@end
