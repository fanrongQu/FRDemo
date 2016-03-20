//
//  SettingMacro.h
//  苏格系统
//
//  Created by 1860 on 16/3/9.
//  Copyright © 2016年 QuFanrong. All rights reserved.
//

#ifndef SettingMacro_h
#define SettingMacro_h
/** 代理 */
#define DELEGATE ((AppDelegate*)[[UIApplication sharedApplication]delegate])
/** 屏幕大小 */
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds
/** 屏幕宽度 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
/** 屏幕高度 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
/** 字体大小 */
#define FONTSIZE(size) [UIFont systemFontOfSize:(size)]
/** 颜色 */
#define UICOLOR_RGB(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/1.0]
/** 主题色 */
#define SUBJECT_COLOR UICOLOR_RGB(52, 189, 180, 1)
/** 字体色 */
#define TEXT_COLOR UICOLOR_RGB(252, 100, 0, 1)
/** 券背景色 */
#define TICKET_COLOR UICOLOR_RGB(255, 102, 102, 1)

#endif /* SettingMacro_h */
