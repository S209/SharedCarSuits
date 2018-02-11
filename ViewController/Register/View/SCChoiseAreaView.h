//
//  SCChoiseAreaView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/11.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SCChoiseAreaViewDelegate<NSObject>
@required
- (void)choiseAreaViewClickCancelBtn;
- (void)ChoiseAreaViewClickSureBtn;
- (void)ChoiseAreaViewClickItemWithContent:(NSString *)content;
@end
@interface SCChoiseAreaView : UIView
@property (nonatomic, weak) id <SCChoiseAreaViewDelegate>delegate;
@end
