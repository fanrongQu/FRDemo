//
//  MBProgressHUD+Category.m
//  HudDemo
//
//  Created by 1860 on 16/8/24.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//

#import "MBProgressHUD.h"


@interface MBProgressHUD (Category)


#pragma mark - 事件
/**
 *  带有活动指示器的HUD
 *
 *  @param title           标题
 *  @param detailTitle     副标题
 *  @param color           颜色
 *  @param progressHUDMode 指示器类型
 *  @param view            显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showActivityIndicatorWithTitle:(NSString *)title detailsTitle:(NSString *)detailTitle contentColor:(UIColor *)color progressHUDMode:(MBProgressHUDMode)progressHUDMode inView:(UIView *)view;


/**
 *  带有活动指示器的HUD
 *
 *  @param title           标题
 *  @param detailTitle     副标题
 *  @param progressHUDMode 指示器类型
 *  @param view            显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showActivityIndicatorWithTitle:(NSString *)title detailsTitle:(NSString *)detailTitle progressHUDMode:(MBProgressHUDMode)progressHUDMode inView:(UIView *)view;


/**
 *  带有活动指示器的HUD
 *
 *  @param title           标题
 *  @param detailTitle     副标题
 *  @param progressHUDMode 指示器类型
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showActivityIndicatorWithTitle:(NSString *)title detailsTitle:(NSString *)detailTitle progressHUDMode:(MBProgressHUDMode)progressHUDMode;


/**
 *  带有活动指示器的HUD
 *
 *  @param title           标题
 *  @param color           颜色
 *  @param progressHUDMode 指示器类型
 *  @param view            显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showActivityIndicatorWithTitle:(NSString *)title contentColor:(UIColor *)color progressHUDMode:(MBProgressHUDMode)progressHUDMode inView:(UIView *)view;


/**
 *  带有活动指示器的HUD
 *
 *  @param title           标题
 *  @param progressHUDMode 指示器类型
 *  @param view            显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showActivityIndicatorWithTitle:(NSString *)title progressHUDMode:(MBProgressHUDMode)progressHUDMode inView:(UIView *)view;


/**
 *  带有活动指示器的HUD
 *
 *  @param title           标题
 *  @param progressHUDMode 指示器类型
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showActivityIndicatorWithTitle:(NSString *)title progressHUDMode:(MBProgressHUDMode)progressHUDMode;

#pragma mark - 动画HUD
/**
 *  带有自定义动画HUD的HUD
 *
 *  @param title       提醒标题
 *  @param detailTitle 副标题
 *  @param icon       图片
 *  @param color      颜色
 *  @param view       显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showCustomeAnimationTitle:(NSString *)title detailsLabel:(NSString *)detailTitle icon:(NSString *)icon contentColor:(UIColor *)color inView:(UIView *)view;



/**
 *  带有自定义动画HUD的HUD
 *
 *  @param title      提醒标题
 *  @param icon       图片
 *  @param color      颜色
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showCustomeAnimationTitle:(NSString *)title icon:(NSString *)icon contentColor:(UIColor *)color;

#pragma mark - 常用提示状态

/**
 *  成功提醒
 *
 *  @param success 提醒文字
 *  @param color   颜色
 *  @param view    显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showSuccess:(NSString *)success contentColor:(UIColor *)color inView:(UIView *)view;
/**
 *  成功提醒
 *
 *  @param success 提醒文字
 *  @param view    显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showSuccess:(NSString *)success inView:(UIView *)view;
/**
 *  成功提醒
 *
 *  @param success 提醒文字
 *  @param color   颜色
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showSuccess:(NSString *)success contentColor:(UIColor *)color;
/**
 *  成功提醒
 *
 *  @param success 提醒文字
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showSuccess:(NSString *)success;



/**
 *  失败提醒
 *
 *  @param error   提醒文字
 *  @param color   颜色
 *  @param view    显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showError:(NSString *)error contentColor:(UIColor *)color inView:(UIView *)view;
/**
 *  失败提醒
 *
 *  @param error   提醒文字
 *  @param view    显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showError:(NSString *)error inView:(UIView *)view;
/**
 *  失败提醒
 *
 *  @param error   提醒文字
 *  @param color   颜色
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showError:(NSString *)error contentColor:(UIColor *)color;
/**
 *  失败提醒
 *
 *  @param error   提醒文字
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showError:(NSString *)error;


/**
 *  警告提醒
 *
 *  @param info    提醒文字
 *  @param color   颜色
 *  @param view    显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showInfo:(NSString *)info contentColor:(UIColor *)color inView:(UIView *)view;
/**
 *  警告提醒
 *
 *  @param info    提醒文字
 *  @param view    显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showInfo:(NSString *)info inView:(UIView *)view;
/**
 *  警告提醒
 *
 *  @param info    提醒文字
 *  @param color   颜色
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showInfo:(NSString *)info contentColor:(UIColor *)color;
/**
 *  警告提醒
 *
 *  @param info 提醒文字
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showInfo:(NSString *)info;


/**
 *  提醒
 *
 *  @param message 提醒文字
 *  @param color   颜色
 *  @param view    显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showMessage:(NSString *)message contentColor:(UIColor *)color inView:(UIView *)view;
/**
 *  提醒
 *
 *  @param success 提醒文字
 *  @param view    显示的view
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showMessage:(NSString *)success inView:(UIView *)view;
/**
 *  提醒
 *
 *  @param success 提醒文字
 *  @param color   颜色
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showMessage:(NSString *)success contentColor:(UIColor *)color;
/**
 *  提醒
 *
 *  @param success 提醒文字
 *
 *  @return MBProgressHUD对象
 */
+ (MBProgressHUD *)showMessage:(NSString *)success;


#pragma mark - 隐藏HUD
/**
 *  隐藏HUD
 *
 *  @param view 需隐藏HUD所在的View
 */
+ (void)hideHUDForView:(UIView *)view;
/**
 *  隐藏HUD
 */
+ (void)hideHUD;


@end

