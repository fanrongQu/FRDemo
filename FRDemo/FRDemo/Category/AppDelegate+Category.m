//
//  AppDelegate+Category.m
//  NetEase News
//
//  Created by 1860 on 16/6/14.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//

#import "AppDelegate+Category.h"
#import "RootTableViewController.h"
#import "FRNavigationController.h"

@implementation AppDelegate (Category)


- (void)setRootViewController {
    //设置window
    self.window = [[UIWindow alloc]initWithFrame:kScreenBounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    RootTableViewController *rootTableVC = [[RootTableViewController alloc]init];
    FRNavigationController *nav = [[FRNavigationController alloc]initWithRootViewController:rootTableVC];
    [self.window setRootViewController:nav];
    
    
    [self.window makeKeyAndVisible];
}

@end
