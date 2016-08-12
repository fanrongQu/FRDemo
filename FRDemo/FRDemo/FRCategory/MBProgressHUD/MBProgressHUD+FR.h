//
//  MBProgressHUD+FR.h
//  FRDemo
//
//  Created by 1860 on 15/12/12.
//  Copyright © 2015年 fanrongQu. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (FR)
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showHUD:(NSString *)HUD toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (void)showHUD:(NSString *)HUD;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;
+ (void)showErrorWithNet;
@end
