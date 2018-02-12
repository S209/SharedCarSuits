//
//  SCManager+Keyboard.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCManager.h"
typedef void (^keyboardShowBlock)(NSNotification *notification);
typedef void (^keyboardHideBlock)(NSNotification *notification);
@interface SCManager (Keyboard)
- (void)setUpKeyboardShowBlock:(keyboardShowBlock)showBlock hideBlock:(keyboardHideBlock)hideBlock;
@end
