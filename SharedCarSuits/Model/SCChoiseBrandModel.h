//
//  SCChoiseBrandModel.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/1.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCChoiseBrandModel : NSObject
@property (nonatomic, copy) NSString * carCategoryName;
@property (nonatomic, copy) NSString * shortCut;
@property (nonatomic, assign) NSInteger carCategoryId;
@property (nonatomic, copy) NSString * logoImg;
@property (nonatomic, copy) NSString * localServerImg;
@property (nonatomic, assign) NSInteger parentId;
@property (nonatomic, assign) NSInteger carCategoryType;
@end
