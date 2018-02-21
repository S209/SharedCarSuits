//
//  SCManager+CommonMethods.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCManager.h"
#import <CoreLocation/CoreLocation.h>
@interface SCManager (CommonMethods)<CLLocationManagerDelegate>
@property (nonatomic, copy) NSString * positionString;
- (void)bezierPathLeftTopAndRightTopWithView:(UIView *)view;
- (void)bezierPathLeftTopAndRightTopWithView:(UIView *)view withRadius:(CGFloat)radius;
- (void)countDownWithView:(UIButton *)codeButton;
- (NSString*)iphoneType;
- (NSString*)getPosition;
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
