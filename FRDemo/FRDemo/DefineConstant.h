//
//  DefineConstant.h
//  FRDemo
//
//  Created by mac on 2017/5/10.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DefineConstant : NSObject

/**
 *  从字典里获取字符串对象
 *
 *  @param dic 字典
 *  @param key 需要获取值的Key
 *
 *  @return 返回一个字符对象
 */
extern NSString* EncodeStringFromDic(NSDictionary *dic, NSString *key);
/**
 *  从字典里获取NSNumber对象
 *
 *  @param dic 字典
 *  @param key 需要获取值的Key
 *
 *  @return 返回一个NSNumber对象
 */
extern NSNumber* EncodeNumberFromDic(NSDictionary *dic, NSString *key);
/**
 *  从字典里获取字典对象
 *
 *  @param dic 字典
 *  @param key 需要获取值的Key
 *
 *  @return 返回一个NSDictionary对象
 */
extern NSDictionary *EncodeDicFromDic(NSDictionary *dic, NSString *key);
/**
 *  从字典里获取数组对象
 *
 *  @param dic 字典
 *  @param key 需要获取值的Key
 *
 *  @return 返回一个NSArray对象
 */
extern NSArray *EncodeArrayFromDic(NSDictionary *dic, NSString *key);

/**
 从数组中获取数组对象
 
 @param array 数组
 @param integer 数组的序号
 @return 对应的对象
 */
NSArray *EncodeArrayFromArray(NSArray *array, NSInteger integer);

/**
 从数组中获取Dictionary对象
 
 @param array 数组
 @param integer 数组的序号
 @return 对应的对象
 */
NSDictionary *EncodeDictFromArray(NSArray *array, NSInteger integer);
/**
 从数组中获取String对象
 
 @param array 数组
 @param integer 数组的序号
 @return 对应的对象
 */
NSString *EncodeStringFromArray(NSArray *array, NSInteger integer);
/**
 从数组中获取Number对象
 
 @param array 数组
 @param integer 数组的序号
 @return 对应的对象
 */
NSNumber *EncodeNumberFromArray(NSArray *array, NSInteger integer);

@end
