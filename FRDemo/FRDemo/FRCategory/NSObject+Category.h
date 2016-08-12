//
//  NSObject+Category.h
//  FRCategory
//
//  Created by 1860 on 16/8/12.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

//动态Get方法
#define categoryPropertyGet(property) return objc_getAssociatedObject(self,@#property);
//动态Set方法
#define categoryPropertySet(property) objc_setAssociatedObject(self,@#property, property, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

@interface NSObject (Category)

@end
