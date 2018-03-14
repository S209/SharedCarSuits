//
//  SCRegisterViewCarInfoView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCMyGarageListPageModel;
@protocol SCRegisterViewCarInfoViewDelegate<NSObject>
@required
- (void)carNumberBtnClickWithIndex:(NSInteger)index;
- (void)sureBtnClick;
- (void)choiseBrandLabelClick;
@end
@interface SCRegisterViewCarInfoView : UIView
@property (nonatomic, weak) id <SCRegisterViewCarInfoViewDelegate>delegate;
@property (nonatomic, strong) SCMyGarageListPageModel * pageModel;
- (void)updateCarInfoWithInfo:(NSString *)info andIndex:(NSInteger)index btnClickState:(BOOL)flag;
- (void)updateCarName:(NSString *)carName;

@end
