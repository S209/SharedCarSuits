//
//  SCNetworkMultiDataObj.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/14.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCNetworkMultiDataObj : NSObject
@property (nonatomic, copy) NSString *name;
//default： file.jpg
@property (nonatomic, copy) NSString* fileName;
//default： image/jpg
@property (nonatomic, copy) NSString* mimeType;

@property (nonatomic, copy) NSString* filePath;
@property (nonatomic, strong) NSData* data;

//@property (nonatomic, copy) NSArray* datas;
@end
