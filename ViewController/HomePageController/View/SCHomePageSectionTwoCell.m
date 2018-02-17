//
//  SCHomePageSectionTwoCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCHomePageSectionTwoCell.h"
#import "SCHomePageSectionTwoCellItemView.h"
@implementation SCHomePageSectionTwoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)hoemPageSectionTwoWithTableView:(UITableView *)tableView
{
    static NSString * idDes = @"SCHomePageSectionTwoCellIDdes";
    [tableView registerClass:[SCHomePageSectionTwoCell class] forCellReuseIdentifier:idDes];
    SCHomePageSectionTwoCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
        self.contentView.backgroundColor = [UIColor sc_colorWihtf8f8f8];
    }
    return self;
}

- (void)setupView
{
    CGFloat leftX = 0;
    CGFloat width = (SCREEN_WIDTH - 30)/2;
    for (NSUInteger i = 0; i < 2; i++) {
        leftX = 10 + (width + 10)*i;
        SCHomePageSectionTwoCellItemView * itemView = [[SCHomePageSectionTwoCellItemView alloc] init];
        [self.contentView addSubview:itemView];
        [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(leftX);
            make.width.mas_equalTo(width);
            make.top.equalTo(self.contentView.mas_top).with.offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
        }];
        
        UIButton * clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:clickBtn];
        [clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(leftX);
            make.width.mas_equalTo(width);
            make.top.equalTo(self.contentView.mas_top).with.offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
        }];
        [clickBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        clickBtn.tag = 300+i;
    }
}

- (void)btnClick:(UIButton *)sender
{
    NSInteger tag = sender.tag - 300;
    if ([_delegate respondsToSelector:@selector(homePageSectionTwoCellClickWithObj:)
         ]) {
        [self.delegate homePageSectionTwoCellClickWithObj:@""];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
