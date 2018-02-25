//
//  SCLoginResponseObjectModel.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/24.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCLoginResponseObjectModel : NSObject
@property (nonatomic, copy) NSString * message;
@property (nonatomic, copy) NSString * sessionId;
@property (nonatomic, copy) NSString * uId;
@end
