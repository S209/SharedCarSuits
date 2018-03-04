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
        CGFloat startX = 0;
        for (NSUInteger i = 0; i < 5; i++) {
            UIImageView * imageViewNormal = [[UIImageView alloc] init];
            [self addSubview:imageViewNormal];
            [imageViewNormal setImage:[UIImage imageNamed:@"setting_ico_star_normal"]];
            imageViewNormal.tag = 300 +i;
            
            startX = (15.5 + 5)*i;
            [imageViewNormal mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(15.5, 15));
                make.left.equalTo(self.mas_left).with.offset(startX);
                make.top.equalTo(self.mas_top).with.offset(0);
            }];
        }
        
        UILabel * evaluateLabel = [[UILabel alloc] init];
        [self addSubview:evaluateLabel];
        self.evaluateLabel = evaluateLabel;
        [evaluateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(startX+15.5+5);
            make.top.equalTo(self.mas_top).with.offset(0);
        }];
        
    }
    return self;
}

- (void)setNumberOfScore:(NSInteger)numberOfScore
{
    _numberOfScore = numberOfScore;
   NSInteger normalScore = 5-numberOfScore;
    for (NSUInteger i = 0; i < normalScore; i++) {
        UIImageView * imageViewSelect = (UIImageView *)[self viewWithTag:300+i];
        [imageViewSelect setImage:[UIImage imageNamed:@"setting_ico_star_selcted"]];
    }
    NSString * contentString ;
    switch (numberOfScore) {
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
@end
