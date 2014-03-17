//
//  DestinationViewController.m
//  PotatoTravel
//
//  Created by riseikan on 14-3-4.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import "DestinationViewController.h"
#import "DestinationCell.h"
#import "DestinationDetailsViewController.h"
@interface DestinationViewController ()

@end

@implementation DestinationViewController
- (void)dealloc
{
    [_progressTest release];
    [_dataDic release];
    [_dataArr release];
    [_bigArr release];
    [_searchArray release];
    [_nameArray release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _dataArr = [[NSMutableArray alloc]init];
        _dataDic = [[NSMutableDictionary alloc]init];
        _bigArr = [[NSMutableArray alloc]init];
        _searchArray = [[NSMutableArray alloc]init];
        _nameArray = [[NSMutableArray alloc]init];
//        NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"李星翰",@"白鹤停",@"贺东",@"王百惠",@"国明月",@"陈晨",@"赵天福",@"韦宁",@"徐海霞",@"王文儒",@"蒋杏飞", nil];
//        [_bigArr addObjectsFromArray:arr];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self searchBarInit];
    [self DestinationTableViewInit];
    [self connection];
}
#pragma mark -
#pragma mark searchBarInit
- (void)searchBarInit{
    UISearchBar *search = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 20, 320, 50)];
    //光标颜色
    search.tintColor = [UIColor blackColor];
    //边框颜色
    search.barTintColor = [UIColor whiteColor];
    //提示内容
    search.placeholder = @"search";
    //添加背景图
    search.backgroundImage = [UIImage imageNamed:@"account_uploadavatar_btn.png"];
    //固定
    //    search.prompt = @"secrch";
    
    //searchbar 右侧图标样式
//    search.showsCancelButton = NO;
    //searchbar 样式
//    search.searchBarStyle = UISearchBarStyleMinimal;
    //显示分类
    //    [search setShowsScopeBar:YES];
    //    search.scopeButtonTitles = @[@"按姓名",@"按性别"];
    [search sizeToFit];//自适应大小
    search.delegate = self;
    
    [self.view addSubview:search];
    [search release];
    //搜索
    _searchDisplay = [[UISearchDisplayController alloc]initWithSearchBar:search contentsController:self];
    _searchDisplay.delegate = self;
    //search中的table遵循协议
    _searchDisplay.searchResultsDataSource = self;
    _searchDisplay.searchResultsDelegate = self;
    //将后视图加载到前面
    [self.view bringSubviewToFront:search];

}
#pragma mark -
#pragma mark seachBar协议

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    NSLog(@"结束搜索");
    return YES;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"开始搜索");
    return YES;
}
//点击Search
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    
}
#pragma mark -
#pragma mark seachDisplay协议

//创建一个方法用于匹配查找
-(void)findFromArray:(NSString *)str{
    /**
     *  For循环进行查找
     */
    //    NSMutableArray *arr = [NSMutableArray array];
    //    for (NSString *name in _nameArray) {
    //        //以什么开头
    //        if ([name hasPrefix:str]) {
    //            [arr addObject:name];
    //            NSLog(@"%@",arr);
    //        }
    //        //以什么结尾
    //        else  if ([name hasSuffix:str]) {
    //            [arr addObject:name];
    //            NSLog(@"%@",arr);
    //        }
    //        //包含
    //        else if ([name rangeOfString:str].length > 0){
    //            [arr addObject:name];
    //            NSLog(@"%@",arr);
    //        }
    //    }
    
    //清空自定义数组
    [_searchArray removeAllObjects];
    NSLog(@"清空自定义数组");
    //利用谓词进行查找从数组中查找是否包含某字符  不区分大小写 不区分儿化音
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self contains[cd] %@",str];
    //                                                    从数组中查找以什么开头
    //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self beginswith[cd] %@",str];
    //                                                    从数组中查找以什么结尾
    //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self endswith[cd] %@",str];
    NSArray *arr = [_nameArray filteredArrayUsingPredicate:predicate];
    //将搜索到的内容放入自定义数组中
    [_searchArray addObjectsFromArray:arr];
    NSLog(@"%@",arr);
}

//搜索框内容
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    NSLog(@"%@___________________",searchString);
    //用方法匹配内容
    [self findFromArray:searchString];
    return YES;
}

//获取分类框
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption{
//    NSLog(@"%d++++++++++++++++++",searchOption);
    return YES;
}

#pragma mark - 
#pragma mark DestinationTableView
- (void)DestinationTableViewInit{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 70, 320, self.view.frame.size.height-50-20-50)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView release];
    
}
#pragma mark - 
#pragma mark TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //搜索TableView
    if (self.searchDisplayController.searchResultsTableView == tableView){
        return [_searchArray count];
    }
    return [_bigArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //搜索TableView重用池
    if (self.searchDisplayController.searchResultsTableView == tableView) {
        static NSString *name = @"secondRoom";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:name];
        if (!cell){
            cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:name]autorelease];
        }
        cell.textLabel.text = [_searchArray objectAtIndex:indexPath.row];
        return cell;
    }
    
    static NSString *cellIdentify = @"Acell";
    
    DestinationCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    
    if (!cell) {
        cell = [[[DestinationCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentify] autorelease];

    }
    NSDictionary *dic = [_bigArr objectAtIndex:indexPath.row];
//    NSLog(@"dic======%@",dic);
//    //pictureImage
    NSArray *pictureImageArr = [dic objectForKey:@"images"];
    NSString *pictureImageStr = [[pictureImageArr firstObject] objectForKey:@"url"];
    NSURL *pictureUrl = [NSURL URLWithString:pictureImageStr];
    [cell.pictureImage setImageWithURL:pictureUrl];
      //nameLable
    if (cell.pictureImage.image == Nil) {
//        [cell mbProgressHUDDestination];
    }
    cell.nameLable.text = [[dic objectForKey:@"place" ] objectForKey:@"name"];
    return cell;
}
//设置行高（分别设置）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //搜索TableView
    if (self.searchDisplayController.searchResultsTableView == tableView){
        return 50;
    }
    return 160;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.searchDisplayController.searchResultsTableView == tableView) {
        DestinationDetailsViewController *details = [[DestinationDetailsViewController alloc]init];
        [self presentViewController:details animated:YES completion:nil];
        [details release];
    }
    DestinationDetailsViewController *details = [[DestinationDetailsViewController alloc]init];
    [self presentViewController:details animated:YES completion:nil];
    [details release];
}
#pragma mark -
#pragma mark AFNetWorking
- (void)connection{
    [self mbProgressHUD];
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
            for (NSDictionary *dic in _bigArr) {
                [_nameArray addObject:[[dic objectForKey:@"place" ] objectForKey:@"name"]];
                NSLog(@"nameArr======%@",_nameArray);
                NSLog(@"searchArr=======%@",_searchArray);
            }
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
