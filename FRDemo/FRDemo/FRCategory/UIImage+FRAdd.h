//
//  UIImage+FRAdd.h
//  FRDemo
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *  水印方向
 */
typedef NS_ENUM(NSInteger,ImageWaterDirect) {
    
    //左上
    ImageWaterDirectTopLeft=0,
    
    //右上
    ImageWaterDirectTopRight,
    
    //左下
    ImageWaterDirectBottomLeft,
    
    //右下
    ImageWaterDirectBottomRight,
    
    //正中
    ImageWaterDirectCenter
    
};

@interface UIImage (FRAdd)
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


//固定图片的方向，不随着屏幕旋转而改变方向
- (UIImage *)fixOrientation;


#pragma mark - 水印
-(UIImage *)waterWithText:(NSString *)text direction:(ImageWaterDirect)direction fontColor:(UIColor *)fontColor fontPoint:(CGFloat)fontPoint marginXY:(CGPoint)marginXY;


-(UIImage *)waterWithWaterImage:(UIImage *)waterImage direction:(ImageWaterDirect)direction waterSize:(CGSize)waterSize  marginXY:(CGPoint)marginXY;


/**
 *  保存相册
 *
 *  @param completeBlock 成功回调
 *  @param completeBlock 出错回调
 */
- (void)savedPhotosAlbum:(void(^)())completeBlock failBlock:(void(^)())failBlock;



@end
