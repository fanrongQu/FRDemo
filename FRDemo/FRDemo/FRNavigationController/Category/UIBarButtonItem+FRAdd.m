//
//  UIBarButtonItem+FRAdd.m
//  FRKit-master
//
//  Created by mac on 2017/10/24.
//  Copyright © 2017年 fanrongQu. All rights reserved.
//

#import "UIBarButtonItem+FRAdd.h"

@implementation UIBarButtonItem (FRAdd)

+ (instancetype _Nullable )itemWithImage:(nullable UIImage *)image target:(nullable id)target action:(nullable SEL)action {
    return [self itemWithImage:image higeLightedImage:nil imageEdgeInsets:UIEdgeInsetsZero target:target action:action];
}

+ (instancetype _Nullable )itemWithImage:(nullable UIImage *)image imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets target:(nullable id)target action:(nullable SEL)action {
    return [self itemWithImage:image higeLightedImage:nil imageEdgeInsets:imageEdgeInsets target:target action:action];
}

+ (instancetype _Nullable )itemWithImage:(nullable UIImage *)image
                        higeLightedImage:(nullable UIImage *)higeLightedImage
                         imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
                                  target:(nullable id)target
                                  action:(nullable SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [button setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    if (higeLightedImage) [button setImage:higeLightedImage forState:UIControlStateHighlighted];
    
    [button sizeToFit];
    if (button.bounds.size.width < 40) {
        CGFloat width = 40 / button.bounds.size.height * button.bounds.size.width;
        button.bounds = CGRectMake(0, 0, width, 40);
    }
    button.imageEdgeInsets = imageEdgeInsets;
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}



+ (instancetype _Nonnull )itemWithTitle:(nullable NSString *)title
                                 target:(nullable id)target
                                 action:(nullable SEL)action {
    return [self itemWithTitle:title font:nil titleColor:[UIBarButtonItem appearance].tintColor highlightedColor:nil titleEdgeInsets:UIEdgeInsetsZero target:target action:action];
}



+ (instancetype _Nonnull )itemWithTitle:(nullable NSString *)title
                        titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
                                 target:(nullable id)target
                                 action:(nullable SEL)action {
    
    return [self itemWithTitle:title font:nil titleColor:[UIBarButtonItem appearance].tintColor highlightedColor:nil titleEdgeInsets:titleEdgeInsets target:target action:action];
}



+ (instancetype _Nonnull )itemWithTitle:(nullable NSString *)title
                                   font:(UIFont *)font
                             titleColor:(UIColor *)titleColor
                       highlightedColor:(UIColor *)highlightedColor
                        titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
                                 target:(nullable id)target
                                 action:(nullable SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = font?font:[UIFont systemFontOfSize:14];
    [button setTitleColor:titleColor?titleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:highlightedColor?highlightedColor:nil forState:UIControlStateHighlighted];
    button.titleEdgeInsets = titleEdgeInsets;
    [button sizeToFit];
    
    if (button.bounds.size.width < 40) {
        CGFloat width = 40 / button.bounds.size.height * button.bounds.size.width;
        button.bounds = CGRectMake(0, 0, width, 40);
    }
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
