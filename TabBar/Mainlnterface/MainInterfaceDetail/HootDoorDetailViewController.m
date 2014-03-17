//
//  HootDoorDetailViewController.m
//  HootDoorDetail
//
//  Created by _ MarS. on 14-3-12.
//  Copyright (c) 2014年 王柏慧. All rights reserved.
//

#import "HootDoorDetailViewController.h"
#import "HootDoorDetailUpCell.h"
#import "HootDoorDetailDowCell.h"
#import <ShareSDK/ShareSDK.h>
@interface HootDoorDetailViewController ()

@end

@implementation HootDoorDetailViewController

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
    UIImageView *topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 320, 44)];
    [topImageView setImage:[UIImage imageNamed:@"account_uploadavatar_btn.png"]];
    [self.view addSubview:topImageView];
    [topImageView release];
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height-64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    [tableView release];
    
    //左侧返回键
    UIButton * leftButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 32, 20, 20)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"gallery_back.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftButton];
    [leftButton release];
    
    //右侧分享建
    UIButton * rightButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 32, 20, 20)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"tripview_share.png"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightButton];
    [rightButton release];
    
    //留言图标
    UIButton * messageButton = [[UIButton alloc] initWithFrame:CGRectMake(240, 35, 20, 20)];
    [messageButton setBackgroundImage:[UIImage imageNamed:@"tripview_reply.png"] forState:UIControlStateNormal];
    [messageButton addTarget:self action:@selector(messageButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:messageButton];
    [messageButton release];
    
    //收藏图标
    UIButton * likeButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 32, 20, 20)];
    [likeButton setBackgroundImage:[UIImage imageNamed:@"tripview_bookmark2.png"] forState:UIControlStateNormal];
    [likeButton addTarget:self action:@selector(likeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:likeButton];
    [likeButton release];
    
    //下载图标
    UIButton * downLoadButton = [[UIButton alloc] initWithFrame:CGRectMake(160, 30, 20, 20)];
    [downLoadButton setBackgroundImage:[UIImage imageNamed:@"tripview_offline.png"] forState:UIControlStateNormal];
    [downLoadButton addTarget:self action:@selector(downLoadButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:downLoadButton];
    [downLoadButton release];
}

//左侧键点击事件
-(void)leftButtonAction:(id)sender{
    NSLog(@"left left left");
    [self dismissViewControllerAnimated:YES completion:nil];
}
//右侧键点击事件
-(void)rightButtonAction:(id)sender{
    NSLog(@"right right right");
//    NSString *str = [NSString stringWithFormat:@"这是我在@土豆旅行 获得的旅行成就，快来我的个人主页看看吧：http://breadtrip.com/u/%@",[_dataDic objectForKey:@"id"]];
//    NSLog(@"str=====%@",str);
    
    NSLog(@"分享成就点击事件");
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK"  ofType:@"jpg"];
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"这是我在@土豆旅行 获得的旅行成就，快来我的个人主页看看吧：http://breadtrip.com/u/2386767053"
                                       defaultContent:@"土豆旅行期待您的加入~"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"ShareSDK"
                                                  url:@"http://www.sharesdk.cn"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    
    
    
    
    [ShareSDK showShareActionSheet:nil
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions: nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
    
    
    
}
//留言键点击事件
-(void)messageButtonAction:(id)sender{
    NSLog(@"message message message");
}
//收藏键点击事件
-(void)likeButtonAction:(id)sender{
    NSLog(@"like like like");
}
//下载点击事件
-(void)downLoadButtonAction:(id)sender{
    NSLog(@"down down down");
    UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"通告" message:@"本功能即将开启！敬请期待~~~！！！" delegate:self cancelButtonTitle:@"确定"otherButtonTitles: nil];
    [aler show];
}

//设置行高（分别设置）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        return 410;
    }
    return 270;
}

#pragma mark -
#pragma mark tableView 必须实现协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        static NSString *cellIdentify = @"Acell";
        HootDoorDetailUpCell * upCell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
        if (!upCell) {
            upCell = [[[HootDoorDetailUpCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentify] autorelease];
        }
        [upCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return upCell;
    }
    static NSString * cellIdentify = @"Bcell";
    HootDoorDetailDowCell * downCell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!downCell) {
        downCell = [[[HootDoorDetailDowCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentify] autorelease];
    }
    [downCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return downCell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
