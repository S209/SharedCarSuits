//
//  SCEditorIconView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCEditorIconView.h"
#import "SCManager+CommonMethods.h"
@implementation SCEditorIconView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        btn.frame = self.bounds;
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside
         ];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.37];
        UIWindow * window = [[UIApplication sharedApplication].windows  lastObject];
        [window addSubview:self];
    }
    return self;
}

- (void)show
{
    UIView * tipView = [[UIView alloc] init];
    [self addSubview:tipView];
    [tipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(153);
    }];
    
    UILabel * exitLabel = [[UILabel alloc] init];
    [tipView addSubview:exitLabel];
    exitLabel.backgroundColor = [UIColor whiteColor];
    exitLabel.text = @"选择方式";
    exitLabel.font = [UIFont sy_boldFont16];
    exitLabel.textColor = [UIColor sc_colorWith444444];
    exitLabel.textAlignment = NSTextAlignmentCenter;
    [exitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tipView.mas_left).with.offset(0);
        make.right.equalTo(tipView.mas_right).with.offset(-0);
        make.top.equalTo(tipView.mas_top).with.offset(0);
        make.height.mas_equalTo(50);
    }];
    
    [[SCManager shareInstance] bezierPathLeftTopAndRightTopWithView:exitLabel withRadius:5];
    
    UIView * segmentView = [[UIView alloc] init];
    [tipView addSubview:segmentView];
    segmentView.backgroundColor = [UIColor sc_colorWihtf8f8f8];
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tipView.mas_left).with.offset(0);
        make.top.equalTo(exitLabel.mas_bottom).with.offset(0);
        make.right.equalTo(tipView.mas_right).with.offset(-0);
        make.height.mas_equalTo(5);
    }];
    
    NSArray * tipsArray = @[@"拍照",@"从手机相册选择"];
    CGFloat topY= 0;
    for (NSUInteger i = 0; i < 2; i++) {
        topY = i * 50;
        UILabel * exitInfoLabel = [[UILabel alloc] init];
        exitInfoLabel.backgroundColor = [UIColor whiteColor];
        [tipView addSubview:exitInfoLabel];
        [exitInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(tipView.mas_left).with.offset(0);
            make.right.equalTo(tipView.mas_right).with.offset(-0);
            make.top.equalTo(segmentView.mas_bottom).with.offset(topY);
            make.height.mas_equalTo(50);
        }];
        
        
        UIButton  * exitInfoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [tipView addSubview:exitInfoBtn];
        [exitInfoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(tipView.mas_left).with.offset(0);
            make.right.equalTo(tipView.mas_right).with.offset(-0);
            make.top.equalTo(segmentView.mas_bottom).with.offset(topY);
            make.height.mas_equalTo(50);
        }];
        [exitInfoBtn addTarget:self action:@selector(exitInfoClick:) forControlEvents:UIControlEventTouchUpInside];
        exitInfoBtn.tag = 200+i;
        
        if (i == 0) {
            UIView * segmentView = [[UIView alloc] init];
            [tipView addSubview:segmentView];
            [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(tipView.mas_left).with.offset(0);
                make.right.equalTo(tipView.mas_right).with.offset(-0);
                make.top.equalTo(exitInfoLabel.mas_bottom).with.offset(50);
                make.height.mas_equalTo(0.5);
            }];
            segmentView.backgroundColor = [UIColor sc_colorWihtf8f8f8];
        }
        exitInfoLabel.text = [tipsArray safeObjectAtIndex:i];
        exitInfoLabel.textColor = [UIColor sc_colorWith999999];
        exitInfoLabel.textAlignment = NSTextAlignmentCenter;
        exitInfoLabel.font = [UIFont sy_font14];
    }
}

- (void)exitInfoClick:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    if (tag == 200) {
        //拍照
        if ([_delegate respondsToSelector:@selector(editorIconType:)]) {
            [self.delegate editorIconType:TypeImageViewTakeAPhoto];
        }
    }else{
        //从手机相册选择
        [self.delegate editorIconType:TypeImageViewPhoneAlbumSelected];
    }
}


- (void)diss
{
    [self removeFromSuperview];
}

- (void)btnClick
{
    [self diss];
}
@end

