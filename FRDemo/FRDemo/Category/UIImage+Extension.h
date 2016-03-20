//
//  UIImage+Extension.h
//  FRDemo
//
//  Created by 1860 on 16/1/5.
//  Copyright © 2016年 QuFanrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  对图片进行拉伸(拉伸图片中心点)
 *
 *  @param name 图片名
 *
 *  @return 拉伸后的图片
 */
+ (UIImage *)resizableImage:(NSString *)name;

/**
 *  裁剪图片使图片不失真
 *
 *  @param image 图片
 *  @param width 图片宽度
 *  @param height 图片高度
 */
+ (UIImage *)cutImage:(UIImage*)image withImgWidth:(CGFloat)width imgHeight:(CGFloat)height;
@end