//
//  UIFont+FRAdd.m
//  FRDemo
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import "UIFont+FRAdd.h"

#define IN_IPHONE_PLUS ([[UIScreen mainScreen] bounds].size.width >= 414)

@implementation UIFont (FRAdd)

#pragma mark  打印并显示所有字体

+(void)showAllFonts{
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames ){
        printf( "Family: %s \n", [familyName UTF8String] );
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames ){
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }
    }
}

#pragma mark  宋体
+(UIFont *)songTypefaceFontOfSize:(CGFloat)size{
    
    return [UIFont fontWithName:@"经典宋体简" size:size];
    
}

#pragma mark  微软雅黑
+(UIFont *)microsoftYaHeiFontOfSize:(CGFloat)size{
    return [UIFont fontWithName:@"MicrosoftYaHei" size:size];
}


#pragma mark  微软雅黑
+(UIFont *)boldMicrosoftYaHeiFontOfSize:(CGFloat)size{
    return [UIFont fontWithName:@"MicrosoftYaHei-Bold" size:size];
}


#pragma mark  DroidSansFallback
+(UIFont *)customFontNamedDroidSansFallbackWithFontOfSize:(CGFloat)size{
    return [UIFont fontWithName:@"DroidSansFallback" size:size];
}


- (UIFont *)fontOfSize:(CGFloat)size {
    return IN_IPHONE_PLUS?[UIFont systemFontOfSize:size]:[UIFont systemFontOfSize:size - 1];
}

- (UIFont *)mediumFontOfSize:(CGFloat)size {
    return IN_IPHONE_PLUS?[UIFont systemFontOfSize:size weight:0.2]:[UIFont systemFontOfSize:size - 1 weight:0.2];
}
- (UIFont *)semiMediumFontOfSize:(CGFloat)size {
    return IN_IPHONE_PLUS?[UIFont systemFontOfSize:size weight:0.12]:[UIFont systemFontOfSize:size - 1 weight:0.12];
}


@end
