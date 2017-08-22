//
//  UIBarButtonItem+FRAdd.h
//  FRDemo
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (FRAdd)

+ (UIBarButtonItem *)ItemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)ItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

@end
