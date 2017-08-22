//
//  UIColor+FRAdd.h
//  FRDemo
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 颜色 */
#define kFRColor_RGB(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/1.0]

@interface UIColor (FRAdd)

/**
 *  十六进制颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)hexColorString;

/**
 *  十六进制颜色:含alpha
 */
+ (UIColor *)colorWithHexString:(NSString *)hexColorString alpha:(float)alpha;

@end
