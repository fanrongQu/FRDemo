//
//  NSAttributedString+FRAdd.m
//  FRDemo
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import "NSAttributedString+FRAdd.h"

@implementation NSAttributedString (FRAdd)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string {
    
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
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:string attributes:dic];
    
    return attributeStr;
}

+ (NSMutableAttributedString *)strikeShroughStringWithString:(NSString *)string color:(UIColor *)color {
    
    string = [NSString stringWithFormat:@" %@ ",string];
    //从这里开始就是设置富文本的属性
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    //下面开始是设置线条的风格：
    //第一个参数addAttribute:是设置要中线（删除线）还是下划线。
    //NSStrikethroughStyleAttributeName：这种是从文本中间穿过，也就是删除线。
    //NSUnderlineStyleAttributeName：这种是下划线。
    
    //第二个参数value：是设置线条的风格：虚线，实现，点线......
    //第二参数需要同时设置Pattern和style才能让线条显示。
    
    //第三个参数range:是设置线条的长度，切记，不能超过字符串的长度，否则会报错。
    NSInteger length = [string length];
    [attributeStr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
    
    //下列是设置线条的颜色
    //第一个参数就是选择设置中线的颜色还是下划线的颜色，如果上面选择的是中线，这里就要选择中线，否则颜色设置不上去。
    //第二个参数很简单，就是颜色而已。
    //第三个参数：同上。
    [attributeStr addAttribute:NSStrikethroughColorAttributeName value:color range:NSMakeRange(0, length)];
    return attributeStr;
}

@end
