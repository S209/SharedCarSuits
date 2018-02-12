//
//  SCManager+Keyboard.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCManager+Keyboard.h"
#import <objc/runtime.h>
@interface SCManager()
@property (nonatomic, copy) keyboardShowBlock showBlock;
@property (nonatomic, copy) keyboardHideBlock hideBlock;
@end
@implementation SCManager (Keyboard)
- (void)setUpKeyboardShowBlock:(keyboardShowBlock)showBlock hideBlock:(keyboardHideBlock)hideBlock
{
    self.showBlock = showBlock;
    self.hideBlock = hideBlock;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}


- (void)keyboardWillShow:(NSNotification *)notific
{
    if (self.showBlock) {
        self.showBlock(notific);
    }
    
}

- (void)keyboardWillHide:(NSNotification *)notific
{
    if (self.hideBlock) {
        self.hideBlock(notific);
    }
}

- (keyboardHideBlock)showBlock
{
      return objc_getAssociatedObject(self, @"keyboardHideBlock");
}

- (void)setShowBlock:(keyboardShowBlock)showBlock
{
    objc_setAssociatedObject(self, @"keyboardShowBlock", showBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (keyboardHideBlock)hideBlock
{
     return objc_getAssociatedObject(self, @"keyboardHideBlock");
}

- (void)setHideBlock:(keyboardHideBlock)hideBlock
{
    objc_setAssociatedObject(self, @"keyboardHideBlock", hideBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);

}
@end
