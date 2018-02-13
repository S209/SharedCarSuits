//
//  SCMineViewHeaderView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/11.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCMineViewHeaderViewDelegate<NSObject>
@required
- (void)mineViewHeaderViewClickEditor;
- (void)mineViewHeaderMyGarage;
@end
@interface SCMineViewHeaderView : UIView
@property(nonatomic, weak) id <SCMineViewHeaderViewDelegate>delegate;
@end
