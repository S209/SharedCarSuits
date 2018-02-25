
//
//  SCMakeAnAppointmentprocessCell.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/24.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMakeAnAppointmentprocessCell.h"

@interface SCMakeAnAppointmentprocessCell()
@property (nonatomic, weak) UILabel * makeAnAppointmentLabel;
@property (nonatomic, weak) UILabel * numberOfUploadPhotoLabel;
@property (nonatomic, weak) UIButton * addPhotoBtn;
@property (nonatomic, weak) UIImageView * photoOneImageView;
@property (nonatomic, weak) UIImageView * photoTwoImageView;
@end
@implementation SCMakeAnAppointmentprocessCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)makeAnAppointmentprocessCellWithTabeleView:(UITableView *)tableView
{
    static NSString * const idDes = @"SCMakeAnAppointmentprocessCellIDdes";
    [tableView registerClass:[SCMakeAnAppointmentprocessCell class] forCellReuseIdentifier:idDes];
    SCMakeAnAppointmentprocessCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * makeAnAppointmentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:makeAnAppointmentLabel];
        self.makeAnAppointmentLabel = makeAnAppointmentLabel;
        makeAnAppointmentLabel.textColor = [UIColor sc_colorWith282828];
        makeAnAppointmentLabel.font = [UIFont sy_font14];
        makeAnAppointmentLabel.text = @"请上传车辆受损照片";
        
        
        UILabel * numberOfUploadPhotoLabel = [[UILabel alloc] init];
        [self.contentView addSubview:numberOfUploadPhotoLabel];
        self.numberOfUploadPhotoLabel = numberOfUploadPhotoLabel;
        numberOfUploadPhotoLabel.text = @"可上传2张图片";
        numberOfUploadPhotoLabel.font = [UIFont sy_font12];
        
        
        UIButton * addPhotoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:addPhotoBtn];
        self.addPhotoBtn = addPhotoBtn;
        [addPhotoBtn setTitleColor:[UIColor sc_colorWith6C6DFD] forState:UIControlStateNormal];
        [addPhotoBtn setTitle:@"+ 添加图片" forState:UIControlStateNormal];
        [addPhotoBtn addTarget:self action:@selector(addPhotoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        addPhotoBtn.titleLabel.font = [UIFont sy_font16];
        addPhotoBtn.layer.masksToBounds = YES;
        [addPhotoBtn.layer setCornerRadius:20];
        addPhotoBtn.backgroundColor = [UIColor cdf_colorWithHexString:@"6C6DFD" alpha:0.23];
        
        UIImageView * photoOneImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:photoOneImageView];
        self.photoOneImageView = photoOneImageView;
        
        UIImageView * photoTwoImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:photoTwoImageView];
        self.photoTwoImageView = photoTwoImageView;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.makeAnAppointmentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(self.contentView.mas_top).with.offset(20);
    }];
    
    [self.numberOfUploadPhotoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.top.equalTo(self.contentView.mas_top).with.offset(20);
    }];
    
    [self.addPhotoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.numberOfUploadPhotoLabel.mas_bottom).with.offset(20);
    }];
    
    CGFloat photoOneImageWidth = (SCREEN_WIDTH - 30 - 5)/2;
    CGFloat photoOneImageHeight = (photoOneImageWidth * 226)/339.0;
    [self.photoOneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.top.equalTo(self.addPhotoBtn.mas_bottom).with.offset(15);
        make.width.mas_equalTo(photoOneImageWidth);
        make.height.mas_equalTo(photoOneImageHeight);
    }];
    
    [self.photoTwoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.top.equalTo(self.addPhotoBtn.mas_bottom).with.offset(15);
        make.width.mas_equalTo(photoOneImageWidth);
        make.height.mas_equalTo(photoOneImageHeight);
    }];
    
    
}


- (void)addPhotoBtnClick:(UIButton *)sender
{
    
}

+ (CGFloat)cellHeight
{
    CGFloat photoOneImageWidth = (SCREEN_WIDTH - 30 - 5)/2;
    return 20+20+14+40+15+5+(photoOneImageWidth * 226)/339.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
