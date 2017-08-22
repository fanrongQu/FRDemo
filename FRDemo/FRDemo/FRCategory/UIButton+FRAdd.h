//
//  UIButton+FRAdd.h
//  FRButton-master
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 fanrongQu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIButtonEdgeInsetsStyle) {
    UIButtonEdgeInsetsStyleTop, // image在上，label在下
    UIButtonEdgeInsetsStyleLeft, // image在左，label在右
    UIButtonEdgeInsetsStyleBottom, // image在下，label在上
    UIButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (FRAdd)

#pragma mark - 修改布局
/**
 设置按钮布局类型

 @param style 按钮布局类型
 */
- (void)setButtonEdgeInsetsStyle:(UIButtonEdgeInsetsStyle)style margin:(CGFloat)margin;

#pragma mark - 设置标题
/**
 *  设置按钮标题
 *
 *  @param normalTitle    普通状态
 *  @param highlightTitle 高亮状态
 */
- (void)setNormalTitle:(NSString *)normalTitle highlightTitle:(NSString *)highlightTitle;

/**
 *  设置按钮标题
 *
 *  @param normalTitle   普通状态
 *  @param selectedTitle 选中状态
 */
- (void)setNormalTitle:(NSString *)normalTitle selectedTitle:(NSString *)selectedTitle;

/**
 *  设置按钮标题
 *
 *  @param normalTitle    普通状态
 *  @param highlightTitle 高亮状态
 *  @param selectedTitle  选中状态
 */
- (void)setNormalTitle:(NSString *)normalTitle highlightTitle:(NSString *)highlightTitle selectedTitle:(NSString *)selectedTitle;

#pragma mark - 设置标题颜色
/**
 *  设置按钮颜色
 *
 *  @param normalColor    普通状态
 *  @param highlightColor 高亮状态
 */
- (void)setTitleNormalColor:(UIColor *)normalColor highlightColor:(UIColor *)highlightColor;

/**
 *  设置按钮颜色
 *
 *  @param normalColor   普通状态
 *  @param selectedColor 选中状态
 */
- (void)setTitleNormalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor;

/**
 *  设置按钮颜色
 *
 *  @param normalColor    普通状态
 *  @param highlightColor 高亮状态
 *  @param selectedColor 选中状态
 */
- (void)setTitleNormalColor:(UIColor *)normalColor highlightColor:(UIColor *)highlightColor selectedColor:(UIColor *)selectedColor;



#pragma mark - 设置图片
/**
 *  设置按钮图片
 *
 *  @param normalImage    普通状态
 *  @param highlightImage 高亮状态
 */
- (void)setImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage;

/**
 *  设置按钮图片
 *
 *  @param normalImage   普通状态
 *  @param selectedImage 选中状态
 */
- (void)setImageWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage;

/**
 *  设置按钮图片
 *
 *  @param normalImage    普通状态
 *  @param highlightImage 高亮状态
 *  @param selectedImage  选中状态
 */
- (void)setImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage selectedImage:(UIImage *)selectedImage;


#pragma mark - 设置背景
/**
 *  设置按钮背景图片
 *
 *  @param normalImage    普通状态
 *  @param highlightImage 高亮状态
 */
- (void)setBackgroundImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage;

/**
 *  设置按钮背景图片
 *
 *  @param normalImage   普通状态
 *  @param selectedImage 选中状态
 */
- (void)setBackgroundImageWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage;

/**
 *  设置按钮背景图片
 *
 *  @param normalImage    普通状态
 *  @param highlightImage 高亮状态
 *  @param selectedImage  选中状态
 */
- (void)setBackgroundImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage selectedImage:(UIImage *)selectedImage;


@end
