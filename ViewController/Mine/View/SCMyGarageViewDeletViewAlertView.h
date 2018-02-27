//
//  SCMyGarageViewDeletViewAlertView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SCMyGarageViewDeletViewAlertViewDelegate<NSObject>
@required
- (void)deleteCarInfo;
@end
@interface SCMyGarageViewDeletViewAlertView : UIView
@property (nonatomic, weak) id <SCMyGarageViewDeletViewAlertViewDelegate>delegate;
- (void)showWithCarName:(NSString *)carName;
- (void)diss;
@end
