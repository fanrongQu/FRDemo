//
//  CALayer+FRAdd.h
//  FRDemo
//
//  Created by mac on 2017/8/22.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger,AnimationReverDirectionType) {
    
    AnimationReverDirectionTypeX=0,
    
    AnimationReverDirectionTypeY,
    
    AnimationReverDirectionTypeZ
};

/*
 *  动画类型
 */
typedef NS_ENUM(NSInteger,TransitionAnimType) {
    //水波
    TransitionAnimTypeRippleEffect=0,
    //吸走
    TransitionAnimTypeSuckEffect,
    //翻开书本
    TransitionAnimTypePageCurl,
    //正反翻转
    TransitionAnimTypeOglFlip,
    //正方体
    TransitionAnimTypeCube,
    //push推开
    TransitionAnimTypeReveal,
    //合上书本
    TransitionAnimTypePageUnCurl,
    //随机
    TransitionAnimTypeRamdom,
    
};


/*
 *  动画方向
 */
typedef NS_ENUM(NSInteger,TransitionSubType) {
    //从上
    TransitionSubtypesFromTop=0,
    //从左
    TransitionSubtypesFromLeft,
    //从下
    TransitionSubtypesFromBotoom,
    //从右
    TransitionSubtypesFromRight,
    //随机
    TransitionSubtypesFromRamdom,
    
};


/*
 *  动画曲线
 */
typedef NS_ENUM(NSInteger,TransitionCurve) {
    //默认
    TransitionCurveDefault,
    //缓进
    TransitionCurveEaseIn,
    //缓出
    TransitionCurveEaseOut,
    //缓进缓出
    TransitionCurveEaseInEaseOut,
    //线性
    TransitionCurveLinear,
    //随机
    TransitionCurveRamdom,
    
};

@interface CALayer (FRAdd)

#pragma mark - animantion

/** 封装的关键帧动画 */
- (CAAnimation *)animWithKeyPath:(NSString *)keyPath animationValues:(NSArray *)animationValues duration:(NSTimeInterval)duration repeatCount:(NSUInteger)repeatCount;

- (CAAnimation *)animationRever:(AnimationReverDirectionType)animationReverDirectionType duration:(NSTimeInterval)duration isReverse:(BOOL)isReverse repeatCount:(NSUInteger)repeatCount;

/**
 *  转场动画
 *
 *  @param animType 转场动画类型
 *  @param subtype  转动动画方向
 *  @param curve    转动动画曲线
 *  @param duration 转动动画时长
 *
 *  @return 转场动画实例
 */
-(CATransition *)transitionWithAnimType:(TransitionAnimType)animType subType:(TransitionSubType)subType curve:(TransitionCurve)curve duration:(CGFloat)duration;

@end
