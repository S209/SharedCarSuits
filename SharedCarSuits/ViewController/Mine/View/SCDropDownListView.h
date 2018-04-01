//
//  SCDropDownListView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/4/1.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCCarDropDownMenuView.h"

@class SCMyGarageListPageModel;
@interface SCDropDownListView : UIView
@property (nonatomic, weak) id <SCCarDropDownMenuViewDelegate> delegate;
@property (nonatomic, strong) NSMutableArray <SCMyGarageListPageModel *> * dataArray;
- (instancetype)initWithFrame:(CGRect)frame;
@end
