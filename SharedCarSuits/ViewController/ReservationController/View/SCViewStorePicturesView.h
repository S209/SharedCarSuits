//
//  SCViewStorePicturesView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCViewStorePicturesView : UIView
- (instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic, copy) NSString * panorama;
- (void)show;
- (void)dismiss;
@end
