//
//  UIView+Category.m
//  FRCategory
//
//  Created by 1860 on 16/8/12.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)


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

/**
 *  添加边框：注给scrollView添加会出错
 *
 *  @param direct 方向
 *  @param color  颜色
 *  @param width  线宽
 */
- (void)addSingleBorder:(UIViewBorderDirect)direct color:(UIColor*)color width:(CGFloat)width
{
    
    UIView* line = [[UIView alloc] init];
    
    //设置颜色
    line.backgroundColor = color;
    
    //添加
    [self addSubview:line];
    
    //禁用ar
    line.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary* views = NSDictionaryOfVariableBindings(line);
    NSDictionary* metrics = @{ @"w" : @(width),
                               @"y" : @(self.height - width),
                               @"x" : @(self.width - width) };
    
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

/**
 *  自动从xib创建视图
 */
+ (instancetype)viewFromXIB
{
    
    NSString* name = NSStringFromClass(self);
    
    UIView* xibView = [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] firstObject];
    
    if (xibView == nil) {
        NSLog(@"CoreXibView：从xib创建视图失败，当前类是：%@", name);
    }
    
    return xibView;
}

#pragma mark 添加一组子view：
- (void)addSubviewsWithArray:(NSArray*)subViews
{
    
    for (UIView* view in subViews) {
        
        [self addSubview:view];
    }
}

#pragma mark 圆角处理
- (void)setRadius:(CGFloat)r
{
    
    if (r <= 0)
        r = self.bounds.size.width * .5f;
    
    //圆角半径
    self.layer.cornerRadius = r;
    
    //强制
    self.layer.masksToBounds = YES;
}

- (CGFloat)radius
{
    return 0;
}

/**
 *  添加底部的边线
 */
- (void)setBottomBorderColor:(UIColor*)bottomBorderColor
{
}

- (UIColor*)bottomBorderColor
{
    return nil;
}

/**
 *  添加边框
 */
- (void)setBorder:(UIColor*)color width:(CGFloat)width
{
    CALayer* layer = self.layer;
    layer.borderColor = color.CGColor;
    layer.borderWidth = width;
}


/**
 *  批量移除视图
 *
 *  @param views 需要移除的视图数组
 */
+ (void)removeViews:(NSArray*)views
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        for (UIView* view in views) {
            [view removeFromSuperview];
        }
    });
}



@end
