//
//  MBProgressHUD+Category.m
//  HudDemo
//
//  Created by 1860 on 16/8/24.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//

#import "MBProgressHUD+Category.h"

#define CricleAnimation @"cricleAnimation"

@implementation MBProgressHUD (Category)

#pragma mark - 事件
/**
 *  活动指示器
 */
+ (MBProgressHUD *)showActivityIndicatorWithTitle:(NSString *)title detailsTitle:(NSString *)detailTitle contentColor:(UIColor *)color progressHUDMode:(MBProgressHUDMode)progressHUDMode inView:(UIView *)view {
//    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];//第一次有可能不会出现弹框
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;//据说之前有过AlertView会商城新的windowhttp://blog.csdn.net/hamasn/article/details/9367323
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.contentColor = color;
    hud.bezelView.color = [UIColor colorWithRed:192/255.0 green:192/255.0 blue:192/255.0 alpha:0.8];
    hud.minSize = CGSizeMake(90.f, 40.f);
    
    hud.label.text = title;
    
    hud.mode = progressHUDMode;
    
    //    MBProgressHUDModeIndeterminate;系统默认
    //    MBProgressHUDModeAnnularDeterminate;//圆形加载
    //    MBProgressHUDModeDeterminateHorizontalBar;//水平加载
    //    MBProgressHUDModeDeterminate;//双环形圆行加载
    
    hud.detailsLabel.text = detailTitle;
    
    return hud;

}

+ (MBProgressHUD *)showActivityIndicatorWithTitle:(NSString *)title detailsTitle:(NSString *)detailTitle progressHUDMode:(MBProgressHUDMode)progressHUDMode inView:(UIView *)view {
    return [self showActivityIndicatorWithTitle:title detailsTitle:detailTitle contentColor:[UIColor blackColor] progressHUDMode:progressHUDMode inView:view];
}

+ (MBProgressHUD *)showActivityIndicatorWithTitle:(NSString *)title detailsTitle:(NSString *)detailTitle progressHUDMode:(MBProgressHUDMode)progressHUDMode {
    return [self showActivityIndicatorWithTitle:title detailsTitle:detailTitle progressHUDMode:progressHUDMode inView:nil];
}

+ (MBProgressHUD *)showActivityIndicatorWithTitle:(NSString *)title contentColor:(UIColor *)color progressHUDMode:(MBProgressHUDMode)progressHUDMode inView:(UIView *)view {
    return [self showActivityIndicatorWithTitle:title detailsTitle:nil contentColor:color progressHUDMode:progressHUDMode inView:view];
}

+ (MBProgressHUD *)showActivityIndicatorWithTitle:(NSString *)title progressHUDMode:(MBProgressHUDMode)progressHUDMode inView:(UIView *)view {
    return [self showActivityIndicatorWithTitle:title detailsTitle:nil progressHUDMode:progressHUDMode inView:view];
}

+ (MBProgressHUD *)showActivityIndicatorWithTitle:(NSString *)title progressHUDMode:(MBProgressHUDMode)progressHUDMode {
    return [self showActivityIndicatorWithTitle:title progressHUDMode:progressHUDMode inView:nil];
}




/**
 *  带有进度的需要设置
 * Set up NSPorgress
 
	NSProgress *progressObject = [NSProgress progressWithTotalUnitCount:100];
	hud.progressObject = progressObject;
 
	// Configure a cacnel button.
	[hud.button setTitle:NSLocalizedString(@"Cancel", @"HUD cancel button title") forState:UIControlStateNormal];
	[hud.button addTarget:progressObject action:@selector(cancelWork) forControlEvents:UIControlEventTouchUpInside];
 
    之后调用
 
     - (void)doSomeWorkWithProgressObject:(NSProgress *)progressObject {
     self.canceled = NO;
        // This just increases the progress indicator in a loop.
    while (progressObject.fractionCompleted < 1.0f) {
         if (self.canceled) break;
         [progressObject becomeCurrentWithPendingUnitCount:1];
         [progressObject resignCurrent];
         usleep(50000);
        }
     }
 
     - (void)cancelWork {
         self.canceled = YES;
     }
 *
 */


#pragma mark - 提示状态
/**
 *  带有自定义view的HUD
 *
 *  @param text       提醒标题
 *  @param detailTitle 副标题
 *  @param customView 自定义view
 *  @param color      颜色
 *  @param view       显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showTitle:(NSString *)text detailsLabel:(NSString *)detailTitle customView:(UIView *)customView contentColor:(UIColor *)color inView:(UIView *)view {
    
//    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.contentColor = color;
    hud.bezelView.color = [UIColor colorWithRed:192/255.0 green:192/255.0 blue:192/255.0 alpha:0.8];
    hud.minSize = CGSizeMake(90.f, 40.f);
    
    if(text) hud.label.text = text;
    if(detailTitle) hud.detailsLabel.text = detailTitle;
    
    if (customView) {
        hud.mode = MBProgressHUDModeCustomView;
        
        hud.customView = customView;
    }else {
        hud.mode = MBProgressHUDModeText;
    }
    
    return hud;
}


/**
 *  带有图片的HUD
 *
 *  @param title      提醒标题
 *  @param detailTitle 副标题
 *  @param icon       图片
 *  @param color      颜色
 *  @param view       显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showTitle:(NSString *)title detailsLabel:(NSString *)detailTitle icon:(NSString *)icon contentColor:(UIColor *)color inView:(UIView *)view {
    
    UIView *customView;
    if (icon.length > 0) {
        UIImage *image = [[UIImage imageNamed:icon] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        if (!image) {
            NSBundle *bundle = [NSBundle bundleForClass:[MBProgressHUD class]];
            NSURL *url = [bundle URLForResource:@"MBProgressHUD" withExtension:@"bundle"];
            NSBundle *imageBundle = [NSBundle bundleWithURL:url];
            NSString *path = [imageBundle pathForResource:icon ofType:@"png"];
            image = [[UIImage imageWithContentsOfFile:path] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }

        
        customView = [[UIImageView alloc] initWithImage:image];
    }
    MBProgressHUD *hud = [self showTitle:title detailsLabel:detailTitle customView:customView contentColor:color inView:view];
    return hud;
}


#pragma mark - 动画HUD
+ (MBProgressHUD *)showCustomeAnimationTitle:(NSString *)title detailsLabel:(NSString *)detailTitle icon:(NSString *)icon contentColor:(UIColor *)color inView:(UIView *)view {
    
    UIView *customView;
    if (icon.length > 0) {
        UIImage *image = [[UIImage imageNamed:icon] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        if (!image) {
            NSBundle *bundle = [NSBundle bundleForClass:[MBProgressHUD class]];
            NSURL *url = [bundle URLForResource:@"MBProgressHUD" withExtension:@"bundle"];
            NSBundle *imageBundle = [NSBundle bundleWithURL:url];
            NSString *path = [imageBundle pathForResource:icon ofType:@"png"];
            image = [[UIImage imageWithContentsOfFile:path] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }
        
        customView = [[UIImageView alloc] initWithImage:image];
        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        anima.toValue = @(M_PI*2);
        anima.duration = 1.0f;
        anima.repeatCount = MAXFLOAT;
        [customView.layer addAnimation:anima forKey:CricleAnimation];
    }
    MBProgressHUD *hud = [self showTitle:title detailsLabel:detailTitle customView:customView contentColor:color inView:view];
    return hud;
}

+ (MBProgressHUD *)showCustomeAnimationTitle:(NSString *)title icon:(NSString *)icon contentColor:(UIColor *)color {
    
    return [self showCustomeAnimationTitle:nil detailsLabel:title icon:icon contentColor:color inView:nil];
}


#pragma mark - 常用提示状态

//成功
+ (MBProgressHUD *)showSuccess:(NSString *)success contentColor:(UIColor *)color inView:(UIView *)view {
    
    MBProgressHUD *hud = [self showTitle:nil detailsLabel:success icon:@"HUDsuccess" contentColor:color inView:view];
    [hud hideAnimated:YES afterDelay:1.8];
    return hud;
}
+ (MBProgressHUD *)showSuccess:(NSString *)success inView:(UIView *)view {
    return [self showSuccess:success contentColor:[UIColor blackColor] inView:view];
}
+ (MBProgressHUD *)showSuccess:(NSString *)success contentColor:(UIColor *)color {
    return [self showSuccess:success contentColor:color inView:nil];
}
+ (MBProgressHUD *)showSuccess:(NSString *)success {
    return [self showSuccess:success contentColor:[UIColor blackColor] inView:nil];
}


//失败
+ (MBProgressHUD *)showError:(NSString *)error contentColor:(UIColor *)color inView:(UIView *)view {
    MBProgressHUD *hud = [self showTitle:nil detailsLabel:error icon:@"HUDerror" contentColor:color inView:view];
    [hud hideAnimated:YES afterDelay:1.8];
    return hud;
}
+ (MBProgressHUD *)showError:(NSString *)error inView:(UIView *)view {
    return [self showError:error contentColor:[UIColor blackColor] inView:view];
}
+ (MBProgressHUD *)showError:(NSString *)error contentColor:(UIColor *)color {
    return [self showError:error contentColor:color inView:nil];
}
+ (MBProgressHUD *)showError:(NSString *)error {
    return [self showError:error contentColor:[UIColor blackColor] inView:nil];
}


//警告
+ (MBProgressHUD *)showInfo:(NSString *)info contentColor:(UIColor *)color inView:(UIView *)view {
    MBProgressHUD *hud = [self showTitle:nil detailsLabel:info icon:@"HUDinfo" contentColor:color inView:view];
    [hud hideAnimated:YES afterDelay:1.8];
    return hud;
}
+ (MBProgressHUD *)showInfo:(NSString *)info inView:(UIView *)view {
    return [self showInfo:info contentColor:[UIColor blackColor] inView:view];
}
+ (MBProgressHUD *)showInfo:(NSString *)info contentColor:(UIColor *)color {
    return [self showInfo:info contentColor:color inView:nil];
}
+ (MBProgressHUD *)showInfo:(NSString *)info {
    return [self showInfo:info contentColor:[UIColor blackColor] inView:nil];
}


//提醒
+ (MBProgressHUD *)showMessage:(NSString *)message contentColor:(UIColor *)color inView:(UIView *)view {
    MBProgressHUD *hud = [self showTitle:message detailsLabel:nil icon:nil contentColor:color inView:view];
    [hud hideAnimated:YES afterDelay:1.8];
    return hud;
}
+ (MBProgressHUD *)showMessage:(NSString *)message inView:(UIView *)view {
    return [self showMessage:message contentColor:[UIColor blackColor] inView:view];
}
+ (MBProgressHUD *)showMessage:(NSString *)message contentColor:(UIColor *)color {
    return [self showMessage:message contentColor:color inView:nil];
}
+ (MBProgressHUD *)showMessage:(NSString *)message {
    return [self showMessage:message contentColor:[UIColor blackColor] inView:nil];
}



#pragma mark - 隐藏HUD
+ (void)hideHUDForView:(UIView *)view
{
//    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [self HUDForView:view];
    if (hud.customView) {
        [hud.customView.layer removeAnimationForKey:CricleAnimation];
    }
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}



@end
