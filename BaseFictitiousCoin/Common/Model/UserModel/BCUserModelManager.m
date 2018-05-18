//
//  BCUserModelManager.m
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import "BCUserModelManager.h"
#import "BCUserModel.h"

static BCUserModelManager *BCUserManager;

@implementation BCUserModelManager

/**
 *  单例实例化
 *
 *  @return 实例化之后的AQUserModelManager
 */
+(BCUserModelManager *)shareManager{
    @synchronized(self){
        if (BCUserManager == nil){
            BCUserManager = [[self alloc]init];
        }
    }
    return BCUserManager;
}

-(id)init{
    self = [super init];
    if (self){
        [self initiaCurrentUser];
        [self addObserverForLoginUser];
    }
    return self;
}

-(void)initiaCurrentUser
{
    BCUserModel *tpUser = [self keyedUnarchiver:@"loginUser"];
    if (tpUser == nil)
    {
        tpUser = [[BCUserModel alloc]init];
    }
    _currentUser = tpUser;
}

/**
 *  添加KVO观察
 */
-(void)addObserverForLoginUser{
    [self.currentUser addObserver:self forKeyPath:@"userAccoun" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    [self.currentUser addObserver:self forKeyPath:@"userPassMD5" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    [self.currentUser addObserver:self forKeyPath:@"userID" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    [self.currentUser addObserver:self forKeyPath:@"userToken" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
}

/**
 *  监听KVO键值变化
 *
 *  @param keyPath 关键KEY
 *  @param object  监听对象
 *  @param change  改变信息描述
 *  @param context context
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    /**
     *  键值有变化则执行信息归档
     */
    [self saveUserInfo:_currentUser];
}

/**
 *  存储用户信息 -- 采用归档
 *
 *  @param user 用户信息
 *
 *  @return YES表示存储成功，NO表示存储失败
 */
-(BOOL)saveUserInfo:(BCUserModel *)user{
    if ([self keyedArchiver:user key:@"loginUser"]) {
        BCLog(@"存储成功");
    }
    return [self keyedArchiver:user key:@"loginUser"];
}

/**
 *  删除用户信息 -- 特殊情况删除用户时使用
 *
 *  @param complete 用户删除完成
 */
-(void)deleteUserInfo:(void(^)(BOOL success))complete
{
    BCUserModel *tpUser = [[BCUserModel alloc]init];
    tpUser.userAccoun=@"";
    tpUser.userPassMD5=@"";
    tpUser.userID=@"";
    tpUser.userToken=@"";
    [self keyedArchiver:tpUser key:@"loginUser"];
    
    _currentUser.userAccoun = tpUser.userAccoun;
    _currentUser.userPassMD5 = tpUser.userPassMD5;
    _currentUser.userID = tpUser.userID;
    _currentUser.userToken = tpUser.userToken;
}

/**
 *  删除用户部分信息 -- 退出登录时使用
 *
 *  @param complete 用户部分信息删除完成
 */
-(void)logoutUserInfo:(void(^)(BOOL success))complete
{
    BCUserModel *tpUser = [[BCUserModel alloc]init];
    tpUser.userID=@"";
    tpUser.userToken=@"";
    [self keyedArchiver:tpUser key:@"loginUser"];
    
    _currentUser.userID = tpUser.userID;
    _currentUser.userToken = tpUser.userToken;
    complete(YES);
}

/**
 *  获取登陆用户信息，默认取最后一条用户数据
 *
 *  @return 登陆用户信息
 */
-(BCUserModel *)getCurrentUser{
    return _currentUser;
}

/**
 *  清理
 */
-(void)dealloc{
    [self.currentUser removeObserver:self forKeyPath:@"userAccoun"];
    [self.currentUser removeObserver:self forKeyPath:@"userPassMD5"];
    [self.currentUser removeObserver:self forKeyPath:@"userID"];
    [self.currentUser removeObserver:self forKeyPath:@"userToken"];
}

@end
