//
//  SCEditorOrAddCarNumberViewController.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/3.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCBaseViewController.h"
@class SCMyGarageListPageModel;
typedef NS_ENUM(NSInteger,CarNumberExcuteType){
    CarNumberExcuteTypeWithEditor = 0,
    CarNumberExcuteTypeWithAdd = 1,
};
@interface SCEditorOrAddCarNumberViewController : SCBaseViewController
@property (nonatomic, assign) CarNumberExcuteType excuteType;
@property (nonatomic, strong) SCMyGarageListPageModel * pageModel;
@end
