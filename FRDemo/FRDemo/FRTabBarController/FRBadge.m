//
//  FRBadge.m
//  FRTabBarController
//
//  Created by 1860 on 16/4/1.
//  Copyright © 2016年 FanrongQu. All rights reserved.
// 

#import "FRBadge.h"

@implementation FRBadge

- (instancetype)initWithFrame:(CGRect)frame {
    frame.size.width = 16;
    frame.size.height = frame.size.width;
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        
        self.font = [UIFont systemFontOfSize:10];
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor colorWithRed:241/255.0 green:94/255.0 blue:94/255.0 alpha:1.0];
    }
    return self;
}


- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = [badgeValue copy];
    if (badgeValue) {
        self.hidden = NO;
        //设置文字
        self.text = badgeValue;
        
        //设置frame
        CGRect frame = self.frame;
        frame.size.height = 16;
        
        if (badgeValue.length > 0) {
            frame.size = CGSizeMake(16, 16);
        }else if (badgeValue.length > 0) {
            //文字尺寸
            NSDictionary *attributes = @{NSFontAttributeName : self.font};
            CGSize badgeSize = [badgeValue sizeWithAttributes:attributes];
            frame.size.height = 16;
            frame.size.width = MAX(badgeSize.width + 7, 16);
        }else if(badgeValue.length == 0) {
            frame.size = CGSizeMake(6, 6);
        }
        
        self.layer.cornerRadius = frame.size.height / 2;
        [self.layer setMasksToBounds:YES];
        
        self.frame = frame;
    }else {
        self.hidden = YES;
    }
}

@end
