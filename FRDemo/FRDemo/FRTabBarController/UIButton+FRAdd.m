//
//  UIButton+FRAdd.m
//  FRButton-master
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 fanrongQu. All rights reserved.
//

#import "UIButton+FRAdd.h"

@implementation UIButton (FRAdd)

#pragma mark - 修改布局
- (void)setButtonEdgeInsetsStyle:(UIButtonEdgeInsetsStyle)style margin:(CGFloat)margin {
    
    CGSize imageSize = self.imageView.intrinsicContentSize;
    CGSize titleSize = self.titleLabel.intrinsicContentSize;
    CGSize selfSize = self.bounds.size;
    CGFloat halfMargin = margin*0.5;
    //如果没有文字/图片的时候不做处理
    if (imageSize.width == 0 || titleSize.width == 0) return;
    
    //解决文字没显示完调整布局图片发生的偏移
    CGFloat widthErr = (imageSize.width + titleSize.width - selfSize.width);
    if (widthErr < -10) {
        widthErr = 0;
    }else {
        widthErr += widthErr;
    }

    switch (style) {
        case UIButtonEdgeInsetsStyleTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-titleSize.height*0.5 - halfMargin, titleSize.width*0.5 + widthErr, titleSize.height*0.5 + halfMargin, -titleSize.width*0.5 + widthErr);
            self.titleEdgeInsets = UIEdgeInsetsMake(imageSize.height*0.5 + halfMargin, -imageSize.width, -imageSize.height*0.5 - halfMargin, 0);
            break;
            
        case UIButtonEdgeInsetsStyleLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, margin, 0, 0);
            break;
            
        case UIButtonEdgeInsetsStyleBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(titleSize.height*0.5 + halfMargin, titleSize.width*0.5 + widthErr, -titleSize.height*0.5 - halfMargin, -titleSize.width*0.5 + widthErr);
            self.titleEdgeInsets = UIEdgeInsetsMake(-imageSize.height*0.5 - halfMargin, -imageSize.width, imageSize.height*0.5 + halfMargin, 0);
            break;
            
        case UIButtonEdgeInsetsStyleRight:
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, 0, imageSize.width + margin);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width - widthErr, 0, -titleSize.width + widthErr);
            break;
            
        default:
            break;
    }
    [self.layer setMasksToBounds:YES];
}

#pragma mark - 设置标题
/**
 *  设置按钮标题
 *
 *  @param normalTitle    普通状态
 *  @param highlightTitle 高亮状态
 */
- (void)setNormalTitle:(NSString *)normalTitle highlightTitle:(NSString *)highlightTitle {
    [self setTitle:normalTitle forState:UIControlStateNormal];
    [self setTitle:highlightTitle forState:UIControlStateHighlighted];
}

/**
 *  设置按钮标题
 *
 *  @param normalTitle   普通状态
 *  @param selectedTitle 选中状态
 */
- (void)setNormalTitle:(NSString *)normalTitle selectedTitle:(NSString *)selectedTitle {
    [self setTitle:normalTitle forState:UIControlStateNormal];
    [self setTitle:selectedTitle forState:UIControlStateSelected];
}

/**
 *  设置按钮标题
 *
 *  @param normalTitle    普通状态
 *  @param highlightTitle 高亮状态
 *  @param selectedTitle  选中状态
 */
- (void)setNormalTitle:(NSString *)normalTitle highlightTitle:(NSString *)highlightTitle selectedTitle:(NSString *)selectedTitle {
    [self setTitle:normalTitle forState:UIControlStateNormal];
    [self setTitle:highlightTitle forState:UIControlStateHighlighted];
    [self setTitle:selectedTitle forState:UIControlStateSelected];
}

#pragma mark - 设置标题颜色
/**
 *  设置按钮颜色
 *
 *  @param normalColor    普通状态
 *  @param highlightColor 高亮状态
 */
- (void)setTitleNormalColor:(UIColor *)normalColor highlightColor:(UIColor *)highlightColor {
    [self setTitleColor:normalColor forState:UIControlStateNormal];
    [self setTitleColor:highlightColor forState:UIControlStateHighlighted];
}

/**
 *  设置按钮颜色
 *
 *  @param normalColor   普通状态
 *  @param selectedColor 选中状态
 */
- (void)setTitleNormalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor {
    [self setTitleColor:normalColor forState:UIControlStateNormal];
    [self setTitleColor:selectedColor forState:UIControlStateSelected];
}

/**
 *  设置按钮颜色
 *
 *  @param normalColor    普通状态
 *  @param highlightColor 高亮状态
 *  @param selectedColor 选中状态
 */
- (void)setTitleNormalColor:(UIColor *)normalColor highlightColor:(UIColor *)highlightColor selectedColor:(UIColor *)selectedColor {
    [self setTitleColor:normalColor forState:UIControlStateNormal];
    [self setTitleColor:highlightColor forState:UIControlStateHighlighted];
    [self setTitleColor:selectedColor forState:UIControlStateSelected];
}


#pragma mark - 设置图片
/**
 *  设置按钮图片
 *
 *  @param normalImage    普通状态
 *  @param highlightImage 高亮状态
 */
- (void)setImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage {
    [self setImage:normalImage forState:UIControlStateNormal];
    [self setImage:highlightImage forState:UIControlStateHighlighted];
}

/**
 *  设置按钮图片
 *
 *  @param normalImage   普通状态
 *  @param selectedImage 选中状态
 */
- (void)setImageWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage {
    [self setImage:normalImage forState:UIControlStateNormal];
    [self setImage:selectedImage forState:UIControlStateSelected];
}

/**
 *  设置按钮图片
 *
 *  @param normalImage    普通状态
 *  @param highlightImage 高亮状态
 *  @param selectedImage  选中状态
 */
- (void)setImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage selectedImage:(UIImage *)selectedImage {
    [self setImage:normalImage forState:UIControlStateNormal];
    [self setImage:highlightImage forState:UIControlStateHighlighted];
    [self setImage:selectedImage forState:UIControlStateSelected];
}


#pragma mark - 设置背景
/**
 *  设置按钮背景图片
 *
 *  @param normalImage    普通状态
 *  @param highlightImage 高亮状态
 */
- (void)setBackgroundImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage {
    [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    [self setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
}

/**
 *  设置按钮背景图片
 *
 *  @param normalImage   普通状态
 *  @param selectedImage 选中状态
 */
- (void)setBackgroundImageWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage {
    [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    [self setBackgroundImage:selectedImage forState:UIControlStateSelected];
}

/**
 *  设置按钮背景图片
 *
 *  @param normalImage    普通状态
 *  @param highlightImage 高亮状态
 *  @param selectedImage  选中状态
 */
- (void)setBackgroundImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage selectedImage:(UIImage *)selectedImage {
    [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    [self setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [self setBackgroundImage:selectedImage forState:UIControlStateSelected];
}

@end
