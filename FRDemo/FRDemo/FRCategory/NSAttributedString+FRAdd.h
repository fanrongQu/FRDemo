//
//  NSAttributedString+FRAdd.h
//  FRDemo
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (FRAdd)

//设置字体间距
+ (NSAttributedString *)attributedStringWithString:(NSString *)string;

//设置删除线
+ (NSMutableAttributedString *)strikeShroughStringWithString:(NSString *)string color:(UIColor *)color;

@end
