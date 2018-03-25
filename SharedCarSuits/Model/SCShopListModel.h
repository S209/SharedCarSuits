//
//  SCShopListModel.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/4.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCShopListModel : NSObject
@property (nonatomic, copy) NSString * project;
@property (nonatomic, copy) NSString * phone;
@property (nonatomic, copy) NSString * distance;
@property (nonatomic, copy) NSString * location;
@property (nonatomic, copy) NSString * descriptionString;
@property (nonatomic, assign) NSInteger shopId;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) NSInteger ifDefault;//0 是默认
@property (nonatomic, assign) NSInteger assess;
@property (nonatomic, copy) NSString * logoUrl;
@property (nonatomic, copy) NSString * panorama;
@end
