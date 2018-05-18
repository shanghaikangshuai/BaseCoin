//
//  BCNetworkMonitor.h
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,BCNetType) {
    BCNetTypeUnknown,
    BCNetTypeNotReachable,
    BCNetTypeReachableViaWWAN,
    BCNetTypeReachableViaWiFi,
};

@interface BCNetworkMonitor : NSObject

@property (nonatomic , assign) BCNetType netType;

/**
 *  单例实例化
 *
 *  @return 实例化之后的 BCNetworkMonitor
 */
+(BCNetworkMonitor *)shareMonitor;

@end
