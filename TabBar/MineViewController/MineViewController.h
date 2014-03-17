//
//  MineViewController.h
//  PotatoTravel
//
//  Created by riseikan on 14-3-4.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
@interface MineViewController : UIViewController<MBProgressHUDDelegate,MAMapViewDelegate>
{
    UIView * _closeview;
    UIImageView * _imageview;
    UIView * _clearview;
    CGPoint startPoint;
    UIScrollView * _closescroll;
    UIImageView * _hiddenview;
    
    UIView *_showInfoView;
    CGPoint _closepoint;
    NSMutableArray *_dataArr;
    NSMutableDictionary *_dataDic;
    NSMutableArray *_bigArr;
    UIView *_whiteview;//实验
    UIImageView *_aimageview;//实验
    UIImageView *_bimageview;//实验
    
}
@property (nonatomic, strong) MAMapView *mapView;
@property(nonatomic,retain)MBProgressHUD* progressTest;

@end
