//
//  BCUserModelManager.h
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BCUserModel;

@interface BCUserModelManager : NSObject

/**
 *  当前登陆的用户
 */
@property (nonatomic , strong) BCUserModel *currentUser;

/**
 *  单例实例化
 *
 *  @return 实例化之后的 BCUserModelManager
 */
+ (BCUserModelManager *)shareManager;

/**
 *  删除用户信息 -- 特殊情况删除用户时使用
 *
 *  @param complete 用户删除完成
 */
- (void)deleteUserInfo:(void(^)(BOOL success))complete;

/**
 *  删除用户部分信息 -- 退出登录时使用
 *
 *  @param complete 用户部分信息删除完成
 */
- (void)logoutUserInfo:(void(^)(BOOL success))complete;

/**
 *  获取登陆用户信息 -- 采用解档
 *
 *  @return 登陆用户信息
 */
- (BCUserModel *)getCurrentUser;

@end
