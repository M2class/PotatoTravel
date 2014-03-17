//
//  TravelEditingViewController.m
//  PotatoTravel
//
//  Created by riseikan on 14-3-4.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import "TravelEditingViewController.h"
#import "TravelEdtingTopCell.h"
#import "TravelEdtingDownCell.h"
#import "AirAddViewController.h"
#import "FootWriteViewController.h"
@interface TravelEditingViewController ()

@end

@implementation TravelEditingViewController
- (void)dealloc
{
    [_progressTest release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"account_uploadavatar_btn"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"account_uploadavatar_btn.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
   //self.navigationItem.title = @"旅程编辑";
    

    UILabel *travelEditingOnLable = [[UILabel alloc]initWithFrame:CGRectMake(150, 10, 100, 30)];
    travelEditingOnLable.text = @"旅程编辑";
    travelEditingOnLable.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = travelEditingOnLable;
    [travelEditingOnLable release];
    //设置
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fix.png"] style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonItemAction:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    [rightButton release];
    
    //框分隔
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height - 53) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_tableView];
    [_tableView release];
//    [self mbProgressHUD];

    
}




//设置行高（分别设置）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return 315;
    }
    return (480 - 64 - 315);
}

//设置显示行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

//重用池
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        static NSString * cellIdentify = @"Acell";
        TravelEdtingTopCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
        if (!cell) {
            cell = [[[TravelEdtingTopCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentify] autorelease];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.nameButtonAction = @selector(nameButtonAction:);
        cell.airButtonAction = @selector(airButtonAction:);
        cell.hotelButtonAction = @selector(hotelButtonAction:);
        cell.target = self;
        
        return cell;
        
    }
    static NSString * cellIdentify = @"Bcell";
    TravelEdtingDownCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[[TravelEdtingDownCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentify] autorelease];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row != 0) {
        FootWriteViewController *footWrite = [[FootWriteViewController alloc]init];
        [self.navigationController pushViewController:footWrite animated:YES];
        [footWrite release];
    }
}
-(void)nameButtonAction:(id)sender{
    
    NSLog(@"name name name");
    //    AirAddViewController * airAdd = [[AirAddViewController alloc] init];
    //    [self presentViewController:airAdd animated:YES completion:^{}];
    //    [airAdd release];
}
-(void)airButtonAction:(id)sender{
    NSLog(@"airButtonAction");
    AirAddViewController *airAdd = [[AirAddViewController alloc]init];
    [self.navigationController pushViewController:airAdd animated:YES];
    [airAdd release];
}



-(void)rightButtonItemAction:(id)sender{
    
    NSLog(@"lalal");
}
-(void)hotelButtonAction:(id)sender{
    NSLog(@"hotelButtonAction");
}
#pragma mark -
#pragma mark AFNetWorking
- (void)connection{
    //    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"0",@"start",@"20",@"count",@"true",@"is_ipad", nil];
    [AsyConnecModel asyncGetWithUrl:AF_Destination strparmaters:nil finishBlock:^(id response){
        if ([response isKindOfClass:[NSDictionary class]]) {
            [_dataDic addEntriesFromDictionary:response];
            NSLog(@"_dataDic ======%@",_dataDic);
            [_bigArr addObjectsFromArray:[_dataDic objectForKey:@"trips"]];
            [_tableView reloadData];
            //                        NSLog(@"_bigArr =======%@",_bigArr);
            //            NSLog(@"count=====%d",_firstbigArr.count);
        }
        if ([response isKindOfClass:[NSArray class]]) {
            [_dataArr addObjectsFromArray:response];
            //                        NSLog(@"_dataArr======%@",_dataArr);
            [_bigArr addObjectsFromArray:_dataArr];
            //            NSLog(@"_bigArr =====%@",_bigArr);
            [_tableView reloadData];
        }
    }];
}
#pragma mark -
#pragma mark 等待加载第三方
- (void)mbProgressHUD{
    _progressTest = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_progressTest];
    [self.view bringSubviewToFront:_progressTest];
    _progressTest.mode = MBProgressHUDModeIndeterminate;
    _progressTest.animationType=MBProgressHUDAnimationZoom;
    _progressTest.delegate = self;
    _progressTest.labelText = @"加载中...";
    [_progressTest showWhileExecuting:@selector(myProgressTask) onTarget:self withObject:nil animated:YES];
    
}
-(void) myProgressTask{
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        _progressTest.progress = progress;
        usleep(50000);
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
