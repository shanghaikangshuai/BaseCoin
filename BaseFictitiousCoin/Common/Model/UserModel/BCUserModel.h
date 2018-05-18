//
//  BCUserModel.h
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCUserModel : NSObject<NSCoding>

/**
 *  用户手机号
 */
@property (nonatomic , strong) NSString *userAccoun;

/**
 *  用户密码MD5值
 */
@property (nonatomic , strong) NSString *userPassMD5;

/**
 *  用户ID
 */
@property (nonatomic , strong) NSString *userID;

/**
 *  用户Token
 */
@property (nonatomic , strong) NSString *userToken;

@end
