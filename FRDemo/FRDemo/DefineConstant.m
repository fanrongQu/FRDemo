//
//  DefineConstant.m
//  FRDemo
//
//  Created by mac on 2017/5/10.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import "DefineConstant.h"

@implementation DefineConstant


#pragma mark 从字典 获取String///
NSString* EncodeStringFromDic(NSDictionary *dic, NSString *key)
{
//    在@try块中加入这些statement后，程序正常执行。但是，如果块中的某一条语句抛出异常，执行不会终止，而是立即跳到@catch块，在那里继续执行。在@catch块内可以处理异常。这里可行的执行顺序是记录出错消息、清除和终止执行。
//    出现异常时，@catch块被执行。包含异常信息的NSException对象作为参数传递给这个块。如你所见，name方法检索异常的名称，reason方法给出原因(运行时系统还会将原因自动输出〕。
//    可以使用@finally块包含是否执行抛出异常的@try块中的语句代码。
//    @try {
//        <#Code that can potentially throw an exception#>
//    } @catch (NSException *exception) {
//        <#Handle an exception thrown in the @try block#>
//    } @finally {
//        <#Code that gets executed whether or not an exception is thrown#>
//    }
    @try {
        id temp = [dic objectForKey:key];
        if ([temp isKindOfClass:[NSString class]])
        {
            return [NSString stringWithFormat:@"%@",temp];
        }
        else if ([temp isKindOfClass:[NSNumber class]])
        {
            return [NSString stringWithFormat:@"%@",[temp stringValue]];
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    return nil;
}

#pragma mark 从字典 获取Number
NSNumber* EncodeNumberFromDic(NSDictionary *dic, NSString *key)
{
    
    @try {
        id temp = [dic objectForKey:key];
        if ([temp isKindOfClass:[NSString class]])
        {
            return [NSNumber numberWithDouble:[temp doubleValue]];
        }
        else if ([temp isKindOfClass:[NSNumber class]])
        {
            return temp;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    return nil;
}

#pragma mark 从字典到字典
NSDictionary *EncodeDicFromDic(NSDictionary *dic, NSString *key)
{
    @try {
        id temp = [dic objectForKey:key];
        if ([temp isKindOfClass:[NSDictionary class]])
        {
            return temp;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    return nil;
}
#pragma mark 从字典到数组
NSArray *EncodeArrayFromDic(NSDictionary *dic, NSString *key)
{
    @try {
        id temp = [dic objectForKey:key];
        if ([temp isKindOfClass:[NSArray class]])
        {
            return temp;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    return nil;
}

#pragma mark 从数组到数组
NSArray *EncodeArrayFromArray(NSArray *array, NSInteger integer)
{
    @try {
        id temp = array[integer];
        if ([temp isKindOfClass:[NSArray class]]){
            return temp;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    return nil;
}

#pragma mark 从数组到字典
NSDictionary *EncodeDictFromArray(NSArray *array, NSInteger integer)
{
    @try {
        id temp = array[integer];
        if ([temp isKindOfClass:[NSDictionary class]]){
            return temp;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    return nil;
}

#pragma mark 从数组到字符串
NSString *EncodeStringFromArray(NSArray *array, NSInteger integer)
{
    @try {
        id temp = array[integer];
        if ([temp isKindOfClass:[NSString class]])
        {
            return [NSString stringWithFormat:@"%@",temp];
        }
        else if ([temp isKindOfClass:[NSNumber class]])
        {
            return [NSString stringWithFormat:@"%@",[temp stringValue]];
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    return nil;
}

#pragma mark 从数组到Number
NSNumber *EncodeNumberFromArray(NSArray *array, NSInteger integer)
{
    @try {
        id temp = array[integer];
        
        if ([temp isKindOfClass:[NSString class]])
        {
            return [NSNumber numberWithDouble:[temp doubleValue]];
        }
        else if ([temp isKindOfClass:[NSNumber class]])
        {
            return temp;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    return nil;
}


@end
