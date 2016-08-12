//
//  AppDelegate+Category.m
//  NetEase News
//
//  Created by 1860 on 16/6/14.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//

#import "AppDelegate+Category.h"

@implementation AppDelegate (Category)


- (void)setRootViewController:(UIViewController *)controller {
    //设置window
    self.window = [[UIWindow alloc]initWithFrame:kScreenBounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window setRootViewController:controller];
    
    [self.window makeKeyAndVisible];
}

@end
