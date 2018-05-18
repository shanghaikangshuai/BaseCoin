//
//  BCUserModel.m
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import "BCUserModel.h"

@implementation BCUserModel

- (id)init {
    self = [super init];
    if (self){
        self.userAccoun=@"";
        self.userPassMD5=@"";
        self.userID=@"";
        self.userToken=@"";
    }
    return self;
}

/**
 *  归档
 *
 *  @param aCoder 归档
 */
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.userAccoun forKey:@"userAccoun"];
    [aCoder encodeObject:self.userPassMD5 forKey:@"userPassMD5"];
    [aCoder encodeObject:self.userID forKey:@"userID"];
    [aCoder encodeObject:self.userToken forKey:@"userToken"];
}

/**
 *  解挡
 *
 *  @param aDecoder 解挡
 *
 *  @return 解挡后的对象
 */
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.userAccoun= [aDecoder decodeObjectForKey:@"userAccoun"];
        self.userPassMD5= [aDecoder decodeObjectForKey:@"userPassMD5"];
        self.userID= [aDecoder decodeObjectForKey:@"userID"];
        self.userToken= [aDecoder decodeObjectForKey:@"userToken"];
    }
    return self;
}

@end
