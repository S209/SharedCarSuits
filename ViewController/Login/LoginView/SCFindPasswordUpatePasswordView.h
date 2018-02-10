//
//  SCFindPasswordUpatePasswordView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCFindPasswordUpatePasswordViewDelegate<NSObject>
@required
- (void)complete;
@end
@interface SCFindPasswordUpatePasswordView : UIView
@property (nonatomic, weak) id <SCFindPasswordUpatePasswordViewDelegate>deleate;
@end
