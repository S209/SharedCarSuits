//
//  SCMyGarageViewCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMyGarageViewCell.h"

@interface SCMyGarageViewCell()
@property (nonatomic, weak) UILabel * carNumberLabel;
@property (nonatomic, weak) UILabel * carNameLabel;
@property (nonatomic, weak) UILabel * defaultCarLabel;
@property (nonatomic, weak) UIImageView * checkImageView;
@property (nonatomic, weak) UIView * segmentView;
@property (nonatomic, weak) UIButton * editorBtn;
@property (nonatomic, weak) UIButton * deleteBtn;
@property (nonatomic, weak) UIButton * checkImageViewClick;
@property (nonatomic, weak) UIView * bottomSegmentView;
@end
@implementation SCMyGarageViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)myGarageViewCellWithTable:(UITableView *)tableView
{
    static NSString * idDes = @"SCMyGarageViewCellIdDES";
    [tableView registerClass:[SCMyGarageViewCell class] forCellReuseIdentifier:idDes];
    SCMyGarageViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * carNumberLabel = [[UILabel alloc] init];
        [self.contentView addSubview:carNumberLabel];
        self.carNumberLabel = carNumberLabel;
        carNumberLabel.font = [UIFont sy_boldFont16];
        carNumberLabel.textColor = [UIColor sc_colorWith444444];
      
        UILabel * carNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:carNameLabel];
        self.carNameLabel = carNameLabel;
        carNameLabel.font = [UIFont sy_font12];
        carNameLabel.textColor = [UIColor whiteColor];
        carNameLabel.layer.masksToBounds = YES;
        [carNameLabel.layer setCornerRadius:2.0];
        
        UIView * segmentView = [[UIView alloc] init];
        [self.contentView addSubview:segmentView];
        self.segmentView = segmentView;
        segmentView.backgroundColor = [UIColor sc_colorWithe5e5e5];
        
        UIImageView * checkImageView = [[UIImageView alloc] init];
        self.checkImageView = checkImageView;
        [self.contentView addSubview:checkImageView];
        [checkImageView setImage:[UIImage imageNamed:@"mycar_choise_normal"]];
        checkImageView.userInteractionEnabled = YES;
        
        UIButton * checkImageViewClick = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:checkImageViewClick];
        self.checkImageViewClick = checkImageViewClick;
        [checkImageViewClick addTarget:self action:@selector(checkImageViewClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel * defaultCarLabel = [[UILabel alloc] init];
        [self.contentView addSubview:defaultCarLabel];
        self.defaultCarLabel = defaultCarLabel;
        defaultCarLabel.font = [UIFont sy_font14];
        defaultCarLabel.textColor = [UIColor sc_colorWith444444];
        defaultCarLabel.text = @"设置为默认车辆";
        
        UIButton * editorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.editorBtn = editorBtn;
        [self.contentView addSubview:editorBtn];
        [editorBtn addTarget:self action:@selector(editorBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [editorBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [editorBtn setTitleColor:[UIColor sc_colorWith444444] forState:UIControlStateNormal];
        editorBtn.titleLabel.font = [UIFont sy_font14];
        editorBtn.layer.masksToBounds = YES;
        [editorBtn.layer setCornerRadius:2];
        editorBtn.layer.borderColor = [[UIColor sc_colorWith444444] CGColor];
        editorBtn.layer.borderWidth = 1;
        
        UIButton * deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.deleteBtn = deleteBtn;
        [self.contentView addSubview:deleteBtn];
        [deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [deleteBtn setTitleColor:[UIColor sc_colorWithea5858] forState:UIControlStateNormal];
        deleteBtn.titleLabel.font = [UIFont sy_font14];
        deleteBtn.layer.borderColor = [[UIColor sc_colorWithea5858] CGColor];
        deleteBtn.layer.borderWidth = 1;
        
        UIView * bottomSegmentView = [[UIView alloc] init];
        [self.contentView addSubview:bottomSegmentView];
        self.bottomSegmentView = bottomSegmentView;
        bottomSegmentView.backgroundColor = [UIColor sc_colorWihtf8f8f8];
    }
    return self;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.carNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(self.contentView.mas_top).with.offset(20);
        make.width.mas_equalTo(200);
    }];
    
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.carNumberLabel.mas_bottom).with.offset(18);
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.checkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(14, 14));
        make.top.equalTo(self.segmentView.mas_bottom).with.offset(18);
    }];
    
    [self.checkImageViewClick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(14, 14));
        make.top.equalTo(self.segmentView.mas_bottom).with.offset(18);
    }];
    
    [self.defaultCarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.checkImageView.mas_right).with.offset(4);
        make.centerY.mas_equalTo(self.checkImageView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(200, 15));
    }];
    
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(55, 22));
        make.top.equalTo(self.segmentView.mas_bottom).with.offset(18);
    }];
    
    [self.editorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.deleteBtn.mas_left).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(55, 22));
        make.top.equalTo(self.segmentView.mas_bottom).with.offset(18);
    }];
    
    [self.bottomSegmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(10);
    }];
}


- (void)editorBtnClick:(UIButton *)sender
{
    if ([_delegate respondsToSelector:@selector(myGarageViewCellClickDelete)]) {
        [self.delegate myGarageViewCellClickDelete];
    }
}

- (void)deleteBtnClick:(UIButton *)sender
{
    if ([_delegate respondsToSelector:@selector(myGarageViewCellClickEditor)]) {
        [self.delegate myGarageViewCellClickEditor];
    }
}

#pragma mark
- (void)checkImageViewClick:(UIButton *)sender
{
    BOOL state = sender.selected ;
    if (state) {
        [self.checkImageView setImage:[UIImage imageNamed:@"mycar_choise_selected"]];
    }else{
        [self.checkImageView setImage:[UIImage imageNamed:@"mycar_choise_normal"]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
