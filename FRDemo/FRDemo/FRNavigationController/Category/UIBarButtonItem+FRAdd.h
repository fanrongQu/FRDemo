//
//  UIBarButtonItem+FRAdd.h
//  FRKit-master
//
//  Created by mac on 2017/10/24.
//  Copyright © 2017年 fanrongQu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (FRAdd)


/**
 快速创建一个带image的UIBarButtonItem
 
 @param image 图片
 @param target target对象
 @param action 响应事件
 @return 创建的UIBarButtonItem对象
 */

+ (instancetype _Nullable )itemWithImage:(nullable UIImage *)image target:(nullable id)target action:(nullable SEL)action;

/**
 快速创建一个带image的UIBarButtonItem
 
 @param image 图片
 @param imageEdgeInsets 图片偏移
 @param target target对象
 @param action 响应事件
 @return 创建的UIBarButtonItem对象
 */
+ (instancetype _Nullable )itemWithImage:(nullable UIImage *)image imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets target:(nullable id)target action:(nullable SEL)action;

/**
 快速创建一个带image的UIBarButtonItem

 @param image 图片
 @param higeLightedImage 高亮图片
 @param imageEdgeInsets 图片偏移
 @param target target对象
 @param action 响应事件
 @return 创建的UIBarButtonItem对象
 */
+ (instancetype _Nullable )itemWithImage:(nullable UIImage *)image higeLightedImage:(nullable UIImage *)higeLightedImage imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets target:(nullable id)target action:(nullable SEL)action;



/**
 快速创建一个带title的UIBarButtonItem
 
 @param title 文字
 @param target target对象
 @param action 响应事件
 @return 创建的UIBarButtonItem对象
 */
+ (instancetype _Nonnull )itemWithTitle:(nullable NSString *)title
                                 target:(nullable id)target
                                 action:(nullable SEL)action;

/**
 快速创建一个带title的UIBarButtonItem
 
 @param title 文字
 @param titleEdgeInsets 文字偏移
 @param target target对象
 @param action 响应事件
 @return 创建的UIBarButtonItem对象
 */
+ (instancetype _Nonnull )itemWithTitle:(nullable NSString *)title
                        titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
                                 target:(nullable id)target
                                 action:(nullable SEL)action;

/**
 快速创建一个带title的UIBarButtonItem

 @param title 文字
 @param font 字体大小
 @param titleColor 字体颜色
 @param highlightedColor 字体高亮颜色
 @param titleEdgeInsets 文字偏移
 @param target target对象
 @param action 响应事件
 @return 创建的UIBarButtonItem对象
 */
+ (instancetype _Nonnull )itemWithTitle:(nullable NSString *)title
                                   font:(UIFont *_Nullable)font
                             titleColor:(UIColor *_Nullable)titleColor
                       highlightedColor:(UIColor *_Nullable)highlightedColor
                        titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
                                 target:(nullable id)target
                                 action:(nullable SEL)action;

@end
