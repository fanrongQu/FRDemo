//
//  UILabel+FRAdd.m
//  FRDemo
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import "UILabel+FRAdd.h"

@implementation UILabel (FRAdd)

+ (instancetype)lableWithParagraph:(NSString *)para numberOfLines:(NSInteger)lines font:(UIFont *)font textColor:(UIColor *)color lineSpacing:(CGFloat)lineSpace{
    
    UILabel *lable = [[UILabel alloc] init];
    lable.text = para;
    // 设置文字行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:lable.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [lable.text length])];
    lable.attributedText = attributedString;
    
    lable.textAlignment = NSTextAlignmentCenter;
    lable.adjustsFontSizeToFitWidth = YES;
    lable.numberOfLines = lines;
    lable.font = font;
    lable.textColor = color;
    
    return lable;
}

+ (instancetype)lableWithParagraph:(NSString *)para numberOfLines:(NSInteger)lines font:(UIFont *)font textColor:(UIColor *)color lineSpacing:(CGFloat)lineSpace textAlignment:(NSTextAlignment)textAlignment{
    UILabel *lable = [[UILabel alloc] init];
    lable.text = para;
    // 设置文字行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:lable.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [lable.text length])];
    lable.attributedText = attributedString;
    
    lable.textAlignment = textAlignment;
    lable.adjustsFontSizeToFitWidth = YES;
    lable.numberOfLines = lines;
    lable.font = font;
    lable.textColor = color;
    
    return lable;
}

#pragma mark --- 设置label行间距
+ (void)setLineSpaceForLabel:(UILabel *)label lineSpace:(CGFloat)lineSpace{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
    label.attributedText = attributedString;
}


@end
