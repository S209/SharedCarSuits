//
//  SCChoiseCarNumberView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/11.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SCChoiseCarNumberViewDelegate<NSObject>
@required
- (void)choiseCarNumberViewDidCancel;
- (void)choiseCarNumberViewDidSure;
- (void)choiseCarNumberViewDidItemWithContent:(NSString *)content andIndex:(NSInteger)index;
@end
@interface SCChoiseCarNumberView : UIView
@property (nonatomic, assign) NSInteger carNumberIndex;
@property (nonatomic, weak) id <SCChoiseCarNumberViewDelegate>delegate;
@end
