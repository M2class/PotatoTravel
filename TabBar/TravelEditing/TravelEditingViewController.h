//
//  TravelEditingViewController.h
//  PotatoTravel
//
//  Created by riseikan on 14-3-4.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//
//旅程编辑
#import <UIKit/UIKit.h>

@interface TravelEditingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MBProgressHUDDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArr;
    NSMutableDictionary *_dataDic;
    NSMutableArray *_bigArr;
}
@property(nonatomic,retain)MBProgressHUD* progressTest;

@end
