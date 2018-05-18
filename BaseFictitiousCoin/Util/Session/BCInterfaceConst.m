//
//  BCInterfaceConst.m
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import "BCInterfaceConst.h"

#if DevelopSever
/** 接口前缀-开发服务器*/
NSString *const ApiPrefix = @"*********";
#elif TestSever
/** 接口前缀-测试服务器*/
NSString *const ApiPrefix = @"http://116.62.139.161";
#elif ProductSever
/** 接口前缀-生产服务器*/
NSString *const ApiPrefix = @"http://api.17kaiheiba.com";
#endif

#pragma mark - 详细接口地址

/** 获取用户个人资料*/
NSString *const MemberInfoURL = @"/member/info";
