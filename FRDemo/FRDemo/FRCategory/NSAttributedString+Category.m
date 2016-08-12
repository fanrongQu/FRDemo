//
//  NSAttributedString+Category.m
//  Haidao
//
//  Created by 1860 on 16/8/9.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//

#import "NSAttributedString+Category.h"

@implementation NSAttributedString (Category)


+ (NSAttributedString *)attributedStringWithString:(NSString *)labelText {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    paraStyle.alignment = NSTextAlignmentLeft;
    
    paraStyle.lineSpacing = 2.1f; //设置行间距
    
    paraStyle.hyphenationFactor = 1.0;
    
    paraStyle.firstLineHeadIndent = 0.0;
    
    paraStyle.paragraphSpacingBefore = 0.0;
    
    paraStyle.headIndent = 0;
    
    paraStyle.tailIndent = 0;
    
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.2f};
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:labelText attributes:dic];

    return attributeStr;
}

@end
