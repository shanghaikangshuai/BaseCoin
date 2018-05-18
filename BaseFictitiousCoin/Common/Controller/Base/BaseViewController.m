//
//  BaseViewController.m
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/16.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hbd_barShadowHidden=YES;
    self.view.backgroundColor=[UIColor whiteColor];
}

#pragma mark -
#pragma mark --setter
- (void)setBc_statusLight:(BOOL)bc_statusLight
{
    _bc_statusLight=bc_statusLight;
    [UIApplication sharedApplication].statusBarStyle = bc_statusLight?UIStatusBarStyleLightContent:UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    BCLog(@"%@收到内存警告",[self class]);
}

- (void)dealloc {
    BCLog(@"%@页面销毁",[self class]);
}
@end
