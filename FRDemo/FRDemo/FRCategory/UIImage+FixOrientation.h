//
//  UIImage+FixOrientation.h
//  image
//
//  Created by muxi on 14/11/12.
//  Copyright (c) 2014年 muxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FixOrientation)
//固定图片的方向，不随着屏幕旋转而改变方向
- (UIImage *)fixOrientation;

@end
