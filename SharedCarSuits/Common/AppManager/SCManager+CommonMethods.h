//
//  SCManager+CommonMethods.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCManager.h"
typedef void(^GetPositionBlock)(NSString * latitudeAndLongitude);
typedef void(^GetGeocoderBlock)(NSString * geocoderString);
@interface SCManager (CommonMethods)
- (void)setUserUid:(NSString *)uId;
- (void)setSessionId:(NSString *)sessionId;
+ (NSString *)getUserId;
+ (BOOL)isLogin;
+ (void)exit;
+ (NSString *)getSessionId;
- (void)bezierPathLeftTopAndRightTopWithView:(UIView *)view;
- (void)bezierPathLeftTopAndRightTopWithView:(UIView *)view withRadius:(CGFloat)radius;
- (void)countDownWithView:(UIButton *)codeButton;
- (NSString*)iphoneType;
- (NSString*)getPositionWithGetPositionBlock:(GetPositionBlock)getPositionBlock getGeocoderBlock:(GetGeocoderBlock)getGeocoderBlock;

/**
 *   存储 UUID
 *
 *     */
+(void)saveUUID:(NSString *)UUID;

/**
 *  读取UUID *
 *
 */
+(NSString *)readUUID;

/**
 *    删除数据
 */
+(void)deleteUUID;
@end
