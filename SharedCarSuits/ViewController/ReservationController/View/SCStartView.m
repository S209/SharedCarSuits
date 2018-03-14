//
//  SCStartView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/2.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCStartView.h"

@implementation SCStartView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews
     ];
   self.size = CGSizeMake(80, 25);

    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    CGFloat startX = 0;
    for (NSUInteger i = 0; i < 5; i++) {
        UIImageView * imageViewNormal = [[UIImageView alloc] init];
        [self addSubview:imageViewNormal];
        if (i < self.numberOfScore) {
             [imageViewNormal setImage:[UIImage imageNamed:@"setting_ico_star_selcted"]];
        }else{
           [imageViewNormal setImage:[UIImage imageNamed:@"setting_ico_star_normal"]];
        }
    
        startX = (15.5 + 5)*i;
        [imageViewNormal mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(15.5, 15));
            make.left.equalTo(self.mas_left).with.offset(startX);
            make.top.equalTo(self.mas_top).with.offset(0);
        }];
    }
    
    UILabel * evaluateLabel = [[UILabel alloc] init];
    [self addSubview:evaluateLabel];
    evaluateLabel.hidden = YES;
    self.evaluateLabel = evaluateLabel;
    [evaluateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(startX+15.5+5);
        make.top.equalTo(self.mas_top).with.offset(0);
    }];

    NSString * contentString ;
    switch (self.numberOfScore) {
        case 5:
        {
            contentString = @"非常好";
            break;
        }case 4:
        {
            contentString = @"好";
            break;
        }case 3:
        {
            contentString = @"一般";
            break;
        }case 2:
        {
            contentString = @"非常差";
            break;
        }
        default: contentString = @"";
            break;
    }
    self.evaluateLabel.text = contentString;
}


- (void)setNumberOfScore:(NSInteger)numberOfScore
{
    _numberOfScore = numberOfScore;
  
}
@end
