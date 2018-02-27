//
//  SCEditorUserInfoViewController+ImagePickerController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCEditorUserInfoViewController+ImagePickerController.h"

@implementation SCEditorUserInfoViewController (ImagePickerController)
- (void)initWithUIImagePickerController
{
    self.imagePickerController = [[UIImagePickerController alloc] init];
    self.imagePickerController.delegate = self;
    self.imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    self.imagePickerController.allowsEditing = YES;
}



#pragma mark 从摄像头获取图片或视频
- (BOOL)hasCamera
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (void)selectImageFromCamera
{
    if (![self hasCamera]) {
        return;
    }
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    //录制视频时长，默认10s
    //相机类型（拍照、录像...）字符串需要做相应的类型转换
    self.imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage];
    //视频上传质量
    //设置摄像头模式（拍照，录制视频）为录像模式
//    self.imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}




#pragma mark 从相册获取图片或视频
- (void)selectImageFromAlbum
{

    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}


#pragma mark UIImagePickerControllerDelegate
//该代理方法仅适用于只选取图片时
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
    NSLog(@"选择完毕----image:%@-----info:%@",image,editingInfo);
}


//适用获取所有媒体资源，只需判断资源类型
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    //判断资源类型
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
        //如果是图片
                self.iconImageView .image = info[UIImagePickerControllerEditedImage];
        //        //压缩图片
                NSData *fileData = UIImageJPEGRepresentation(self.iconImageView.image, 1.0);
        //        //保存图片至相册
        //        UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        //        //上传图片
        //        [self uploadImageWithData:fileData];
        
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 图片保存完毕的回调
- (void) image: (UIImage *) image didFinishSavingWithError:(NSError *) error contextInfo: (void *)contextInf{
    
}

#pragma mark 视频保存完毕的回调
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInf{
    if (error) {
        NSLog(@"保存视频过程中发生错误，错误信息:%@",error.localizedDescription);
    }else{
        NSLog(@"视频保存成功.");
    }
}

@end
