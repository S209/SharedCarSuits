//
//  SCUserModel.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/25.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SCMyGarageListPageModel;
@interface SCUserModel : NSObject
@property (nonatomic, copy) NSString * realName;
@property (nonatomic, copy) NSString * headUrl;
@property (nonatomic, copy) NSString * loginName;
@property (nonatomic, copy) NSString * shopId;//默认ID
@property (nonatomic, assign) NSInteger ifVIP;
@property (nonatomic, copy) NSArray <SCMyGarageListPageModel *> * cars;
@end
