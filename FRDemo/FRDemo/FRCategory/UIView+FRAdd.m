//
//  UIView+FRAdd.m
//  FRDemo
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import "UIView+FRAdd.h"

@implementation UIView (FRAdd)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}


#pragma mark - 设置圆角、边框

/**
 *  设置View的layer属性
 *
 *  @param cornerRadius 圆角半径
 */
- (void)setLayerWithCornerRadius:(CGFloat)cornerRadius {
    
    [self.layer setCornerRadius:cornerRadius];
    [self.layer setMasksToBounds:YES];
}

/**
 *  设置View的layer属性
 *
 *  @param borderWidth  边框宽度
 *  @param borderColor  边框颜色
 */
- (void)setLayerWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    
    [self.layer setBorderWidth:borderWidth];
    [self.layer setBorderColor:borderColor.CGColor];
    [self.layer setMasksToBounds:YES];
}

/**
 *  设置View的layer属性
 *
 *  @param cornerRadius 圆角半径
 *  @param borderWidth  边框宽度
 *  @param borderColor  边框颜色
 */
- (void)setLayerWithCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    
    [self.layer setCornerRadius:cornerRadius];
    [self.layer setBorderWidth:borderWidth];
    [self.layer setBorderColor:borderColor.CGColor];
    [self.layer setMasksToBounds:YES];
}


/**
 *  添加边框：注给scrollView添加会出错
 *
 *  @param direct 方向
 *  @param color  颜色
 *  @param width  线宽
 */
- (void)addSingleBorder:(UIViewBorderDirect)direct color:(UIColor*)color width:(CGFloat)width {
    
    UIView* line = [[UIView alloc] init];
    
    //设置颜色
    line.backgroundColor = color;
    
    //添加
    [self addSubview:line];
    
    //禁用ar
    line.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary* views = NSDictionaryOfVariableBindings(line);
    NSDictionary* metrics = @{ @"w" : @(width),
                               @"y" : @(self.frame.size.height - width),
                               @"x" : @(self.frame.size.width - width) };
    NSString* vfl_H = @"";
    NSString* vfl_W = @"";
    
    //上
    if (UIViewBorderDirectTop == direct) {
        vfl_H = @"H:|-0-[line]-0-|";
        vfl_W = @"V:|-0-[line(==w)]";
    }
    //左
    if (UIViewBorderDirectLeft == direct) {
        vfl_H = @"H:|-0-[line(==w)]";
        vfl_W = @"V:|-0-[line]-0-|";
    }
    //下
    if (UIViewBorderDirectBottom == direct) {
        vfl_H = @"H:|-0-[line]-0-|";
        vfl_W = @"V:[line(==w)]-0-|";
    }
    //右
    if (UIViewBorderDirectRight == direct) {
        vfl_H = @"H:[line(==w)]-0-|";
        vfl_W = @"V:|-0-[line]-0-|";
    }
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl_H options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl_W options:0 metrics:metrics views:views]];
}


@end
