//
//  SCMineViewControllerSectionZeroCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMineViewControllerSectionCell.h"

@interface SCMineViewControllerSectionCell()
@property (nonatomic, weak) UIImageView * contentImgV;
@property (nonatomic, weak) UILabel * contentLabel;
@property (nonatomic, weak) UIImageView * arrowImgView;
@end
@implementation SCMineViewControllerSectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView * contentImgV = [[UIImageView alloc] init];
        [self.contentView addSubview:contentImgV];
        [contentImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.left.equalTo(self.contentView.mas_left).with.offset(20);
        }];
        self.contentImgV = contentImgV;
        
        UILabel * contentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:contentLabel];
        self.contentLabel = contentLabel;
        contentLabel.font = [UIFont sy_font16];
        contentLabel.textColor = [UIColor sc_colorWith444444];
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.left.equalTo(contentImgV.mas_right).with.offset(9.5);
            make.height.mas_equalTo(17);
        }];
        
        UIImageView * arrowImgView = [[UIImageView alloc] init];
        self.arrowImgView = arrowImgView;
        [arrowImgView setImage:[UIImage imageNamed:@"me_list_ico_arrow"]];
        [self.contentView addSubview:arrowImgView];
        [arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.size.mas_equalTo(CGSizeMake(7, 12.5));
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
        }];
        UIView * segmentView = [[UIView alloc] init];
        [self.contentView addSubview:segmentView];
        [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(0);
            make.right.equalTo(self.contentView.mas_right).with.offset(-0);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
            make.height.mas_equalTo(0.5);
        }];
        segmentView.backgroundColor = [UIColor sc_colorWithe5e5e5];
    }
    return self;
}

+ (instancetype)mineWithTableView:(UITableView *)tableView
{
    static NSString * idDes = @"SCMineViewControllerSectionCellIDdes";
    [tableView registerClass:[SCMineViewControllerSectionCell class] forCellReuseIdentifier:idDes];
    SCMineViewControllerSectionCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)updateContentWithImageName:(NSString *)imageName content:(NSString *)contetn
{
    [self.contentImgV setImage:[UIImage imageNamed:imageName]];
    self.contentLabel.text = contetn;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
