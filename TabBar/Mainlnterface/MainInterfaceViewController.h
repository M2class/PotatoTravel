//
//  MainInterfaceViewController.h
//  PotatoTravel
//
//  Created by riseikan on 14-3-4.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//
//逛逛
#import <UIKit/UIKit.h>
#import "CCSegmentedControl.h"//第三方上滑块
@interface MainInterfaceViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate,MBProgressHUDDelegate>
{
    NSMutableArray *_firstbigArr;//储存数据大数组
    NSMutableArray *_secondbigArr;
    NSMutableArray *_thirdbigArr;
    CCSegmentedControl* _segmentedControl;//第三方上滑块
    UIScrollView *_scroll;//监听偏移量 固设置为成员变量
    NSMutableDictionary *_firstdataDic;//接收用字典
    NSMutableDictionary *_seconddataDic;
    NSMutableDictionary *_thirddataDic;
    NSMutableArray*_dataArr;//接收用数组
    UITableView *_firstTable;//第一个TableView
    UITableView *_secondTable;//第二个TableView
    UITableView *_thirdTable;//第个三TableView
    MJRefreshHeaderView *_firstheader;//下拉刷新
    MJRefreshHeaderView *_secondheader;//下拉刷新
    MJRefreshHeaderView *_thirdhearder;//下拉刷新
    MJRefreshFooterView *_firstfooter;//上拉加载
    MJRefreshFooterView *_secondfooter;//上拉加载
    MJRefreshFooterView *_thirdfooter;//上拉加载
    int _firstcount;//每次加载数据
    int _secondcount;//每次加载数据
    int _thirdcount;//每次加载数据

}
@property(nonatomic,retain)MBProgressHUD* progressTest;

@end
