//
//  FRTabBarController.m
//  RTabBarController
//
//  Created by 1860 on 16/4/1.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//


#import "FRTabBarController.h"

@interface FRTabBarController ()<FRTabBarDataSource,FRTabBarDelegate>

@end

@implementation FRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 初始化tabbar
    [self setupTabbar];
}


/**
 *  初始化tabbar
 */
- (void)setupTabbar
{
    FRTabBar *customTabBar = [[FRTabBar alloc] initWithFrame:self.tabBar.bounds];
    customTabBar.dataSource = self;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

- (void)setTabBarItemNormalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor {
    self.customTabBar.normalColor = normalColor;
    self.customTabBar.selectedColor = selectedColor;
}

- (void)selectedControllerWithIndex:(NSUInteger)selectedIndex {
    [self.customTabBar selectedTabBarItemWithIndex:selectedIndex];
    self.selectedIndex = selectedIndex;
}

- (void)addChildNavigationController:(UINavigationController *)navigationController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    UIViewController *childViewController = navigationController.childViewControllers[0];
    //标题
    childViewController.title = title;
    
    //图片
    childViewController.tabBarItem.image = [UIImage imageNamed:image];
    childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:navigationController];
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarItemWithItem:childViewController.tabBarItem];
}

- (void)addChildViewController:(UIViewController *)childViewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    //标题
    childViewController.title = title;
    childViewController.tabBarItem.title = title;
    
    //图片
    childViewController.tabBarItem.image = [UIImage imageNamed:image];
    childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:childViewController];
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarItemWithItem:childViewController.tabBarItem];
}

#pragma mark - FRTabBar dataSource
- (BOOL)tabBarItemCanSelectedBarItem:(NSInteger)integer {
    return YES;
}
#pragma mark - FRTabBar Delegate
- (void)tabBar:(FRTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to {
    self.selectedIndex = to;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    // 删除系统自动生成的UITabBarButton,解决会重叠显示item的问题
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [child removeFromSuperview];
        }
    }
}


- (BOOL)shouldAutorotate{
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.selectedViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

@end
