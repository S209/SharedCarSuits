//
//  SCEditorUserInfoViewController.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCBaseViewController.h"
@class UIImagePickerController,SCUserModel;
@interface SCEditorUserInfoViewController : SCBaseViewController
@property (nonatomic, strong) UIImagePickerController * imagePickerController;
@property (nonatomic, weak) UIImageView * iconImageView ;
@property (nonatomic, strong) SCUserModel * userModel;
@end
