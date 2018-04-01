//
//  SCCarDropDownMenuView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/4/1.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCMyGarageListPageModel;
@interface SCCarDropDownMenuView : UIView
@property (nonatomic, strong) NSMutableArray <SCMyGarageListPageModel *> * dataArray;
- (instancetype)initWithFrame:(CGRect)frame;
@end
