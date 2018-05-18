//
//  BCHUD.h
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCHUD : NSObject

+ (instancetype)share;

- (void)toast:(NSString *)toastStr to:(UIView *)hudView;

- (void)HUD:(UIView *)hudView;

- (void)HUDWithText:(NSString *)text to:(UIView *)hudView;

- (void)HUDLongTimeWithText:(NSString *)text to:(UIView *)hudView;

- (void)HUDDismiss:(UIView *)hudView;

- (void)HUDDismissWithText:(NSString *)text from:(UIView *)hudView;

@end
