//
//  BCNetworkMonitor.m
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import "BCNetworkMonitor.h"
#import <AFNetworking.h>
#import "BCHUD.h"

static BCNetworkMonitor *monitor;

@implementation BCNetworkMonitor

/**
 *  单例实例化
 *
 *  @return 实例化之后的AQNetworkMonitor
 */
+(BCNetworkMonitor *)shareMonitor
{
    @synchronized(self){
        if (monitor == nil){
            monitor = [[self alloc]init];
        }
    }
    return monitor;
}

-(id)init{
    self = [super init];
    if (self){
        /**
         实时监测网络状况
         */
        AFNetworkReachabilityManager *netManager = [AFNetworkReachabilityManager sharedManager];
        [netManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                    self.netType=BCNetTypeUnknown;
                    BCLog(@"未知网络");
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    self.netType=BCNetTypeNotReachable;
                    [[BCHUD share] toast:@"没有网络" to:nil];
                    BCLog(@"没有网络");
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    self.netType=BCNetTypeReachableViaWWAN;
                    BCLog(@"蜂窝网络");
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    self.netType=BCNetTypeReachableViaWiFi;
                    BCLog(@"WIFI");
                    break;
            }
        }];
        [netManager startMonitoring];
    }
    return self;
}

@end
