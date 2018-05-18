//
//  BCHomeController.m
//  BaseFictitiousCoin
//
//  Created by Adxyun_Karson on 2018/5/17.
//  Copyright © 2018年 AiQing. All rights reserved.
//

#import "BCHomeController.h"
#import "BCCenterButton.h"
#import "HW3DBannerView.h"
#import "LMJScrollTextView2.h"
#import "HomeItemCell.h"

@interface BCHomeController () <LMJScrollTextView2Delegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic , strong) UIImageView *headImg;
@property (nonatomic , strong) UIImageView *maskImg;
@property (nonatomic , strong) BCCenterButton *scanBtn;
@property (nonatomic , strong) BCCenterButton *receivablesBtn;
@property (nonatomic , strong) BCCenterButton *detailBtn;
@property (nonatomic , strong) UILabel *coinNameLab;
@property (nonatomic , strong) UILabel *cusdNumLab;
@property (nonatomic , strong) HW3DBannerView *bannerV;
@property (nonatomic , strong) UIView *bannerBackV;
@property (nonatomic , strong) UIImageView *noticeImg;
@property (nonatomic , strong) LMJScrollTextView2 *noticeV;
@property (nonatomic , strong) UIView *noticeBackV;
@property (nonatomic , strong) UICollectionView *mainCollectionV;

@property (nonatomic , strong) NSArray *dataArr;

@end

@implementation BCHomeController

#pragma mark -
#pragma mark --页面属性
- (void)pageAppear
{
    self.hbd_barHidden=YES;
    self.bc_statusLight=YES;
}

#pragma mark -
#pragma mark --lazy load
- (UIImageView *)headImg
{
    if(!_headImg){
        _headImg=[UIImageView new];
        _headImg.image=[UIImage imageNamed:@"head"];
        _headImg.userInteractionEnabled=YES;
    }
    return _headImg;
}

- (UIImageView *)maskImg
{
    if(!_maskImg){
        _maskImg=[UIImageView new];
        _maskImg.image=[UIImage imageWithColor:[UIColor colorWithR:255 G:255 B:255 A:0.5] size:CGSizeMake(BCSCREEN_WIDTH, BCPROPORTIONW(50))];
    }
    return _maskImg;
}

- (BCCenterButton *)scanBtn
{
    if(!_scanBtn){
        _scanBtn=[BCCenterButton new];
        [_scanBtn setTitle:@"扫一扫" forState:UIControlStateNormal];
        [_scanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _scanBtn.titleLabel.font=[UIFont systemFontOfSize:BCPROPORTIONW(14)];
        [_scanBtn setImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal];
        [_scanBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scanBtn;
}

- (BCCenterButton *)receivablesBtn
{
    if(!_receivablesBtn){
        _receivablesBtn=[BCCenterButton new];
        [_receivablesBtn setTitle:@"收款码" forState:UIControlStateNormal];
        [_receivablesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _receivablesBtn.titleLabel.font=[UIFont systemFontOfSize:BCPROPORTIONW(14)];
        [_receivablesBtn setImage:[UIImage imageNamed:@"receivables"] forState:UIControlStateNormal];
        [_receivablesBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _receivablesBtn;
}

- (BCCenterButton *)detailBtn
{
    if(!_detailBtn){
        _detailBtn=[BCCenterButton new];
        [_detailBtn setTitle:@"明细" forState:UIControlStateNormal];
        [_detailBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _detailBtn.titleLabel.font=[UIFont systemFontOfSize:BCPROPORTIONW(14)];
        [_detailBtn setImage:[UIImage imageNamed:@"detail"] forState:UIControlStateNormal];
        [_detailBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _detailBtn;
}

- (UILabel *)coinNameLab
{
    if(!_coinNameLab){
        _coinNameLab=[UILabel new];
        _coinNameLab.text=@"vdo";
        _coinNameLab.textColor=[UIColor whiteColor];
        _coinNameLab.font=[UIFont systemFontOfSize:BCPROPORTIONW(12)];
        _coinNameLab.textAlignment=NSTextAlignmentCenter;
    }
    return _coinNameLab;
}

- (UILabel *)cusdNumLab
{
    if(!_cusdNumLab){
        _cusdNumLab=[UILabel new];
        _cusdNumLab.text=@"1.0000 (USD)";
        _cusdNumLab.textColor=[UIColor whiteColor];
        _cusdNumLab.font=[UIFont systemFontOfSize:BCPROPORTIONW(12)];
        _cusdNumLab.textAlignment=NSTextAlignmentCenter;
    }
    return _cusdNumLab;
}

- (HW3DBannerView *)bannerV
{
    if(!_bannerV){
        _bannerV = [HW3DBannerView initWithFrame:CGRectMake(0, 0, BCSCREEN_WIDTH, BCPROPORTIONW(110)) imageSpacing:BCPROPORTIONW(20) imageWidth:BCPROPORTIONW(290)];
        _bannerV.initAlpha = 0.8;
        _bannerV.imageRadius = BCPROPORTIONW(5);
        _bannerV.imageHeightPoor = BCPROPORTIONW(10);
//        _bannerV.data = @[@"http://d.hiphotos.baidu.com/image/pic/item/b7fd5266d016092408d4a5d1dd0735fae7cd3402.jpg",@"http://h.hiphotos.baidu.com/image/h%3D300/sign=2b3e022b262eb938f36d7cf2e56085fe/d0c8a786c9177f3e18d0fdc779cf3bc79e3d5617.jpg",@"http://a.hiphotos.baidu.com/image/pic/item/b7fd5266d01609240bcda2d1dd0735fae7cd340b.jpg",@"http://h.hiphotos.baidu.com/image/pic/item/728da9773912b31b57a6e01f8c18367adab4e13a.jpg",@"http://h.hiphotos.baidu.com/image/pic/item/0d338744ebf81a4c5e4fed03de2a6059242da6fe.jpg"];
//        _bannerV.data = @[[UIImage imageWithColor:[UIColor randowColor] size:CGSizeMake(BCPROPORTIONW(290), BCPROPORTIONW(110))],[UIImage imageWithColor:[UIColor randowColor] size:CGSizeMake(BCPROPORTIONW(290), BCPROPORTIONW(110))],[UIImage imageWithColor:[UIColor randowColor] size:CGSizeMake(BCPROPORTIONW(290), BCPROPORTIONW(110))]];
        _bannerV.data = @[@"http:1.png",@"http:1.png",@"http:1.png"];
        _bannerV.placeHolderImage = [UIImage imageWithColor:[UIColor randowColor] size:CGSizeMake(BCPROPORTIONW(290), BCPROPORTIONW(110))];
        _bannerV.showPageControl = NO;
//        BCWeakObj(self)
        _bannerV.clickImageBlock = ^(NSInteger currentIndex) {
//            [[BCHUD share] toast:[NSString stringWithFormat:@"当前滚到第 %ld 张轮播图",(long)currentIndex] to:objWeak.view];
        };
    }
    return _bannerV;
}

- (UIView *)bannerBackV
{
    if(!_bannerBackV){
        _bannerBackV=[UIView new];
        _bannerBackV.backgroundColor=[UIColor whiteColor];
    }
    return _bannerBackV;
}

- (UIImageView *)noticeImg
{
    if(!_noticeImg){
        _noticeImg=[UIImageView new];
        _noticeImg.image=[UIImage imageNamed:@"notice"];
    }
    return _noticeImg;
}

- (LMJScrollTextView2 *)noticeV
{
    if(!_noticeV){
        _noticeV = [[LMJScrollTextView2 alloc] initWithFrame:CGRectMake(0, 0, BCPROPORTIONW(180), BCPROPORTIONW(20))];
        _noticeV.delegate            = self;
        _noticeV.textStayTime        = 2;
        _noticeV.scrollAnimationTime = 1;
        _noticeV.backgroundColor     = [UIColor whiteColor];
        _noticeV.textColor           = [UIColor colorWithHexString:@"#848799"];
        _noticeV.textFont            = [UIFont systemFontOfSize:BCPROPORTIONW(10)];
        _noticeV.textAlignment       = NSTextAlignmentLeft;
        _noticeV.touchEnable         = YES;
        _noticeV.textDataArr = @[@"这是一条数据：000000",@"这是一条数据：111111"];
        [_noticeV startScrollBottomToTopWithNoSpace];
    }
    return _noticeV;
}

- (UIView *)noticeBackV
{
    if(!_noticeBackV){
        _noticeBackV=[UIView new];
        _noticeBackV.backgroundColor=[UIColor whiteColor];
    }
    return _noticeBackV;
}

- (UICollectionView *)mainCollectionV
{
    if(!_mainCollectionV){
        UICollectionViewFlowLayout *flowlayout = [UICollectionViewFlowLayout new];
        [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        flowlayout.minimumInteritemSpacing = 0;
        flowlayout.minimumLineSpacing = 0;
        flowlayout.sectionHeadersPinToVisibleBounds = YES;
        _mainCollectionV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowlayout];
        _mainCollectionV.delegate = self;
        _mainCollectionV.dataSource = self;
        _mainCollectionV.showsVerticalScrollIndicator = NO;
        _mainCollectionV.showsHorizontalScrollIndicator = NO;
        [_mainCollectionV setBackgroundColor:[UIColor whiteColor]];
        [_mainCollectionV registerClass:[HomeItemCell class] forCellWithReuseIdentifier:@"HomeItemCell"];
    }
    return _mainCollectionV;
}

- (NSArray *)dataArr
{
    if(!_dataArr){
        _dataArr=[NSArray arrayWithObjects:@{@"title":@"转账",
                                             @"icon":@"transfer"},
                                          @{@"title":@"资产交易",
                                            @"icon":@"transaction"},
                                          @{@"title":@"资讯",
                                            @"icon":@"consultation"},
                                          @{@"title":@"Explorer",
                                            @"icon":@"EXP"},
                                          @{@"title":@"C2C",
                                            @"icon":@"C2C"},
                                          @{@"title":@"节点收益",
                                            @"icon":@"nodeincome"},
                                          @{@"title":@"更多",
                                            @"icon":@"plus"},
                                          nil];
    }
    return _dataArr;
}

#pragma mark -
#pragma mark --layout
- (void)subviewsLayout
{
    [self.view addSubview:self.headImg];
    [self.headImg addSubview:self.maskImg];
    [self.headImg addSubview:self.scanBtn];
    [self.headImg addSubview:self.receivablesBtn];
    [self.headImg addSubview:self.detailBtn];
    [self.view addSubview:self.bannerBackV];
    [self.bannerBackV addSubview:self.bannerV];
    
    UIView *lineLV=[UIView new];
    lineLV.backgroundColor=[UIColor whiteColor];
    [self.maskImg addSubview:lineLV];
    UIView *lineRV=[UIView new];
    lineRV.backgroundColor=[UIColor whiteColor];
    [self.maskImg addSubview:lineRV];
    [self.maskImg addSubview:self.coinNameLab];
    [self.maskImg addSubview:self.cusdNumLab];
    
    [self.view addSubview:self.noticeImg];
    [self.view addSubview:self.noticeBackV];
    [self.noticeBackV addSubview:self.noticeV];
    
    [self.view addSubview:self.mainCollectionV];
    
    self.headImg.sd_layout
    .widthRatioToView(self.view, 1)
    .heightIs(BCPROPORTIONW(185))
    .centerXEqualToView(self.view)
    .topSpaceToView(self.view, 0);
    
    self.maskImg.sd_layout
    .widthRatioToView(self.headImg, 1)
    .heightIs(BCPROPORTIONW(50))
    .centerXEqualToView(self.headImg)
    .bottomSpaceToView(self.headImg, 0);
    
    self.receivablesBtn.sd_layout
    .widthIs(BCPROPORTIONW(50))
    .heightIs(BCPROPORTIONW(90))
    .centerXEqualToView(self.headImg)
    .bottomSpaceToView(self.maskImg, 0);
    
    self.scanBtn.sd_layout
    .widthRatioToView(self.receivablesBtn, 1)
    .heightRatioToView(self.receivablesBtn, 1)
    .centerYEqualToView(self.receivablesBtn)
    .rightSpaceToView(self.receivablesBtn, BCPROPORTIONW(60));
    
    self.detailBtn.sd_layout
    .widthRatioToView(self.receivablesBtn, 1)
    .heightRatioToView(self.receivablesBtn, 1)
    .centerYEqualToView(self.receivablesBtn)
    .leftSpaceToView(self.receivablesBtn, BCPROPORTIONW(60));
    
    lineLV.sd_layout
    .widthIs(1)
    .heightIs(BCPROPORTIONW(25))
    .centerYEqualToView(self.maskImg)
    .leftSpaceToView(self.maskImg, BCPROPORTIONW(100));
    
    lineRV.sd_layout
    .widthIs(1)
    .heightIs(BCPROPORTIONW(25))
    .centerYEqualToView(self.maskImg)
    .rightSpaceToView(self.maskImg, BCPROPORTIONW(100));
    
    self.coinNameLab.sd_layout
    .heightRatioToView(self.maskImg, 0.4)
    .leftSpaceToView(lineLV, 0)
    .rightSpaceToView(lineRV, 0)
    .topSpaceToView(self.maskImg, BCPROPORTIONW(5));
    
    self.cusdNumLab.sd_layout
    .heightRatioToView(self.maskImg, 0.4)
    .leftSpaceToView(lineLV, 0)
    .rightSpaceToView(lineRV, 0)
    .bottomSpaceToView(self.maskImg, BCPROPORTIONW(5));
    
    self.bannerBackV.sd_layout
    .widthRatioToView(self.view, 1)
    .heightIs(BCPROPORTIONW(110))
    .centerXEqualToView(self.view)
    .topSpaceToView(self.headImg, BCPROPORTIONW(10));
    
    self.noticeImg.sd_layout
    .widthIs(BCPROPORTIONW(13))
    .heightIs(BCPROPORTIONW(10))
    .leftSpaceToView(self.view, BCPROPORTIONW(96))
    .topSpaceToView(self.bannerBackV, BCPROPORTIONW(20));
    
    self.noticeBackV.sd_layout
    .centerYEqualToView(self.noticeImg)
    .widthIs(BCPROPORTIONW(180))
    .heightIs(BCPROPORTIONW(20))
    .leftSpaceToView(self.noticeImg, BCPROPORTIONW(8));
    
    self.mainCollectionV.sd_layout
    .widthRatioToView(self.view, 1)
    .centerXEqualToView(self.view)
    .topSpaceToView(self.noticeImg, BCPROPORTIONW(10))
    .bottomSpaceToView(self.view, 0);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self pageAppear];
    [self subviewsLayout];
}

#pragma mark - LMJScrollTextView2 Delegate
- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView currentTextIndex:(NSInteger)index{
    BCLog(@"当前是信息%ld",index);
}
- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView clickIndex:(NSInteger)index content:(NSString *)content{
    BCLog(@"#####点击的是：第%ld条信息 内容：%@",index,content);
    [[BCHUD share] toast:[NSString stringWithFormat:@"第%ld条信息 内容：%@",index,content] to:self.view];
}

#pragma mark -
#pragma mark --UICollectionView代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic=[self.dataArr objectAtIndex:indexPath.row];
    HomeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeItemCell" forIndexPath:indexPath];
    cell.iconImg.image=[UIImage imageNamed:[dic objectForKey:@"icon"]];
    cell.platformLab.text=[dic objectForKey:@"title"];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeItemCell *cell = (HomeItemCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [[BCHUD share] toast:cell.platformLab.text to:self.view];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(BCSCREEN_WIDTH/3, BCPROPORTIONW(90));
}

#pragma mark -
#pragma mark --action
- (void)clickAction:(UIButton *)sender
{
    [[BCHUD share] toast:sender.titleLabel.text to:self.view];
}

@end
