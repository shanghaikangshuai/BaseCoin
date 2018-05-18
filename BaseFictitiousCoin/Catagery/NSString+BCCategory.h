//
//  NSString+BCCategory.h
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BCCategory)

/**
 32位小写 md5加密
 */
+ (NSString*)md532BitLower:(NSString *)str;

@end
