//
//  SCDIYHeader.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/27.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCDIYHeader.h"

@interface SCDIYHeader()
@property (nonatomic, weak) UIImageView * loadImageView;
@end
@implementation SCDIYHeader

- (void)prepare
{
    [super prepare];
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=8; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_img_%zd", i]];
        [idleImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStateRefreshing];
    self.stateLabel.hidden = YES;
    self.lastUpdatedTimeLabel.hidden = YES;
}

@end
