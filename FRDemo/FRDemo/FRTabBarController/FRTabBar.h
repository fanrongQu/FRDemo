//
//  FRTabBar.h
//  FRTabBarController
//
//  Created by 1860 on 16/4/1.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FRTabBar;

@protocol FRTabBarDataSource <NSObject>

@required
/**
 tabBarItem点击后是否允许切换到对应视图
 
 @param integer 视图的序号
 @return 是否允许
 */
- (BOOL)tabBarItemCanSelectedBarItem:(NSInteger)integer;

@end

@protocol FRTabBarDelegate <NSObject>

@optional
/**
 子控制器从哪个试图控制器切换到哪个试图控制器
 
 @param tabBar 当前对象
 @param from 当前控制器序号
 @param to 切换的控制器序号
 */
- (void)tabBar:(FRTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface FRTabBar : UIView
/**  普通状态item的颜色  */
@property (nonatomic, strong) UIColor *normalColor;
/**  选中状态item的颜色  */
@property (nonatomic, strong) UIColor *selectedColor;

@property(nonatomic, strong)UIImageView *imageView;

@property (nonatomic, strong) NSMutableArray *tabBarItems;

- (void)addTabBarItemWithItem:(UITabBarItem *)tabBarItem;

- (void)selectedTabBarItemWithIndex:(NSUInteger)selectedIndex;

@property (nonatomic, weak) id<FRTabBarDelegate> delegate;

@property(nonatomic, weak) id<FRTabBarDataSource> dataSource;

@end
