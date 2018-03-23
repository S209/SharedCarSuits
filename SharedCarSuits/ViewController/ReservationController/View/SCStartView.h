//
//  SCStartView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/2.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCStartView : UIView
//self.size = CGSizeMake(80, 25);
- (instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic, assign) BOOL startCanClick;
@property (nonatomic, weak) UILabel * evaluateLabel;
@property (nonatomic, assign) NSInteger numberOfScore;
@end
