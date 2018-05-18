//
//  BCInterfaceConst.h
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DevelopSever 0
#define TestSever    0
#define ProductSever 1

/** 接口前缀-开发服务器*/
UIKIT_EXTERN NSString *const ApiPrefix;

#pragma mark - 详细接口地址

/** 获取用户个人资料*/
UIKIT_EXTERN NSString *const MemberInfoURL;
