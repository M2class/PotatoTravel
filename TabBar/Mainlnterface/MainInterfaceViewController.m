//
//  MainInterfaceViewController.m
//  PotatoTravel
//
//  Created by riseikan on 14-3-4.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import "MainInterfaceViewController.h"
#import "TalentCell.h"
#import "HotDoorCell.h"
#import "HootDoorDetailViewController.h"
@interface MainInterfaceViewController ()

@end

@implementation MainInterfaceViewController
- (void)dealloc
{
    [_progressTest release];
    [_firstheader release];
    [_secondheader release];
    [_thirdhearder release];
    [_firstfooter release];
    [_secondfooter release];
    [_thirdfooter release];
    [_firstdataDic release];
    [_seconddataDic release];
    [_thirddataDic release];
    [_dataArr release];
    [_firstbigArr release];
    [_secondbigArr release];
    [_thirdbigArr release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _firstbigArr = [[NSMutableArray alloc]init];
        _secondbigArr = [[NSMutableArray alloc]init];
        _thirdbigArr = [[NSMutableArray alloc]init];
        _firstdataDic = [[NSMutableDictionary alloc]init];
        _seconddataDic = [[NSMutableDictionary alloc]init];
        _thirddataDic = [[NSMutableDictionary alloc]init];
        _dataArr = [[NSMutableArray alloc]init];
        _firstcount = 20;
        _secondcount = 20;
        _thirdcount = 20;
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self CCSegmentedControlInit];
    [self scrollAndTableViewInit];

}

#pragma mark -
#pragma mark CCSegmentedControl
- (void)CCSegmentedControlInit{
    _segmentedControl = [[CCSegmentedControl alloc] initWithItems:@[@"热门", @"达人", @"附近"]];
    _segmentedControl.frame = CGRectMake(0, 20, self.view.frame.size.width, 50);
//
//    //设置背景图片，或者设置颜色，或者使用默认白色外观
    _segmentedControl.backgroundImage = [UIImage imageNamed:@"account_login_prompt_ok.png"];
    _segmentedControl.backgroundColor = [UIColor grayColor];
//
//    //阴影部分图片，不设置使用默认椭圆外观的stain
    _segmentedControl.selectedStainView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stain.png"]];
//
    _segmentedControl.selectedSegmentTextColor = [UIColor whiteColor];
    _segmentedControl.segmentTextColor = [self colorWithHexString:@"#535353"];
    [_segmentedControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentedControl];
    
    
    

    
}
- (void)valueChanged:(id)sender
{
    if (_segmentedControl.selectedSegmentIndex == 0) {
            _scroll.contentOffset = CGPointMake(0, _scroll.contentOffset.y);
    }
    if (_segmentedControl.selectedSegmentIndex == 1) {
        _scroll.contentOffset = CGPointMake(self.view.frame.size.width, _scroll.contentOffset.y);
    }
    if (_segmentedControl.selectedSegmentIndex == 2) {
        _scroll.contentOffset = CGPointMake(self.view.frame.size.width*2, _scroll.contentOffset.y);
    }
    //_segmentedControl = sender;
//    NSLog(@"%s line:%d segment has changed to %d", __FUNCTION__, __LINE__, _segmentedControl.selectedSegmentIndex);
    
}

- (UIColor *) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

- (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}
#pragma mark - 
#pragma mark MainInterfaceScrollView&TableView
- (void)scrollAndTableViewInit{
    _scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 70, 320,480-35)];
//    [_scroll setBackgroundColor:[UIColor redColor]];
    _scroll.contentSize = CGSizeMake(320*3, 480-35);
    _scroll.delegate = self;
    _scroll.tag = 99;
    _scroll.pagingEnabled = YES;
    _scroll.bounces = NO; //过度偏移 默认为yes no为禁止
    [self.view addSubview:_scroll];
    [_scroll release];
    
    UIScrollView *firstScoll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, [_firstbigArr count]*150-44-70)];
    firstScoll.contentSize = CGSizeMake(320, [_firstbigArr count]*150-44-70);
    firstScoll.delegate = self;
    firstScoll.tag = 10;
    firstScoll.bounces = NO;
    [_scroll addSubview:firstScoll];
    [firstScoll release];
    
    _firstTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-49-50-20) style:UITableViewStylePlain];
    _firstTable.separatorColor = [UIColor orangeColor];
    _firstTable.delegate = self;
    _firstTable.dataSource = self;
    _firstTable.tag = 0;
    _firstTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [firstScoll addSubview:_firstTable];
    [_firstTable release];
    [self addFirstheader];
    [self addFirstfooter];

    
    UIScrollView *secondScoll = [[UIScrollView alloc]initWithFrame:CGRectMake(320, 0, 320, [_firstbigArr count]*150-44-70)];
    secondScoll.contentSize = CGSizeMake(320, [_firstbigArr count]*150-44-70);
    secondScoll.delegate = self;
    secondScoll.tag = 11;
    secondScoll.bounces = NO;
    [_scroll addSubview:secondScoll];
    [secondScoll release];
    
    _secondTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-49-50-20) style:UITableViewStylePlain];
    _secondTable.separatorColor = [UIColor greenColor];
    _secondTable.delegate = self;
    _secondTable.dataSource = self;
    _secondTable.tag = 1;
    _secondTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [secondScoll addSubview:_secondTable];
    [_secondTable release];
    [self addSecondheader];
    [self addSecondfooter];
    
    UIScrollView *thirdScoll = [[UIScrollView alloc]initWithFrame:CGRectMake(320*2, 0, 320, [_firstbigArr count]*150-44-70)];
    thirdScoll.contentSize = CGSizeMake(320, [_firstbigArr count]*150-44-70);
    thirdScoll.delegate = self;
    thirdScoll.tag = 12;
    thirdScoll.bounces = NO;
    [_scroll addSubview:thirdScoll];
    [thirdScoll release];
    
    _thirdTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-49-50-20) style:UITableViewStylePlain];
    _thirdTable.separatorColor = [UIColor redColor];
    _thirdTable.delegate = self;
    _thirdTable.dataSource = self;
    _thirdTable.tag = 2;
    _thirdTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [thirdScoll addSubview:_thirdTable];
    [_thirdTable release];
    [self addThirdheader];
    [self addThirdfooter];


}
#pragma mark -
#pragma mark TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 1) {
        return [_secondbigArr count];
    }
    if (tableView.tag == 2) {
        return [_thirdbigArr count];
    }
    return [_firstbigArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (tableView.tag == 1) {
        static NSString * cellIdentifyfirst= @"chi1";
        TalentCell * mycell = [tableView dequeueReusableCellWithIdentifier:cellIdentifyfirst];
        if (!mycell) {
            mycell = [[[TalentCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentifyfirst]autorelease];
        }
        NSArray *arr = [_secondbigArr objectAtIndex:indexPath.row];

        //userImage
        NSDictionary *userDic = [[arr firstObject] objectForKey:@"user"];
        NSString *userImagestr = [userDic objectForKey:@"avatar_l"];
        NSURL *userImageurl = [NSURL URLWithString:userImagestr];
        [mycell.userimageButton setImageWithURL:userImageurl];
        //userName
        NSDictionary *nameDic = [[arr firstObject]objectForKey:@"user"];
        NSString *nameStr = [nameDic objectForKey:@"name"];
        [mycell.usernameButton setTitle:nameStr forState:UIControlStateNormal];
        //
        [mycell.atLable setText:@"在"];
        //travernameButton
        NSString *travernameStr = [[arr firstObject]objectForKey:@"trip_name"];
        [mycell.travernameButton setTitle:travernameStr forState:UIControlStateNormal];
        //bacimageButton
        NSString *backimageButtonStr = [[arr firstObject] objectForKey:@"photo_w640"];
        NSURL *backimageButtonUrl = [NSURL URLWithString:backimageButtonStr];
        [mycell.backimageButton setImageWithURL:backimageButtonUrl];
        if (mycell.backimageButton.image == nil) {
            [mycell.backimageButton setImage:[UIImage imageNamed:@"backImage.png"]];
        }

        //timeLable?????????????????????????
//        NSString * dateStr = [[arr firstObject] objectForKey:@"date_added"];
//        NSInteger dateInt = [dateStr intValue];
//        NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateInt];
//        NSLog(@"%@",date);
//        NSString *valueDate = [NSString stringWithFormat:@"%@天",days];
        mycell.timeLable.text = @"5分钟前";
        //describeLable
        NSString *describeLableStr = [[arr firstObject] objectForKey:@"text"];
        mycell.describeLable.text = describeLableStr ;
        //locationButton
        NSString *locationButtoncountryStr = [[arr firstObject] objectForKey:@"country"];
        NSString *locationButtonprovinceStr = [[arr firstObject] objectForKey:@"province"];
        NSString *locationButtoncityStr = [[arr firstObject] objectForKey:@"city"];
        NSString *allStr = [NSString stringWithFormat:@"%@ %@ %@",locationButtoncountryStr,locationButtonprovinceStr,locationButtoncityStr];
        [mycell.locationButton setImage:[UIImage imageNamed:@"33.png"] forState:UIControlStateNormal];
        [mycell.locationButton setTitle:allStr forState:UIControlStateNormal];
        [mycell.hiddenButton setTitle:@"5条隐藏消息" forState:UIControlStateNormal];
        
        return mycell;
    }
    if (tableView.tag == 2) {
        static NSString * cellIdentifysecond= @"chi2";
        TalentCell * mycell = [tableView dequeueReusableCellWithIdentifier:cellIdentifysecond];
        if (!mycell) {
            mycell = [[[TalentCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentifysecond]autorelease];
        }
        NSArray *arr = [_thirdbigArr objectAtIndex:indexPath.row];
        //userImage
        NSDictionary *userDic = [[arr firstObject] objectForKey:@"user"];
        NSString *userImagestr = [userDic objectForKey:@"avatar_l"];
        NSURL *userImageurl = [NSURL URLWithString:userImagestr];
        [mycell.userimageButton setImageWithURL:userImageurl];
        //userName
        NSDictionary *nameDic = [[arr firstObject]objectForKey:@"user"];
        NSString *nameStr = [nameDic objectForKey:@"name"];
        [mycell.usernameButton setTitle:nameStr forState:UIControlStateNormal];
        //
        [mycell.atLable setText:@"在"];
        //travernameButton
        NSString *travernameStr = [[arr firstObject]objectForKey:@"trip_name"];
        [mycell.travernameButton setTitle:travernameStr forState:UIControlStateNormal];
        //backimageButton


        NSString *backimageButtonStr = [[arr firstObject] objectForKey:@"photo_w640"];
        NSURL *backimageButtonUrl = [NSURL URLWithString:backimageButtonStr];
        [mycell.backimageButton setImageWithURL:backimageButtonUrl];
        if (mycell.backimageButton.image == nil) {
            [mycell.backimageButton setImage:[UIImage imageNamed:@"backImage.png"]];
        }

        //timeLable?????????????????????????
        //        NSString * dateStr = [[arr firstObject] objectForKey:@"date_added"];
        //        NSInteger dateInt = [dateStr intValue];
        //        NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateInt];
        //        NSLog(@"%@",date);
        //        NSString *valueDate = [NSString stringWithFormat:@"%@天",days];
        mycell.timeLable.text = @"5分钟前";
        //describeLable
        NSString *describeLableStr = [[arr firstObject] objectForKey:@"text"];
        mycell.describeLable.text = describeLableStr ;
        //locationButton
        NSString *locationButtoncountryStr = [[arr firstObject] objectForKey:@"country"];
        NSString *locationButtonprovinceStr = [[arr firstObject] objectForKey:@"province"];
        NSString *locationButtoncityStr = [[arr firstObject] objectForKey:@"city"];
        NSString *allStr = [NSString stringWithFormat:@"%@ %@ %@",locationButtoncountryStr,locationButtonprovinceStr,locationButtoncityStr];
        [mycell.locationButton setImage:[UIImage imageNamed:@"33.png"] forState:UIControlStateNormal];
        [mycell.locationButton setTitle:allStr forState:UIControlStateNormal];
        [mycell.hiddenButton setTitle:@"5条隐藏消息" forState:UIControlStateNormal];
        
        return mycell;
    }
    if (tableView.tag == 0) {
        static NSString *cellIdentifythird = @"Acell";
        
        HotDoorCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifythird];
        
        if (!cell) {
            cell = [[[HotDoorCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifythird] autorelease];
        }
//        NSLog(@"%@",_bigArr);
        //showImage
        NSDictionary *dic = [_firstbigArr objectAtIndex:indexPath.row];
//        NSLog(@"dic ===  %@",dic);
        NSString *showImagestr = [dic objectForKey:@"cover_image"];
        NSURL *showImageurl = [NSURL URLWithString:showImagestr];
        [cell.showImage setImageWithURL:showImageurl];

        //
        NSString *titleLable = [dic objectForKey:@"name"];
        cell.titleLabel.text = titleLable;

        //获取时间
        NSString * dateStr = [dic objectForKey:@"first_day"];
        NSInteger dateInt = [dateStr intValue];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateInt];
        //    //日期格式转换,时间格式化
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *value = [dateFormatter stringFromDate:date];
        NSString *days = [dic objectForKey:@"day_count"];
        NSString *valueDate = [NSString stringWithFormat:@"%@  %@天",value,days];
        cell.dateLabel.text = valueDate;
        //
        NSString *countryAndCity = [dic objectForKey:@"popular_place_str"];
//        NSLog(@"%@",countryAndCity);
        cell.placeLabel.text = countryAndCity;
        //
        NSDictionary *peopleDic = [dic objectForKey:@"user"];
        NSString *peopleImagestr = [peopleDic objectForKey:@"avatar_l"];
        NSURL *peopleImageurl = [NSURL URLWithString:peopleImagestr];
//        NSLog(@"%@",peopleImageurl);
        [cell.peopleButton setImageWithURL:peopleImageurl];
        
        NSDictionary *nameDic = [dic objectForKey:@"user"];
        NSString *name = [nameDic objectForKey:@"name"];
        cell.nameLabel.text = name;
        
        return cell;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 1) {
        return 230;
    }
    if (tableView.tag == 2) {
        return 230;
    }
    if (tableView.tag == 0) {
        return 150;
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HootDoorDetailViewController *hotDoorSetail = [[HootDoorDetailViewController alloc]init];
    [self presentViewController:hotDoorSetail animated:YES completion:nil];
    [hotDoorSetail release];
}
#pragma mark - 
#pragma mark ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"%f",scrollView.contentOffset.x);
    if (scrollView.tag == 99) {
        if (scrollView.contentOffset.x == 320) {
            _segmentedControl.selectedSegmentIndex = 1;
        }
        if (scrollView.contentOffset.x == 0) {
            _segmentedControl.selectedSegmentIndex = 0;
        }
        if (scrollView.contentOffset.x == 320*2) {
            _segmentedControl.selectedSegmentIndex = 2;
        }
    }
}

#pragma mark -
#pragma mark AFNetWorking
- (void)firstconnection{

        //first
        NSDictionary *firstdic = [NSDictionary dictionaryWithObjectsAndKeys:@"0",@"start",@"20",@"count",@"true",@"is_ipad", nil];
        [AsyConnecModel asyncGetWithUrl:AF_TripConnection strparmaters:firstdic finishBlock:^(id response){
            if ([response isKindOfClass:[NSDictionary class]]) {
                [_firstdataDic addEntriesFromDictionary:response];
                //            NSLog(@"_dataDic ======%@",_dataDic);
                [_firstbigArr addObjectsFromArray:[_firstdataDic objectForKey:@"trips"]];
                [self doneWithView:_firstheader];
                [_firstTable reloadData];
                //            NSLog(@"_bigArr =======%@",_firstbigArr);
                //            NSLog(@"count=====%d",_firstbigArr.count);
            }
            if ([response isKindOfClass:[NSArray class]]) {
                [_dataArr addObjectsFromArray:response];
                //            NSLog(@"_dataArr======%@",_dataArr);
            }
        }];
}
- (void)secondconnection{
//second
        NSDictionary *seconddic = [NSDictionary dictionaryWithObjectsAndKeys:@"20",@"count", nil];
        [AsyConnecModel asyncGetWithUrl:AF_TalentConnection strparmaters:seconddic finishBlock:^(id response){
            if ([response isKindOfClass:[NSDictionary class]]) {
                [_seconddataDic addEntriesFromDictionary:response];
                //            NSLog(@"_dataDic ======%@",_seconddataDic);
                [_secondbigArr addObjectsFromArray:[_seconddataDic objectForKey:@"items"]];
                [self doneWithView:_secondheader];
                [_secondTable reloadData];
                //            NSLog(@"_bigArr =======%@",_secondbigArr);
                //            NSLog(@"count=====%d",_secondbigArr.count);
            }
            if ([response isKindOfClass:[NSArray class]]) {
                [_dataArr addObjectsFromArray:response];
                //            NSLog(@"_dataArr======%@",_dataArr);
            }
        }];
}
- (void)thirdconnection{
        //third
        NSDictionary *thirdDic = [NSDictionary dictionaryWithObjectsAndKeys:@"38.886006608329645",@"lat",@"121.54316915009309",@"lng",@"20",@"count",@"false",@"shift", nil];
        [AsyConnecModel asyncGetWithUrl:AF_NearbyConnection strparmaters:thirdDic finishBlock:^(id response){
            if ([response isKindOfClass:[NSDictionary class]]) {
                [_thirddataDic addEntriesFromDictionary:response];
                //            NSLog(@"_dataDic ======%@",_seconddataDic);
                [_thirdbigArr addObjectsFromArray:[_thirddataDic objectForKey:@"items"]];
                [self doneWithView:_thirdhearder];
                [_thirdTable reloadData];
                //            NSLog(@"_bigArr =======%@",_thirdbigArr);
                //            NSLog(@"count=====%d",_thirdbigArr.count);
            }
            if ([response isKindOfClass:[NSArray class]]) {
                [_dataArr addObjectsFromArray:response];
                //            NSLog(@"_dataArr======%@",_dataArr);
            }
        }];
}

- (void)firstDownconnection{
    NSString *str = [NSString stringWithFormat:@"%d",_firstcount];
    //first
    NSDictionary *firstdic = [NSDictionary dictionaryWithObjectsAndKeys:@"0",@"start",str,@"count",@"true",@"is_ipad", nil];
    [AsyConnecModel asyncGetWithUrl:AF_TripConnection strparmaters:firstdic finishBlock:^(id response){
        if ([response isKindOfClass:[NSDictionary class]]) {
            [_firstdataDic addEntriesFromDictionary:response];
            //            NSLog(@"_dataDic ======%@",_dataDic);
            [_firstbigArr addObjectsFromArray:[_firstdataDic objectForKey:@"trips"]];
            [self doneWithView:_firstfooter];
            [_firstTable reloadData];
            //            NSLog(@"_bigArr =======%@",_firstbigArr);
            //            NSLog(@"count=====%d",_firstbigArr.count);
        }
        if ([response isKindOfClass:[NSArray class]]) {
            [_dataArr addObjectsFromArray:response];
            //            NSLog(@"_dataArr======%@",_dataArr);
        }
    }];
}
- (void)secondDownconnection{
    //second
    NSString *str = [NSString stringWithFormat:@"%d",_secondcount];
    NSDictionary *seconddic = [NSDictionary dictionaryWithObjectsAndKeys:str,@"count", nil];
    [AsyConnecModel asyncGetWithUrl:AF_TalentConnection strparmaters:seconddic finishBlock:^(id response){
        if ([response isKindOfClass:[NSDictionary class]]) {
            [_seconddataDic addEntriesFromDictionary:response];
            //            NSLog(@"_dataDic ======%@",_seconddataDic);
            [_secondbigArr addObjectsFromArray:[_seconddataDic objectForKey:@"items"]];
            [self doneWithView:_secondfooter];
            [_secondTable reloadData];
            //            NSLog(@"_bigArr =======%@",_secondbigArr);
            //            NSLog(@"count=====%d",_secondbigArr.count);
        }
        if ([response isKindOfClass:[NSArray class]]) {
            [_dataArr addObjectsFromArray:response];
            //            NSLog(@"_dataArr======%@",_dataArr);
        }
    }];
}
- (void)thirdDownconnection{
    //third
    NSString *str = [NSString stringWithFormat:@"%d",_thirdcount];
    NSDictionary *thirdDic = [NSDictionary dictionaryWithObjectsAndKeys:@"38.886006608329645",@"lat",@"121.54316915009309",@"lng",str,@"count",@"false",@"shift", nil];
    [AsyConnecModel asyncGetWithUrl:AF_NearbyConnection strparmaters:thirdDic finishBlock:^(id response){
        if ([response isKindOfClass:[NSDictionary class]]) {
            [_thirddataDic addEntriesFromDictionary:response];
            //            NSLog(@"_dataDic ======%@",_seconddataDic);
            [_thirdbigArr addObjectsFromArray:[_thirddataDic objectForKey:@"items"]];
            [self doneWithView:_thirdfooter];
            [_thirdTable reloadData];
            //            NSLog(@"_bigArr =======%@",_thirdbigArr);
            //            NSLog(@"count=====%d",_thirdbigArr.count);
        }
        if ([response isKindOfClass:[NSArray class]]) {
            [_dataArr addObjectsFromArray:response];
            //            NSLog(@"_dataArr======%@",_dataArr);
        }
    }];
}


#pragma mark -
#pragma mark 刷新第三方
- (void)addFirstheader{
    // 3.集成刷新控件
    // 3.1.下拉刷新
    MJRefreshHeaderView *header = [MJRefreshHeaderView header];
    header.scrollView = _firstTable;
    header.delegate = self;
    // 自动刷新
    [header beginRefreshing];
    _firstheader = header;

    

}
- (void)addFirstfooter{
    // 3.2.上拉加载更多
    MJRefreshFooterView *footer = [MJRefreshFooterView footer];
    footer.scrollView = _firstTable;
    footer.delegate = self;
    _firstfooter = footer;
}
- (void)addSecondheader{
    // 3.集成刷新控件
    // 3.1.下拉刷新
    MJRefreshHeaderView *header = [MJRefreshHeaderView header];
    header.scrollView = _secondTable;
    header.delegate = self;
    // 自动刷新
    [header beginRefreshing];
    _secondheader = header;
    
    
}
- (void)addSecondfooter{
    // 3.2.上拉加载更多
    MJRefreshFooterView *footer = [MJRefreshFooterView footer];
    footer.scrollView = _secondTable;
    footer.delegate = self;
    _secondfooter = footer;
}
- (void)addThirdheader{
    // 3.集成刷新控件
    // 3.1.下拉刷新
    MJRefreshHeaderView *header = [MJRefreshHeaderView header];
    header.scrollView = _thirdTable;
    header.delegate = self;
    // 自动刷新
    [header beginRefreshing];
    _thirdhearder = header;
    
    
}
- (void)addThirdfooter{
    // 3.2.上拉加载更多
    MJRefreshFooterView *footer = [MJRefreshFooterView footer];
    footer.scrollView = _thirdTable;
    footer.delegate = self;
    _thirdfooter = footer;
}
- (void)doneWithView:(MJRefreshBaseView *)refreshView
{
    // 刷新表格
    [_firstTable reloadData];
    [_secondTable reloadData];
    [_thirdTable reloadData];
    
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [refreshView endRefreshing];
}

#pragma mark - 刷新控件的代理方法
#pragma mark 开始进入刷新状态
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    NSLog(@"刷新解析");
    if (refreshView == _firstheader) {
        [self mbProgressHUD];
        [_firstbigArr removeAllObjects];
        [self firstconnection];
        NSLog(@"解析第一个");
    }
    if (refreshView == _secondheader) {
        [self mbProgressHUD];
        [_secondbigArr removeAllObjects];
        [self secondconnection];
        NSLog(@"解析第二个");
    }
    if (refreshView == _thirdhearder) {
        [self mbProgressHUD];
        [_thirdbigArr removeAllObjects];
        [self thirdconnection];
        NSLog(@"解析第三个");
    }
    if (refreshView == _firstfooter) {
        [self mbProgressHUD];
        _firstcount += 5;
        [_firstbigArr removeAllObjects];
        [self firstDownconnection];
        NSLog(@"解析第一个");
    }
    if (refreshView == _secondfooter) {
        [self mbProgressHUD];
        _secondcount += 5;
        [_secondbigArr removeAllObjects];
        [self secondDownconnection];
        NSLog(@"解析第二个");
    }
    if (refreshView == _thirdfooter) {
        [self mbProgressHUD];
        _thirdcount += 5;
        [_thirdbigArr removeAllObjects];
        [self thirdDownconnection];
        NSLog(@"解析第三个");
    }


}

#pragma mark 刷新完毕
- (void)refreshViewEndRefreshing:(MJRefreshBaseView *)refreshView
{
    NSLog(@"%@----刷新完毕", refreshView.class);
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
