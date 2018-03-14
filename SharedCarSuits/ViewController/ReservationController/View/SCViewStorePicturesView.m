//
//  SCViewStorePicturesView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCViewStorePicturesView.h"

@interface SCViewStorePicturesView()<UIScrollViewDelegate>
@property (nonatomic, weak) UIScrollView * pictureScrollView;
@property (nonatomic, copy) NSArray * imageArray;
@property (nonatomic, weak) UIImageView * bigImageView;
@end
@implementation SCViewStorePicturesView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.84];
        UIWindow * window = [UIApplication sharedApplication].windows.lastObject;
        [window addSubview:self];
       
    }
    return self;
}

- (void)show
{
    UIButton * deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:deleteBtn];
    [deleteBtn setImage:[UIImage imageNamed:@"title_btn_close_white"] forState:UIControlStateNormal];
  
    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-18);
        make.top.equalTo(self.mas_top).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [deleteBtn addTarget:self action:@selector(deleteBtnClick) forControlEvents:UIControlEventTouchUpInside
     ];
    
    UIImageView * bigImageView = [[UIImageView alloc] init];
    [self addSubview:bigImageView];
    self.bigImageView = bigImageView;
    bigImageView.contentMode = UIViewContentModeScaleAspectFill;
    bigImageView.clipsToBounds = YES;
    [bigImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.height.mas_equalTo(0.67*(SCREEN_WIDTH-30));
        make.bottom.equalTo(self.mas_bottom).with.offset(-SCREEN_HEIGHT * 0.38);
    }];
    //690 462
    
    UIScrollView * pictureScrollView = [[UIScrollView alloc] init];
    [self addSubview:pictureScrollView];
    self.pictureScrollView = pictureScrollView;
    pictureScrollView.delegate = self;
    [pictureScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.top.equalTo(bigImageView.mas_bottom).with.offset(15);
        make.height.mas_equalTo(60);
    }];
    
    
}

- (void)setImageArray:(NSArray *)imageArray
{
    _imageArray = imageArray;
    NSInteger pictureBtnX = 0;
    for (NSUInteger i = 0; i < imageArray.count; i++) {
        pictureBtnX = (90+10)*i;
        UIImageView * pictureImageView = [[UIImageView alloc] init];
        [self.pictureScrollView addSubview:pictureImageView];
        pictureImageView.contentMode = UIViewContentModeScaleAspectFill;
        pictureImageView.clipsToBounds = YES;
        [pictureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(90, 60));
            make.left.equalTo(self.pictureScrollView.mas_left).with.offset(pictureBtnX);
            make.top.equalTo(self.pictureScrollView.mas_top).with.offset(0);
        }];
        NSString * imageUrlString = [imageArray safeObjectAtIndex:i];
        if (i == 0) {
            [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:nil];
        }
        [pictureImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:nil];
        UIButton * pictureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.pictureScrollView addSubview:pictureBtn];
        [pictureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(90, 60));
            make.left.equalTo(self.pictureScrollView.mas_left).with.offset(pictureBtnX);
            make.top.equalTo(self.pictureScrollView.mas_top).with.offset(0);
        }];
        [pictureBtn addTarget:self action:@selector(pictureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        pictureBtn.tag = 300+i;
    }
    pictureBtnX += (90+10);
    self.pictureScrollView.contentSize = CGSizeMake(pictureBtnX, 60);
}

- (void)deleteBtnClick
{
    [self removeFromSuperview];
}

- (void)dismiss
{
   [self removeFromSuperview];
}

- (void)pictureBtnClick:(UIButton *)sender
{
    NSInteger tag = sender.tag-300;
    NSString * imageUrl = [self.imageArray safeObjectAtIndex:tag];
    [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
}

- (void)setPanorama:(NSString *)panorama
{
    _panorama = panorama;
    NSArray * imageArray = [panorama componentsSeparatedByString:@";"];
    self.imageArray = imageArray;
}
@end
