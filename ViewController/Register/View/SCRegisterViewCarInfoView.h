//
//  SCRegisterViewCarInfoView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCRegisterViewCarInfoViewDelegate<NSObject>
@required
- (void)carNumberBtnClickWithIndex:(NSInteger)index;
- (void)sureBtnClick;
@end
@interface SCRegisterViewCarInfoView : UIView
@property (nonatomic, weak) id <SCRegisterViewCarInfoViewDelegate>delegate;
@end