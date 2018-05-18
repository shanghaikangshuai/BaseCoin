//
//  BCHUD.m
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import "BCHUD.h"
#import <MBProgressHUD.h>

#define MAX_HUDTIME 7  // HUD显示的最长时间,网络超时时间为7秒,最长不过7秒,防止因为异常逻辑导致HUD不消失
#define DEFAULT_VIEW [UIApplication sharedApplication].keyWindow  // HUD默认显示的view,若传值为nil则显示在DEFAULT_VIEW上,消失同理

@implementation BCHUD

/**
 创建单例
 */
static BCHUD * _bcHUD;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized (self) {
        if (_bcHUD == nil) {
            _bcHUD = [super allocWithZone:zone];
        }
    }
    return _bcHUD;
}
+ (instancetype)share{
    return  [[BCHUD alloc] init];
}

/**
 toast封装
 */
- (void)toast:(NSString *)toastStr to:(UIView *)hudView
{
    [[GCDQueue mainQueue] queueBlock:^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:hudView?hudView:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = toastStr;
        hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
        [hud hideAnimated:YES afterDelay:1.5f];
    }];
}

/**
 HUD
 */
- (void)HUD:(UIView *)hudView
{
    [[GCDQueue mainQueue] queueBlock:^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:hudView?hudView:[UIApplication sharedApplication].keyWindow animated:YES];
        [hud hideAnimated:YES afterDelay:MAX_HUDTIME];
    }];
}

/**
 HUD带Text
 */
- (void)HUDWithText:(NSString *)text to:(UIView *)hudView
{
    [[GCDQueue mainQueue] queueBlock:^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:hudView?hudView:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.label.text = text;
        [hud hideAnimated:YES afterDelay:MAX_HUDTIME];
    }];
}

/**
 HUD 不自动消失
 */
- (void)HUDLongTimeWithText:(NSString *)text to:(UIView *)hudView
{
    [[GCDQueue mainQueue] queueBlock:^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:hudView?hudView:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.label.text = text;
    }];
}

/**
 HUD消失
 */
- (void)HUDDismiss:(UIView *)hudView
{
    [[GCDQueue mainQueue] queueBlock:^{
        [MBProgressHUD hideHUDForView:hudView?hudView:[UIApplication sharedApplication].keyWindow animated:YES];
    }];
}

/**
 HUD消失带Text
 */
- (void)HUDDismissWithText:(NSString *)text from:(UIView *)hudView
{
    [[GCDQueue mainQueue] queueBlock:^{
        [MBProgressHUD hideHUDForView:hudView?hudView:[UIApplication sharedApplication].keyWindow animated:YES];
        [self toast:text to:hudView];
    }];
}

@end
