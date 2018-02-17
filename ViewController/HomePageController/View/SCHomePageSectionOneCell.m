//
//  SCHomePageSectionOneCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCHomePageSectionOneCell.h"

@interface SCHomePageSectionOneCell()
@property (nonatomic, weak) UIImageView * advertisingImgView;
@end
@implementation SCHomePageSectionOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)homePageSectionOneWithTableView:(UITableView *)tableView
{
    static NSString * idDes = @"SCHomePageSectionOneCellIDdes";
    [tableView registerClass:[SCHomePageSectionOneCell class] forCellReuseIdentifier:idDes];
    SCHomePageSectionOneCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView * advertisingImgView = [[UIImageView alloc] init];
        [self.contentView addSubview:advertisingImgView];
        [advertisingImgView setImage:[UIImage imageNamed:@"index_banner_coupon"]];
        self.advertisingImgView = advertisingImgView;
        CGFloat height = 125/(SCREEN_WIDTH - 10)* SCREEN_WIDTH ;
        [advertisingImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(5);
            make.right.equalTo(self.contentView.mas_right).with.offset(-5);
            make.top.equalTo(self.contentView.mas_top).with.offset(5);
            make.height.mas_equalTo(height);
        }];
        
        CGFloat carImgWidth = 54;
        CGFloat spaceWidth = ((SCREEN_WIDTH- 44)-4*54)/3;
        CGFloat carImageViewX = 0;
        NSArray * imageNameArray = @[@"index_function_btn_xcmr",@"index_function_btn_hyby",@"index_function_btn_bjpq",@"index_function_btn_sgzb"];
        NSArray * labelNameArray = @[@"洗车美容",@"换油保养",@"钣金喷漆",@"施工直播"];
        for (NSUInteger i = 0; i < labelNameArray.count; i++) {
            carImageViewX = 22 + (carImgWidth + spaceWidth)*i;
            UIImageView * carImageView = [[UIImageView alloc] init];
            [self.contentView addSubview:carImageView];
            carImageView.layer.masksToBounds = YES;
            [carImageView.layer setCornerRadius:27];
            [carImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_left).with.offset(carImageViewX);
                make.size.mas_equalTo(CGSizeMake(54, 54));
                make.top.equalTo(advertisingImgView.mas_bottom).with.offset(2.5);
            }];
            [carImageView setImage:[UIImage imageNamed:[imageNameArray safeObjectAtIndex:i]]];
            
            
            UIButton * clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.contentView addSubview:clickBtn];
            [clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_left).with.offset(carImageViewX);
                make.size.mas_equalTo(CGSizeMake(54, 54));
                make.top.equalTo(advertisingImgView.mas_bottom).with.offset(2.5);
            }];
            [clickBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            clickBtn.tag = 400+i;
            
            
            UILabel * carLabel = [[UILabel alloc] init];
            [self.contentView addSubview:carLabel];
            carLabel.text = [labelNameArray safeObjectAtIndex:i];
            [carLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(carImageView.mas_left).with.offset(0);
                make.right.equalTo(carImageView.mas_right).with.offset(-0);
                make.top.equalTo(carImageView.mas_bottom).with.offset(12);
            }];
            carLabel.font = [UIFont sy_font12];
            carLabel.textColor = [UIColor sc_colorWith666666];
            carLabel.textAlignment = NSTextAlignmentCenter;
        }
        
        //Hot Recommended
        UILabel * hotRecommendLabel = [[UILabel alloc] init];
        [self.contentView addSubview:hotRecommendLabel];
        hotRecommendLabel.text = @"热门推荐";
        hotRecommendLabel.font = [UIFont sy_boldFont16];
        hotRecommendLabel.textColor = [UIColor sc_colorWith444444];
        [hotRecommendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(65, 17));
            make.centerX.mas_equalTo(self.contentView.mas_centerX);
            make.top.equalTo(advertisingImgView.mas_bottom).with.offset(25+54+12+12);
        }];
        
        UIImageView * dictLeftImgView = [[UIImageView alloc] init];
        [dictLeftImgView setImage:[UIImage imageNamed:@"index_tilte_dict_left"]];
        [self.contentView addSubview:dictLeftImgView];
        
        UIImageView * dictRightImgView = [[UIImageView alloc] init];
        [dictRightImgView setImage:[UIImage imageNamed:@"index_tilte_dict_right"]];
        [self.contentView addSubview:dictRightImgView];
        
        
        [dictLeftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(hotRecommendLabel.mas_left).with.offset(-5);
            make.size.mas_equalTo(CGSizeMake(8.5, 9));
            make.top.equalTo(hotRecommendLabel.mas_top).with.offset(0);
        }];
        
        [dictRightImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(hotRecommendLabel.mas_right).with.offset(5);
            make.size.mas_equalTo(CGSizeMake(8.5, 9));
            make.top.equalTo(hotRecommendLabel.mas_top).with.offset(0);
        }];
        
        
        UILabel *underlineLabel = [[UILabel alloc] init];
        NSString *textStr = @"查看更多";
        // 下划线
        NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:textStr attributes:attribtDic];
        //赋值
        underlineLabel.attributedText = attribtStr;
        underlineLabel.font = [UIFont sy_font14];
        underlineLabel.textColor = [UIColor sc_colorWith6C6DFD];
        [self.contentView addSubview:underlineLabel];
        [underlineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.top.equalTo(hotRecommendLabel.mas_top).with.offset(0);
        }];
        
        
        UIButton * loadMoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:loadMoreBtn];
        [loadMoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.top.equalTo(hotRecommendLabel.mas_top).with.offset(-10);
            make.size.mas_equalTo(CGSizeMake(70, 35));
        }];
        [loadMoreBtn addTarget:self action:@selector(loadMoreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)loadMoreBtnClick:(UIButton *)sender
{
    if ([_delegate respondsToSelector:@selector(homePageSectionOneCellClickLoadMore)]) {
        [self.delegate homePageSectionOneCellClickLoadMore];
    }
}

- (void)clickBtn:(UIButton *)sender
{
    NSInteger tag = sender.tag-400;
    if ([_delegate respondsToSelector:@selector(homePageDidSeleItemWitIndex:)]) {
        [self.delegate homePageDidSeleItemWitIndex:tag];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
