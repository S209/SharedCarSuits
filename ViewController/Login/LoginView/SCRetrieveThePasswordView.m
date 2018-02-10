//
//  SCRetrieveThePasswordView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCRetrieveThePasswordView.h"

@implementation SCRetrieveThePasswordView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    self.size = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    
    UILabel * phoneNumberLabel = [[UILabel alloc] init];
    [self addSubview:phoneNumberLabel];
    phoneNumberLabel mas_ma
    
}
@end
