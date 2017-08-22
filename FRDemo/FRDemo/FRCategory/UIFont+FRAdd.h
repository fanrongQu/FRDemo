//
//  UIFont+FRAdd.h
//  FRDemo
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (FRAdd)

/**
 *  打印并显示所有字体
 */
+(void)showAllFonts;

/**
 *  宋体(字体缺失)
 */
+(UIFont *)songTypefaceFontOfSize:(CGFloat)size;

/**
 *  微软雅黑：正常字体
 */
+(UIFont *)microsoftYaHeiFontOfSize:(CGFloat)size;


/**
 *  微软雅黑：加粗字体(字体缺失)
 */
+(UIFont *)boldMicrosoftYaHeiFontOfSize:(CGFloat)size;


/**
 *  DroidSansFallback
 */
+(UIFont *)customFontNamedDroidSansFallbackWithFontOfSize:(CGFloat)size;


- (UIFont *)fontOfSize:(CGFloat)size;

- (UIFont *)mediumFontOfSize:(CGFloat)size;

- (UIFont *)semiMediumFontOfSize:(CGFloat)size;

@end
