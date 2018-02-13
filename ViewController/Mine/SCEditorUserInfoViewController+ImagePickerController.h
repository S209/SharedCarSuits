//
//  SCEditorUserInfoViewController+ImagePickerController.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCEditorUserInfoViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
@interface SCEditorUserInfoViewController (ImagePickerController)<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
- (void)initWithUIImagePickerController;
- (void)selectImageFromCamera;
- (void)selectImageFromAlbum;
@end
