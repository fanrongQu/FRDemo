//
//  FRNavigationController.m
//
//  Created by Mac on 15/9/21.
//  Copyright © 2015年 FR. All rights reserved.
//

//导航栏颜色
#define navigationBarColor [UIColor whiteColor]
//导航栏标题字体颜色
#define navigationBarTitleColor [UIColor whiteColor]


#import "FRNavigationController.h"
#import "UIBarButtonItem+FR.h"

@implementation FRNavigationController

+(void)initialize
{
    //设置整个项目item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置普通状态
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //item字体颜色
    textAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:135/255.0 green:135/255.0 blue:135/255.0 alpha:1];

    //item字体大小
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //设置不可用状态
    NSMutableDictionary *disableTextAttr = [NSMutableDictionary dictionary];
    disableTextAttr[NSForegroundColorAttributeName] = [UIColor colorWithRed:241/255.0 green:0 blue:0 alpha:1];    disableTextAttr[NSFontAttributeName] = textAttrs[NSFontAttributeName];
    [item setTitleTextAttributes:disableTextAttr forState:UIControlStateDisabled];
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    //状态栏颜色
    navigationBar.barTintColor = navigationBarColor;
    //状态栏字体(白色)
    //在info.plist中添加一个字段：view controller -base status bar 设置为NO
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    //导航栏title颜色
    [navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:navigationBarTitleColor}];

}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

/**
 *  重写这个方法，拦截push进来的控制器
 *
 *  @param viewController push进来的控制器
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {//这时push进来的控制器不是第一个控制器
        //自动隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
        
        //设置导航栏上面显示的内容样式
        //设置左侧返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem ItemWithIcon:@"navigationbar_back" highIcon:nil target:self action:@selector(back)];
       
//        //设置右侧更多按钮
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more" hightImage:@"navigationbar_more_highlighted"];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    // 因为self本来就是一个导航控制器，self.navigationController这里是nil的
    [self popViewControllerAnimated:YES];
}

//- (void)more
//{
//    [self popToRootViewControllerAnimated:YES];
//}

@end
