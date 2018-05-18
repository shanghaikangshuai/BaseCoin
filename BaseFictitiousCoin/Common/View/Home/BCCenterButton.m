//
//  BCCenterButton.m
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/18.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import "BCCenterButton.h"

@implementation BCCenterButton

-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGPoint imgCenter = self.imageView.center;
    imgCenter.x = self.frame.size.width/2;
    imgCenter.y = self.imageView.frame.size.height/2;
    self.imageView.center = imgCenter;
    
    CGRect titleFrame = [self titleLabel].frame;
    titleFrame.origin.x = 0;
    titleFrame.origin.y = self.imageView.frame.size.height + BCPROPORTIONW(20);
    titleFrame.size.width = self.frame.size.width;
    
    self.titleLabel.frame = titleFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
