//
//  HomeItemCell.m
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/18.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import "HomeItemCell.h"

@implementation HomeItemCell

#pragma mark -
#pragma mark --lazy load
- (UIImageView *)iconImg
{
    if(!_iconImg){
        _iconImg=[UIImageView new];
    }
    return _iconImg;
}

- (UILabel *)platformLab
{
    if(!_platformLab){
        _platformLab=[UILabel new];
        _platformLab.textColor=[UIColor colorWithHexString:@"#5a5c67"];
        _platformLab.font=[UIFont systemFontOfSize:BCPROPORTIONW(12)];
        _platformLab.textAlignment=NSTextAlignmentCenter;
    }
    return _platformLab;
}

/**
 构造
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews
{
    [self.contentView addSubview:self.iconImg];
    [self.contentView addSubview:self.platformLab];
    
    self.iconImg.sd_layout
    .widthIs(BCPROPORTIONW(32))
    .heightEqualToWidth()
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView, BCPROPORTIONW(18));
    
    self.platformLab.sd_layout
    .widthRatioToView(self.contentView, 1)
    .heightIs(BCPROPORTIONW(20))
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.iconImg, BCPROPORTIONW(10));
}

@end
