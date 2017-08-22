//
//  UILabel+FRAdd.h
//  FRDemo
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (FRAdd)

///自定义label的扩展
+ (instancetype)lableWithParagraph:(NSString *)para numberOfLines:(NSInteger)lines font:(UIFont *)font textColor:(UIColor *)color lineSpacing:(CGFloat)lineSpace;

+ (instancetype)lableWithParagraph:(NSString *)para numberOfLines:(NSInteger)lines font:(UIFont *)font textColor:(UIColor *)color lineSpacing:(CGFloat)lineSpace textAlignment:(NSTextAlignment)textAlignment;

// 设置label行间距
+ (void)setLineSpaceForLabel:(UILabel *)label lineSpace:(CGFloat)lineSpace;

@end
