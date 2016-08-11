//
//  PersonalIconViewController.m
//  Haidao
//
//  Created by 1860 on 16/8/5.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//

#import "PersonalIconViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface PersonalIconViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

/**  头像  */
@property (nonatomic, strong) UIImageView *iconImage;

@end

@implementation PersonalIconViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人头像";
    self.iconImage.backgroundColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"更多"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick)];
    self.iconImage.image = [UIImage imageNamed:@"bg"];
}

- (void)dealloc {
    if (_iconImage != nil) _iconImage = nil;
}

- (void)rightBarButtonItemClick {
    
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertControl addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self selectImageFromCamera];
    }]];
    
    [alertControl addAction:[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self selectImageFromPhotos];
    }]];
    
    [alertControl addAction:[UIAlertAction actionWithTitle:@"保存图片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         UIImageWriteToSavedPhotosAlbum(self.iconImage.image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), NULL);
    }]];
    
    [alertControl addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [self presentViewController:alertControl animated:YES completion:nil];
}

/**
 *  从相机选择图片
 */
- (void)selectImageFromCamera {
    
    //判断是否可以打开相机
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusDenied){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"相机权限受限" message:@"请在iPhone的\"设置->隐私->相机\"选项中,允许\"****\"访问您的相机." preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if ([self canOpenSystemSettingView]) {
                [self systemSettingView];
            }
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
        return;
    }
    
    UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
    // 设置代理
    imagePC.delegate = self;
    imagePC.allowsEditing = YES;
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) return;
    imagePC.sourceType = UIImagePickerControllerSourceTypeCamera;
    // 显示控制器
    [self presentViewController:imagePC animated:YES completion:nil];
}

/**
 *  从相簿选择图片
 */
- (void)selectImageFromPhotos {
    
    UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
    // 设置代理
    imagePC.delegate = self;
    imagePC.allowsEditing = YES;
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    imagePC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    // 显示控制器
    [self presentViewController:imagePC animated:YES completion:nil];
}


/**
 *  是否可以打开设置页面
 *
 *  @return
 */
- (BOOL)canOpenSystemSettingView {
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        return YES;
    } else {
        return NO;
    }
}

/**
 *  跳到系统设置页面
 */
- (void)systemSettingView {
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

#pragma mark - UIImagePickerControllerDelegate

/**
 *  在选择完图片后调用
 *
 *  @param info   里面包含了图片信息
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // 销毁控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // 获得图片
    UIImage *image = info[UIImagePickerControllerEditedImage];
    
    //上传图片
}


//保存照片指定回调方法
- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if(!error){
        NSLog(@"savesuccess");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"存储照片成功"
                                                        message:@"您已将照片存储于图片库中，打开照片程序即可查看。"
                                                       delegate:self
                                              cancelButtonTitle:@"好"
                                              otherButtonTitles:nil];
        [alert show];
    }else{
        NSLog(@"savefailed");
        NSLog(@"%@", error.description);
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"存储失败"
                                                       message:@"请打开 设置-隐私-照片 来进行设置"
                                                      delegate:nil
                                             cancelButtonTitle:@"好"
                                             otherButtonTitles:nil, nil];
        [alert show];
    }
}

#pragma mark - 懒加载

- (UIImageView *)iconImage {
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
        [self.view addSubview:_iconImage];
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(kScreenWidth);
            make.center.mas_equalTo(0);
        }];
    }
    return _iconImage;
}


@end
