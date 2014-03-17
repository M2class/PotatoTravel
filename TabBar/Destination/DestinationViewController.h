//
//  DestinationViewController.h
//  PotatoTravel
//
//  Created by riseikan on 14-3-4.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//
//目的地
#import <UIKit/UIKit.h>

@interface DestinationViewController : UIViewController<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,UISearchDisplayDelegate,MBProgressHUDDelegate>
{
    NSMutableArray *_dataArr;//传值用数组
    NSMutableDictionary *_dataDic;//传值用
    NSMutableArray *_bigArr;
    NSMutableArray *_bigDic;
    UITableView *_tableView;//
    UISearchDisplayController *_searchDisplay;//搜索
    NSMutableArray *_searchArray;//搜索用数组
    NSMutableArray *_nameArray;//搜索用
}
@property(nonatomic,retain)MBProgressHUD* progressTest;

@end
