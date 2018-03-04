//
//  SCTheirOwnSheetMetalViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/24.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCTheirOwnSheetMetalViewController.h"

@interface SCTheirOwnSheetMetalViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak) UIPageControl * pageControl;
@end

@implementation SCTheirOwnSheetMetalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}
- (void)setupView
{
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 5, 0);
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-44);
        make.top.equalTo(self.view.mas_top).with.offset(0);
    }];
    CGFloat imageViewX = 0;
    for (NSUInteger i = 0; i < 5; i++) {
        imageViewX = SCREEN_WIDTH*i;
        UIImageView * imageView = [[UIImageView alloc] init];
        [scrollView addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        imageView.frame = CGRectMake(imageViewX, 0, SCREEN_WIDTH, SCREEN_HEIGHT-44-SYNavigationBarHeight-44);
    }
    
    UIPageControl * pageControl = [[UIPageControl alloc] init];
    [scrollView addSubview:pageControl];
    self.pageControl = pageControl;
    pageControl.numberOfPages = 5;
    pageControl.currentPageIndicatorTintColor = [UIColor sc_colorWith6C6DFD];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-30-44);
        make.width.mas_equalTo(72);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
    UIButton * makeAppointmentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:makeAppointmentBtn];
    [makeAppointmentBtn setTitle:@"我要预约" forState:UIControlStateNormal];
    [makeAppointmentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    makeAppointmentBtn.backgroundColor = [UIColor sc_colorWith6C6DFD];
    makeAppointmentBtn.titleLabel.font = [UIFont sy_boldFont16];
    [makeAppointmentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(44);
    }];
    [makeAppointmentBtn addTarget:self action:@selector(makeAppointmentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat page = scrollView.contentOffset.x/SCREEN_WIDTH;
    self.pageControl.currentPage = page;
}

- (void)makeAppointmentBtnClick:(UIButton *)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
