//
//  BCTabBarControllerConfig.h
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CYLTabBarController.h>

@interface BCTabBarControllerConfig : NSObject

@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;

@property (nonatomic, copy) NSString *context;

@end
