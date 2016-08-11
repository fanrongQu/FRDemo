//
//  PositionBtn.m
//  苏格联盟
//
//  Created by 1860 on 16/5/5.
//  Copyright © 2016年 QuFanrong. All rights reserved.
//

#import "PositionBtn.h"

@implementation PositionBtn

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = contentRect.size.width - 12;
    CGFloat height = contentRect.size.height;
    CGRect frame = CGRectMake(x, y, width, height);
    return frame;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat x = contentRect.size.width - 12;
    CGFloat y = (contentRect.size.height - 12) * 0.5;
    CGFloat width = 10;
    CGFloat height = 12;
    CGRect frame = CGRectMake(x, y, width, height);
    return frame;
}

@end
