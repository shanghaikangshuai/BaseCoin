//
//  UIColor+BCCategory.h
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (BCCategory)

+ (UIColor *) colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha;

+ (UIColor *) colorWithHexString:(NSString *)string;

+ (UIColor *) randowColor;

@end
