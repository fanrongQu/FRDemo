//
//  UIView+FRAdd.h
//  FRDemo
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIViewBorderDirect) {
    //上
    UIViewBorderDirectTop = 0,
    //左
    UIViewBorderDirectLeft,
    //下
    UIViewBorderDirectBottom,
    //右
    UIViewBorderDirectRight,
};

@interface UIView (FRAdd)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

#pragma mark - 设置圆角、边框
/**
 *  设置View的layer属性
 *
 *  @param cornerRadius 圆角半径
 */
- (void)setLayerWithCornerRadius:(CGFloat)cornerRadius;

/**
 *  设置View的layer属性
 *
 *  @param borderWidth  边框宽度
 *  @param borderColor  边框颜色
 */
- (void)setLayerWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  设置View的layer属性
 *
 *  @param cornerRadius 圆角半径
 *  @param borderWidth  边框宽度
 *  @param borderColor  边框颜色
 */
- (void)setLayerWithCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;


/**
 *  添加边框：注给scrollView添加会出错
 *
 *  @param direct 方向
 *  @param color  颜色
 *  @param width  线宽
 */
- (void)addSingleBorder:(UIViewBorderDirect)direct color:(UIColor*)color width:(CGFloat)width;

@end
