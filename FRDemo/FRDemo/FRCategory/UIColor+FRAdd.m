//
//  UIColor+FRAdd.m
//  FRDemo
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import "UIColor+FRAdd.h"

@implementation UIColor (FRAdd)


#pragma mark  十六进制颜色
+ (UIColor *)colorWithHexString:(NSString *)hexColorString{
    return [self colorWithHexString:hexColorString alpha:1.0f];
}

#pragma mark  十六进制颜色
+ (UIColor *)colorWithHexString:(NSString *)hexColorString alpha:(float)alpha{
    
    if(hexColorString.length != 6 && hexColorString.length != 7) {
        return [UIColor blackColor];
    }
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexColorString];
    if (hexColorString.length == 7) {
        [scanner setScanLocation:1];
    }
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:alpha];
}

@end
