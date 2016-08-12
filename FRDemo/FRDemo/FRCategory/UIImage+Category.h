//
//  UIImage+Category.h
//  FRCategory
//
//  Created by 1860 on 16/8/12.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)


/*
 *  圆形图片
 */
@property (nonatomic,strong,readonly) UIImage *roundImage;


/**
 *  从给定UIView中截图：UIView转UIImage
 */
+(UIImage *)cutFromView:(UIView *)view;

/**
 *  直接截屏
 */
+(UIImage *)cutScreen;

/**
 *  从给定UIImage和指定Frame截图：
 */
-(UIImage *)cutWithFrame:(CGRect)frame;

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

/**
 *  拉伸图片:自定义比例
 */
+(UIImage *)resizeWithImageName:(NSString *)name leftCap:(CGFloat)leftCap topCap:(CGFloat)topCap;



/**
 *  拉伸图片
 */
+(UIImage *)resizeWithImageName:(NSString *)name;


/**
 *  保存相册
 *
 *  @param completeBlock 成功回调
 *  @param completeBlock 出错回调
 */
- (void)savedPhotosAlbum:(void(^)())completeBlock failBlock:(void(^)())failBlock;



@end
