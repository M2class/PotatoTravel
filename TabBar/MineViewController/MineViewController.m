//
//  MineViewController.m
//  PotatoTravel
//
//  Created by riseikan on 14-3-4.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//
//我的
#import "MineViewController.h"
#import "SetupViewController.h"
#import <ShareSDK/ShareSDK.h>
#import "AllmessageViewController.h"
#import "AchievementViewController.h"
@interface MineViewController ()

@end
#define SHOWVIEWHEIGHT 250
@implementation MineViewController
- (void)dealloc
{
    [_dataArr release];
    [_dataDic release];
    [_bigArr release];
    [_progressTest release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _bigArr = [[NSMutableArray alloc]init];
        _dataDic = [[NSMutableDictionary alloc]init];
        _dataArr = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    [self connection];
    
    
}
-(void)allInit{
    //    显示地图
    self.mapView=[[MAMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES; //YES 为打开定位,NO 为关闭定位
    [self modeAction];
    [self.view addSubview:self.mapView];
    
    
    
    //    地图上方一个透明蒙板
    //    _clearview = [[UIView alloc] initWithFrame:CGRectMake(0, 250, 320, 250)];
    //    NSLog(@"%f     orign.y",  _clearview.frame.origin.y);
    //
    //    [_clearview setBackgroundColor:[UIColor clearColor]];
    //    _clearview.userInteractionEnabled= YES;
    //    [self.view addSubview:_clearview];
    //    [_clearview release];
    //    UIImageView *mineOnImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    //    [mineOnImage setImage:[UIImage imageNamed:@"account_uploadavatar_btn"]];
    //    [self.navigationController.navigationBar addSubview:mineOnImage];
    //    [mineOnImage release];
    
    UILabel *mineOnLable = [[UILabel alloc]initWithFrame:CGRectMake(125, 10, 100, 30)];
    mineOnLable.text = [_dataDic objectForKey:@"name"];
    mineOnLable.textColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:mineOnLable];
    [mineOnLable release];
    
    //导航栏
    UIBarButtonItem * leftbt = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"share.png"] style:UIBarButtonItemStyleDone target:self action:@selector(leftbtAction:)];
    UIBarButtonItem * rightbt = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fix.png"] style:UIBarButtonItemStyleDone target:self action:@selector(rightbtAction:)];
    [self.navigationItem setLeftBarButtonItem:leftbt];
    [self.navigationItem setRightBarButtonItem:rightbt];
//    self.navigationItem.title = [_dataDic objectForKey:@"name"];
    //    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    _showInfoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
    [self.view addSubview:_showInfoView];
    [_showInfoView release];
    
//    //    隐藏框
//    _hiddenview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
//    [_hiddenview setImage:[UIImage imageNamed:@"dropdown.png"]
//     ];
//    _hiddenview.userInteractionEnabled= YES;
//    [_showInfoView addSubview:_hiddenview];
//    
//    
//    //    隐藏框上得按钮
//    
//    //    收藏
//    UIButton * havebutton = [[UIButton alloc] initWithFrame:CGRectMake(30, 40, 90, 40)];
//    [havebutton setBackgroundImage:[UIImage imageNamed:@"userinfo_bookmarks.png"] forState:UIControlStateNormal];
//    [_hiddenview addSubview: havebutton];
//    [havebutton release];
//
//    //    收藏数   这里方解析得数据
//    UILabel * countlable = [[UILabel alloc] initWithFrame:CGRectMake(103, 70, 40, 20)];
//    [countlable setText:@"0"];
//    [countlable setTextColor:[UIColor greenColor]];
//    [_hiddenview addSubview:countlable];
//    [countlable release];
//    
//    //   喜欢
//    UIButton * lovebutton = [[UIButton alloc] initWithFrame:CGRectMake(30, 140, 40, 40)];
//    [lovebutton setBackgroundImage:[UIImage imageNamed:@"like2_highlight.png"] forState:UIControlStateNormal];
//    [_hiddenview addSubview: lovebutton];
//    [lovebutton release];
//    //    喜欢两个字
//    UILabel * liklable = [[UILabel alloc] initWithFrame:CGRectMake(78, 140, 40, 20)];
//    [liklable setText:@"喜欢"];
//    [liklable setTextColor:[UIColor greenColor]];
//    [_hiddenview addSubview:liklable];
//    [liklable release];
//    //    喜欢数   这里方解析得数据
//    UILabel * countlable1 = [[UILabel alloc] initWithFrame:CGRectMake(83, 165, 40, 20)];
//    [countlable1 setText:@"0"];
//    [countlable1 setTextColor:[UIColor greenColor]];
//    [_hiddenview addSubview:countlable1];
//    [countlable1 release];
//    
//    //  想去
//    UIButton * lovebutton1 = [[UIButton alloc] initWithFrame:CGRectMake(180, 45, 80, 30)];
//    [lovebutton1 setBackgroundImage:[UIImage imageNamed:@"userinfo_wish.png"] forState:UIControlStateNormal];
//    [_hiddenview addSubview: lovebutton1];
//    [lovebutton1 release];
//    //    想去两个字
//    //    UILabel * liklable11 = [[UILabel alloc] initWithFrame:CGRectMake(228, 40, 40, 20)];
//    //    [liklable11 setText:@"想去"];
//    //    [liklable11 setTextColor:[UIColor greenColor]];
//    //    [_hiddenview addSubview:liklable11];
//    //    [liklable11 release];
//    //    想去数   这里方解析得数据
//    UILabel * countlable11 = [[UILabel alloc] initWithFrame:CGRectMake(228, 60, 30, 20)];
//    [countlable11 setText:@"0"];
//    [countlable11 setTextColor:[UIColor greenColor]];
//    [_hiddenview addSubview:countlable11];
//    [countlable11 release];
//    
//    //   关注
//    UIButton * lovebutton22 = [[UIButton alloc] initWithFrame:CGRectMake(180, 100, 30, 30)];
//    [lovebutton22 setBackgroundImage:[UIImage imageNamed:@"user_info_followed_button_image.png"] forState:UIControlStateNormal];
//    [_hiddenview addSubview: lovebutton22];
//    [lovebutton22 release];
//    //    关注两个字
//    UILabel * liklable22 = [[UILabel alloc] initWithFrame:CGRectMake(228, 100, 40, 20)];
//    [liklable22 setText:@"关注"];
//    [liklable22 setTextColor:[UIColor greenColor]];
//    [_hiddenview addSubview:liklable22];
//    [liklable22 release];
//    //    关注数   这里方解析得数据
//    UILabel * countlable22 = [[UILabel alloc] initWithFrame:CGRectMake(228, 125, 30, 20)];
//    [countlable22 setText:@"0"];
//    [countlable22 setTextColor:[UIColor greenColor]];
//    [_hiddenview addSubview:countlable22];
//    [countlable22 release];
//    
//    //    粉丝
//    UIButton * lovebutton33 = [[UIButton alloc] initWithFrame:CGRectMake(180, 160, 30, 30)];
//    [lovebutton33 setBackgroundImage:[UIImage imageNamed:@"userinfo_passport_followers_clicked.png"] forState:UIControlStateNormal];
//    [_hiddenview addSubview: lovebutton33];
//    [lovebutton33 release];
//    //    粉丝两个字
//    UILabel * liklable33 = [[UILabel alloc] initWithFrame:CGRectMake(228, 160, 40, 20)];
//    [liklable33 setText:@"粉丝"];
//    [liklable33 setTextColor:[UIColor greenColor]];
//    [_hiddenview addSubview:liklable33];
//    [liklable33 release];
//    //    粉丝数   这里方解析得数据
//    UILabel * countlable33 = [[UILabel alloc] initWithFrame:CGRectMake(228, 185, 30, 20)];
//    [countlable33 setText:@"2"];
//    [countlable33 setTextColor:[UIColor greenColor]];
//    [_hiddenview addSubview:countlable33];
//    [countlable33 release];
    
    
    
    
//    [_hiddenview release];
    
    
    //用户背景图
    _imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, -10, 320, 240)];
    [_imageview setImage:[UIImage imageNamed:@"userimage.png"]];
    //    view上放置的按钮默认是不可点击的
    _imageview.userInteractionEnabled = YES;
    [_showInfoView addSubview:_imageview];
    [_imageview release];
    
    
    
    //用户👦头像🔘
    UIButton * userimageButton = [[UIButton alloc]initWithFrame:CGRectMake(130, 30, 50, 50)];
    userimageButton.layer.cornerRadius = 25;
    userimageButton.layer.masksToBounds = YES;
    [userimageButton addTarget:self action:@selector(userimageAction:) forControlEvents:UIControlEventTouchUpInside];
//    [userimageButton setBackgroundImage:[UIImage imageNamed:@"userpicture.png"] forState:UIControlStateNormal];
    NSURL *userImageUrl = [NSURL URLWithString:[_dataDic objectForKey:@"avatar_l"]];
    [userimageButton setImageWithURL:userImageUrl];
    [_imageview addSubview:userimageButton];
    [userimageButton release];
    
    //    消息按钮🔘
    UIButton * messagebutton = [[UIButton alloc] initWithFrame:CGRectMake(90, 90, 60, 20)];
    [messagebutton setImage:[UIImage imageNamed:@"information.png"] forState:UIControlStateNormal];
    [messagebutton addTarget:self action:@selector(messageAction:) forControlEvents:UIControlEventTouchUpInside];
    [messagebutton setBackgroundColor:[UIColor whiteColor]];
    [messagebutton setTitle:@"消息" forState:UIControlStateNormal];
    [messagebutton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    messagebutton.titleLabel.font= [UIFont systemFontOfSize:10.0];
    //    改变字体位置 上左下右
    [messagebutton setTitleEdgeInsets:UIEdgeInsetsMake(0, 9, 0, 0)];
    //    //    改变图片位置
    [messagebutton setImageEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 45)];
    messagebutton.layer.cornerRadius = 8;
    messagebutton.layer.masksToBounds = YES;
    
    [_imageview addSubview: messagebutton];
    [messagebutton release];
    
    //    找朋友🔘
    
    UIButton * friendsbutton = [[UIButton alloc] initWithFrame:CGRectMake(170, 90, 60, 20)];
    [friendsbutton setImage:[UIImage imageNamed:@"friends.png"] forState:UIControlStateNormal];
    [friendsbutton setBackgroundColor:[UIColor whiteColor]];
    [friendsbutton setTitle:@"找朋友" forState:UIControlStateNormal];
    [friendsbutton addTarget:self action:@selector(friendsAction:) forControlEvents:UIControlEventTouchUpInside];
    [friendsbutton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    friendsbutton.titleLabel.font= [UIFont systemFontOfSize:10.0];
    //    改变字体位置 上左下右
    [friendsbutton setTitleEdgeInsets:UIEdgeInsetsMake(0, 9, 0, 0)];
    //    //    改变图片位置
    [friendsbutton setImageEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 45)];
    friendsbutton.layer.cornerRadius = 8;
    friendsbutton.layer.masksToBounds = YES;
    
    [_imageview addSubview: friendsbutton];
    [friendsbutton release];
    
    
    
    //    遮挡条
    _closeview = [[UIView alloc] initWithFrame:CGRectMake(0, 190, 320, 50)];
    [_closeview setBackgroundColor:[UIColor whiteColor]];
    _imageview.userInteractionEnabled = YES;
    [_closeview setUserInteractionEnabled:YES];
    [_imageview addSubview:_closeview];
    [_closeview release];
    
    
    UIButton * kmbutton = [[UIButton alloc] initWithFrame:CGRectMake(10, 5, 70, 40)];
    [kmbutton setBackgroundImage:[UIImage imageNamed:@"kmbutton.png"] forState:UIControlStateNormal];
    [kmbutton addTarget:self action:@selector(kmbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    NSString *tripsStr = [NSString stringWithFormat:@"%@旅程",[_dataDic objectForKey:@"trips"]];
    [kmbutton setTitle:tripsStr forState:UIControlStateNormal];
    [_closeview addSubview:kmbutton];
    [kmbutton release];
    
    UIButton * buildbutton = [[UIButton alloc] initWithFrame:CGRectMake(130, 5, 60, 40)];
    [buildbutton setBackgroundImage:[UIImage imageNamed:@"userinfo_mileages.png"] forState:UIControlStateNormal];
    [buildbutton addTarget:self action:@selector(morebuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    NSString *mileage = [NSString stringWithFormat:@"%@",[_dataDic objectForKey:@"mileage"]];
    [buildbutton setTitle:mileage forState:UIControlStateNormal];
    [buildbutton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [_closeview addSubview:buildbutton];
    [buildbutton release];
    
    UIButton * morebutton = [[UIButton alloc] initWithFrame:CGRectMake(220, 5, 80, 40)];
    //    [morebutton setBackgroundImage:[UIImage imageNamed:@"passport_placeholder"] forState:UIControlStateNormal];
    [morebutton addTarget:self action:@selector(morebuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_closeview addSubview:morebutton];
    [morebutton release];
    
    UIImageView * image1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [image1 setImage:[UIImage imageNamed:@"passport_placeholder"]];
    [morebutton addSubview:image1];
    [image1 release];
    
    
    UIImageView * image2 = [[UIImageView alloc] initWithFrame:CGRectMake(40, 0, 40, 40)];
    [image2 setImage:[UIImage imageNamed:@"passport_placeholder"]];
    [morebutton addSubview:image2];
    [image2 release];
    
    [self gesture];
    
    

}
-(void)gesture
{
    
    //        拖拽手势
//    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pangesture:)];
//    [_clearview addGestureRecognizer:pan];
//    [pan release];
    
    UIPanGestureRecognizer * pan1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pangesture:)];
    [_closeview addGestureRecognizer:pan1];
    [pan1 release];
    
}

////拖拽手势的响应事件
-(void)pangesture:(UIPanGestureRecognizer*)gesture

{
    CGPoint point = [gesture translationInView:_clearview];
    //hiddenView向下
    if (point.y>0&&_showInfoView.frame.origin.y>=0&&_hiddenview.frame.origin.y<195) {
        [_hiddenview setFrame:CGRectMake(_hiddenview.frame.origin.x, _hiddenview.frame.origin.y+point.y, _hiddenview.frame.size.width, _hiddenview.frame.size.height)];
    }
    //hiddenview向上走
    if (point.y<0&&_hiddenview.frame.origin.y>0) {
        [_hiddenview setFrame:CGRectMake(_hiddenview.frame.origin.x, _hiddenview.frame.origin.y+point.y, _hiddenview.frame.size.width, _hiddenview.frame.size.height)];
    }
    //showView向上跑
    if (point.y<0&&_hiddenview.frame.origin.y <=0) {
        
    
        if (_showInfoView.frame.origin.y  <= -(SHOWVIEWHEIGHT-70)/2) {
            [UIView animateWithDuration:0.4 animations:^{
                [_showInfoView setFrame:CGRectMake(0, 70-SHOWVIEWHEIGHT, 320, SHOWVIEWHEIGHT)];
            } completion:nil];
        }else{
            [_showInfoView setFrame:CGRectMake(_showInfoView.frame.origin.x, _showInfoView.frame.origin.y+point.y, _showInfoView.frame.size.width, _showInfoView.frame.size.height)];
            
            if (_clearview.frame.size.height<self.view.frame.size.height) {
                [_clearview setFrame:CGRectMake(0, _clearview.frame.origin.y+point.y, 320, _clearview.frame.size.height-point.y)];
            }
            else{
                [_clearview setFrame:CGRectZero];
                
            }
            
        }
        
        
        
    }
    //    //showView消失后，向下拖拽，显示showView
    if (point.y>0&&_showInfoView.frame.origin.y<0) {

        
        
        if (_showInfoView.frame.origin.y>=-(SHOWVIEWHEIGHT-70)/2) {
            [UIView animateWithDuration:0.4 animations:^{
                
                [_showInfoView setFrame:CGRectMake(0, 0, 320, SHOWVIEWHEIGHT)];
                
            } completion:nil];
        }else {
            [_showInfoView setFrame:CGRectMake(_showInfoView.frame.origin.x, _showInfoView.frame.origin.y+point.y, _showInfoView.frame.size.width, _showInfoView.frame.size.height)];
        }
        
        
    }
    
   
    
    
    NSLog(@"%f    隐藏的  orign.y",  point.y);
    //    每次拖拽前还原
    [gesture setTranslation:CGPointMake(0, 0) inView:_clearview];
    
}
//导航栏左边点击事件 分享
-(void)leftbtAction:(id)sender
{
    NSLog(@"导航栏左点击");
    
    _aimageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [_aimageview setImage:[UIImage imageNamed:@"explore_hottrip_info_bg@2x.png"]];
    _aimageview.userInteractionEnabled = YES;
    [self.view addSubview:_aimageview];
    [_aimageview release];
    
    _bimageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [_bimageview setImage:[UIImage imageNamed:@"explore_hottrip_info_bg@2x.png"]];
    _bimageview.userInteractionEnabled = YES;
    [self.navigationController.navigationBar addSubview:_bimageview];
    [_bimageview release];
    
    _whiteview = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 250, 170)];
    [_whiteview setBackgroundColor:[UIColor whiteColor]];
    _aimageview.userInteractionEnabled = YES;
    [_aimageview addSubview:_whiteview];
    [_whiteview release];
    
    UIButton * sharebuild = [[UIButton alloc ] initWithFrame:CGRectMake(10, 15, 230, 45)];
    [sharebuild setTitle:@"分享旅行成就" forState:UIControlStateNormal];
    [sharebuild addTarget:self action:@selector(sharebuildAction:) forControlEvents:UIControlEventTouchUpInside];
    sharebuild.layer.borderWidth = 0.3;
    [sharebuild setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_whiteview addSubview:sharebuild];
    [sharebuild release];
    
    UIButton * sharemap = [[UIButton alloc ] initWithFrame:CGRectMake(10, 62, 230, 45)];
    [sharemap setTitle:@"分享旅行地图" forState:UIControlStateNormal];
    [sharemap addTarget:self action:@selector(sharemapAction:) forControlEvents:UIControlEventTouchUpInside];
    sharemap.layer.borderWidth = 0.3;
    [sharemap setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_whiteview addSubview:sharemap];
    [sharemap release];
    
    UIButton * cancel = [[UIButton alloc ] initWithFrame:CGRectMake(10, 110, 230, 45)];
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    cancel.layer.borderWidth = 0.3;
    [cancel setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_whiteview addSubview:cancel];
    [cancel release];
    
    
    
}

-(void)rightbtAction:(id)sender
{
    SetupViewController * set = [[SetupViewController alloc] init];
    [self.navigationController pushViewController:set animated:YES];
    [set release];
    
    
    
}
-(void)sharebuildAction:(id)sender
{
    NSString *str = [NSString stringWithFormat:@"这是我在@土豆旅行 获得的旅行成就，快来我的个人主页看看吧：http://breadtrip.com/u/%@",[_dataDic objectForKey:@"id"]];
    NSLog(@"str=====%@",str);
    
    NSLog(@"分享成就点击事件");
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK"  ofType:@"jpg"];
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:str
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
-(void)sharemapAction:(id)sender
{
    
    NSLog(@"分享旅行地图点击事件");

}
-(void)cancelAction:(id)sender{
    NSLog(@"取消");
    [_whiteview removeFromSuperview];
    [_aimageview removeFromSuperview];
    [_bimageview removeFromSuperview];
}


-(void)userimageAction:(id)sender
{
    NSLog(@"用户头像点击事件");
    
}
-(void)friendsAction:(id)sender
{
    
    NSLog(@"找朋友点击事件");
    
}
-(void)messageAction:(id)sender
{
    NSLog(@"消息点击事件");
    AllmessageViewController * allmessage = [[AllmessageViewController alloc] init];
    [self presentViewController:allmessage animated:NO completion:Nil];
    [allmessage release];
}
-(void)morebuttonAction:(id)sender
{
    
     NSLog(@"旅程成就点击事件");
    AchievementViewController * achievment = [[AchievementViewController alloc] init];
    [self presentViewController:achievment animated:NO completion:Nil];
    [achievment release];
}
-(void)kmbuttonAction:(id)sender
{
    
    NSLog(@"旅程数点击事件");
    
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

#pragma mark -
#pragma mark AFNetWorking
- (void)connection{
    //    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"0",@"start",@"20",@"count",@"true",@"is_ipad", nil];
    [AsyConnecModel asyncGetWithUrl:AF_Mine strparmaters:nil finishBlock:^(id response){
        if ([response isKindOfClass:[NSDictionary class]]) {
            [_dataDic addEntriesFromDictionary:response];
//            NSLog(@"response=======%@",response);
//            NSLog(@"_dataDic ======%@",_dataDic);
//            [_bigArr addObjectsFromArray:[_dataDic objectForKey:@"trips"]];
            //                        NSLog(@"_bigArr =======%@",_bigArr);
            //            NSLog(@"count=====%d",_firstbigArr.count);
            [self allInit];
            [self mbProgressHUD];

        }
        if ([response isKindOfClass:[NSArray class]]) {
            [_dataArr addObjectsFromArray:response];
            NSLog(@"_dataArr======%@",_dataArr);
            [_bigArr addObjectsFromArray:_dataArr];
            //            NSLog(@"_bigArr =====%@",_bigArr);
        }
    }];
}
#pragma mark -
#pragma Map
//显示地图
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear: animated];
//    self.mapView=[[MAMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 568-49)];
//    self.mapView.delegate = self;
//    self.mapView.showsUserLocation = YES;    //YES 为打开定位，NO为关闭定位
//    self.mapView.desiredAccuracy = kCLLocationAccuracyBest;
//    self.mapView.distanceFilter = 1.0;
//    [self modeAction];
//    
//    //    [self.mapView setCenterCoordinate:_checkinLocation.coordinate animated:YES];
//    [self.view addSubview:self.mapView];
//}

- (void)modeAction {
    [self.mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES]; //设置 为地图跟着位置移动
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
