//
//  SCEditorUserInfoViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCEditorUserInfoViewController.h"
#import "SCEditorIconView.h"
#import "SCEditorUserInfoViewController+ImagePickerController.h"
#import "SCUserModel.h"
#import "SCNetworkMultiDataObj.h"
#import "SCManager+RequestInterface.h"
#import "WPFileManager.h"
@interface SCEditorUserInfoViewController ()<SCEditorIconViewDelegate,UITextFieldDelegate>
@property (nonatomic, weak) UITextField * nameField;
@property (nonatomic, weak) UITextField * phoneField;
@end

@implementation SCEditorUserInfoViewController
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"编辑个人资料"];
    [self sy_leftBarButtonItem];
    [self setupView];
    [self initWithUIImagePickerController];
    UITapGestureRecognizer * tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tapGest];
//    [self addNotific];
}

//- (void)addNotific
//{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
//}

- (void)tapClick
{
    [self.nameField resignFirstResponder];
}

- (void)setupView
{
    UIImageView * iconImageView = [[UIImageView alloc] init];
    [self.view addSubview:iconImageView];
    self.iconImageView = iconImageView;
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(95, 95));
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight+60);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    iconImageView.layer.masksToBounds = YES;
    [iconImageView.layer setCornerRadius:47.5];
    [iconImageView sd_setImageWithURL:[NSURL URLWithString:_userModel.headUrl] placeholderImage:[UIImage imageNamed:@""]];
    
    
    UILabel * editorImgLabel = [[UILabel alloc] init];
    [self.view addSubview:editorImgLabel];
    editorImgLabel.text = @"点击编辑头像";
    [editorImgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImageView.mas_left).with.offset(0);
        make.right.equalTo(iconImageView.mas_right).with.offset(-0);
        make.top.equalTo(iconImageView.mas_bottom).with.offset(15);
    }];
    editorImgLabel.font = [UIFont sy_font14];
    editorImgLabel.textColor = [UIColor sc_colorWith999999];
    editorImgLabel.textAlignment = NSTextAlignmentCenter;
  
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImageView.mas_left).with.offset(0);
        make.right.equalTo(iconImageView.mas_right).with.offset(-0);
        make.top.equalTo(iconImageView.mas_bottom).with.offset(15);
        make.height.mas_equalTo(20);
    }];
    
    UILabel * nameLabel = [[UILabel alloc] init];
    [self.view addSubview:nameLabel];
    nameLabel.text = @"姓名";
    nameLabel.textColor = [UIColor sc_colorWith282828];
    nameLabel.font = [UIFont sy_font16];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.top.equalTo(editorImgLabel.mas_bottom).with.offset(43);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
    }];
    
    UITextField * nameField = [[UITextField alloc] init];
    [self.view addSubview:nameField];
    nameField.delegate = self;
    self.nameField = nameField;
    nameField.backgroundColor = [UIColor sc_colorWithf8f8f8];
    [nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-15);
        make.top.equalTo(nameLabel.mas_bottom).with.offset(14);
        make.height.mas_equalTo(40);
    }];
    UIView * leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,15, 40)];
    nameField.leftView = leftView;
    nameField.leftViewMode = UITextFieldViewModeAlways;
    leftView.backgroundColor = [UIColor sc_colorWithf8f8f8];
    nameField.placeholder = @"请输入真实姓名";
    nameField.text = _userModel.realName;
    
    UILabel * phoneLabel = [[UILabel alloc] init];
    [self.view addSubview:phoneLabel];
    phoneLabel.text = @"联系方式";
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameField.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-15);
        make.top.equalTo(nameField.mas_bottom).with.offset(20);
    }];
    
    UITextField * phoneField = [[UITextField alloc] init];
    [self.view addSubview:phoneField];
    phoneField.userInteractionEnabled = NO;
    phoneField.backgroundColor = [UIColor sc_colorWithf8f8f8];
    [phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-15);
        make.top.equalTo(phoneLabel.mas_bottom).with.offset(14);
        make.height.mas_equalTo(40);
    }];
    
    phoneField.textColor = [UIColor sc_colorWith000044];
    UIView * leftPhoneView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,15,40)];
    phoneField.leftView = leftPhoneView;
    phoneField.leftViewMode = UITextFieldViewModeAlways;
    phoneField.text = _userModel.loginName;
    
    
    UIButton * completeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:completeBtn];
    [completeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.right.equalTo(self.view.mas_right).with.offset(-15);
        make.top.equalTo(phoneField.mas_bottom).with.offset(85);
        make.height.mas_equalTo(40);
    }];
    completeBtn.backgroundColor = [UIColor sc_colorWith6C6DFD];
    [completeBtn setTitle:@"完成" forState:UIControlStateNormal];
    [completeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    completeBtn.titleLabel.font = [UIFont sy_boldFont16];
    [completeBtn addTarget:self action:@selector(completeClick) forControlEvents:UIControlEventTouchUpInside];
    completeBtn.layer.masksToBounds = YES;
    [completeBtn.layer setCornerRadius:4.0];
}

#pragma mark 编辑
- (void)btnClick
{
    SCEditorIconView * editorIconView = [[SCEditorIconView alloc] init];
    [editorIconView show];
    editorIconView.delegate = self;
}


- (void)editorIconType:(TypeImageView)typeImage
{
    if (typeImage == TypeImageViewTakeAPhoto) {
        [self selectImageFromCamera];
    }else{
        [self selectImageFromAlbum];
    }
}

- (void)completeClick
{
    NSString * userNamePath = [NSString stringWithFormat:@"%@_userName",NSStringFromClass([self class])];
    [[WPFileManager shareCacheFileInstance] writeString:self.nameField.text atPath:userNamePath];
   NSString * userNameFilePath = [[WPFileManager shareCacheFileInstance] absolutePathWithPath:userNamePath];
    
    NSString * iconPath = [NSString stringWithFormat:@"%@_userIcon",NSStringFromClass([self class])];
    NSString * iconFilePath = [[WPFileManager shareCacheFileInstance] absolutePathWithPath:iconPath];
    
    NSData * fileData = [[WPFileManager shareCacheFileInstance] readDataAtPath:iconPath];
//    NSData * userNameData = [[WPFileManager shareCacheFileInstance] readDataAtPath:userNamePath];
    
    
    [self.nameField resignFirstResponder];
    [[SCManager shareInstance] editUserInfoWithConstructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if (fileData) {
           [formData appendPartWithFileURL:[NSURL fileURLWithPath:iconFilePath] name:@"File" error:nil];
        }
        if (self.nameField.text)
        {
            if(![[NSFileManager defaultManager] fileExistsAtPath:userNameFilePath])
            {
                NSLog(@"%@: 上传的文件路径不存在", NSStringFromClass([self class]));
                return ;
            }
            
           [formData appendPartWithFileURL:[NSURL fileURLWithPath:userNameFilePath] name:@"Text" fileName:userNamePath mimeType:@"application/octet-stream" error:nil];

        }
    } success:^(NSURLSessionDataTask *serializer, id responseObject) {
        NSLog(@"===%@==",responseObject);
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
         NSLog(@"===%@==",error);
    }];
}

//- (void)keyboardWillShow:(NSNotification *)notification {
//    NSDictionary *userInfo = [notification userInfo];
//    // 获取键盘的frame
//    CGRect keyboardFrame = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    // 获取键盘的动画时间
//    NSTimeInterval animationDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
//    // do something
//    self.view.frame = CGRectMake(0, -keyboardFrame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT);
    
//}


//- (void)keyboardWillHide:(NSNotification *)notification {
//    self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
//}

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
