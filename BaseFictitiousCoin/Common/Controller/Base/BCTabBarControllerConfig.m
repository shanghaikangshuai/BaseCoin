//
//  BCTabBarControllerConfig.m
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import "BCTabBarControllerConfig.h"
#import "BCNavgationController.h"
#import "BCHomeController.h"
#import "BCSecretLetterController.h"
#import "BCWalletController.h"
#import "BCProfileController.h"

@interface BCTabBarControllerConfig ()<UITabBarControllerDelegate>

@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;

@end

@implementation BCTabBarControllerConfig

#pragma mark -
#pragma mark --懒加载
- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        UIOffset titleOffset = UIOffsetMake(0, -3);
        
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers tabBarItemsAttributes:self.tabBarItemsAttributesForController imageInsets:UIEdgeInsetsZero titlePositionAdjustment:titleOffset];
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

- (NSArray *)viewControllers {
    BCHomeController *home = [[BCHomeController alloc] init];
    BCNavgationController *homeNavigationController = [[BCNavgationController alloc]
                                                   initWithRootViewController:home];
    
    BCSecretLetterController *secretLetter = [[BCSecretLetterController alloc] init];
    BCNavgationController *secretLetterNavigationController = [[BCNavgationController alloc]
                                                    initWithRootViewController:secretLetter];
    
    BCWalletController *wallet = [[BCWalletController alloc] init];
    BCNavgationController *walletNavigationController = [[BCNavgationController alloc]
                                                   initWithRootViewController:wallet];
    
    BCProfileController *profile = [[BCProfileController alloc] init];
    BCNavgationController *profileNavigationController = [[BCNavgationController alloc]
                                                    initWithRootViewController:profile];
    
    
    NSArray *viewControllers = @[
                                 homeNavigationController,
                                 secretLetterNavigationController,
                                 walletNavigationController,
                                 profileNavigationController
                                 ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *homeTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"主页",
                                                 CYLTabBarItemImage : @"home",
                                                 CYLTabBarItemSelectedImage : @"homeselect",
                                                 };
    NSDictionary *secretLetterTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"密信",
                                                  CYLTabBarItemImage : @"secretletter",
                                                  CYLTabBarItemSelectedImage : @"secretletterselect",
                                                  };
    NSDictionary *walletTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"钱包",
                                                 CYLTabBarItemImage : @"wallet",
                                                 CYLTabBarItemSelectedImage : @"walletselect",
                                                 };
    NSDictionary *profileTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"我的",
                                                  CYLTabBarItemImage : @"profile",
                                                  CYLTabBarItemSelectedImage : @"profileselect"
                                                  };
    NSArray *tabBarItemsAttributes = @[
                                       homeTabBarItemsAttributes,
                                       secretLetterTabBarItemsAttributes,
                                       walletTabBarItemsAttributes,
                                       profileTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    tabBarController.tabBarHeight = CYL_IS_IPHONE_X ? 83 : 45;
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#999999"];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#1db3d0"];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    UIImage *tabBarBackgroundImage = [UIImage imageWithColor:[UIColor colorWithHexString:@"#f8f8f8"] size:CGSizeMake(BCSCREEN_WIDTH, 40)];
    UIImage *scanedTabBarBackgroundImage = [UIImage scaleImage:tabBarBackgroundImage toScale:1.0];
    [[UITabBar appearance] setBackgroundImage:scanedTabBarBackgroundImage];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

@end
