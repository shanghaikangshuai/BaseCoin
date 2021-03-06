//
//  NSObject+BCCategory.h
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BCCategory)

/**
 *  归档
 *
 *  @param obj 需要归档的类
 *  @param key 归档key
 *
 *  @return YES表示成功，NO表示失败
 */
- (BOOL)keyedArchiver:(id)obj key:(NSString *)key;

/**
 *  归档
 *
 *  @param obj  需要归档的类
 *  @param key  归档key
 *  @param path 归档路劲
 *
 *  @return YES表示归档成功，NO表示归档失败
 */
- (BOOL)keyedArchiver:(id)obj key:(NSString *)key path:(NSString *)path;

/**
 *  解档
 *
 *  @param key key
 *
 *  @return 解析的结果
 */
- (id)keyedUnarchiver:(NSString *)key;

/**
 *  解档
 *
 *  @param key  解挡key
 *  @param path 解挡路径
 *
 *  @return 解析的结果
 */
- (id)keyedUnarchiver:(NSString *)key path:(NSString *)path;

@end
