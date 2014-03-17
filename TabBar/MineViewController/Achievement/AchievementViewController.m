//
//  AchievementViewController.m
//  PotatoTravel
//
//  Created by 可乐 on 14-3-15.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import "AchievementViewController.h"

@interface AchievementViewController ()

@end

@implementation AchievementViewController

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
//假navigation图片
    UIImageView * topimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    [topimage setImage:[UIImage imageNamed:@"account_uploadavatar_btn@2x.png"]];
    topimage .userInteractionEnabled = YES;
    [self.view addSubview:topimage];
    [topimage release];
    
//    返回按钮
    UIButton * backbutton = [[UIButton alloc] initWithFrame:CGRectMake(10, 22, 80,30)];
    [backbutton setTitleEdgeInsets:UIEdgeInsetsMake(0, 9, 0, 0)];
    //    //    改变图片位置
    [backbutton setImageEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 45)];
    [backbutton setImage:[UIImage imageNamed:@"back@2x.png"] forState:UIControlStateNormal];
    [backbutton addTarget:self action:@selector(backbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [topimage addSubview:backbutton];
    [backbutton release];
    
    
//     返回首页按钮
    UIButton * homebutton = [[UIButton alloc] initWithFrame:CGRectMake(270, 22, 80,30)];
    [homebutton setTitleEdgeInsets:UIEdgeInsetsMake(0, 9, 0, 0)];
    //    //    改变图片位置
    [homebutton setImageEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 45)];
    [homebutton setImage:[UIImage imageNamed:@"navbar_home_atarasii@2x.png"] forState:UIControlStateNormal];
    [homebutton addTarget:self action:@selector(homebuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [topimage addSubview:homebutton];
    [homebutton release];
    
    
//    假navgation标题
    UILabel *mineOnLable = [[UILabel alloc]initWithFrame:CGRectMake(125, 18, 100, 30)];
    mineOnLable.text =@"旅行成就";
    
    mineOnLable.textColor = [UIColor whiteColor];
    [topimage addSubview:mineOnLable];
    [mineOnLable release];

//    固定背景图
    UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake(15, 70, 290, 300)];
    [imageview setImage:[UIImage imageNamed:@"achievements@2x.png"]];
    [self.view addSubview:imageview];
    [imageview release];
    
//  带解析被喜欢次数
    UILabel * likelable = [[UILabel alloc] initWithFrame:CGRectMake(65, 82, 30, 30)];
    [likelable setText:@"2"];
    [likelable setFont: [UIFont systemFontOfSize:24.0]];
    [likelable setTextColor:[UIColor greenColor]];
    [self.view addSubview:likelable];
    [likelable release];
    
//带解析下载次数
    UILabel * loaddownlable = [[UILabel alloc] initWithFrame:CGRectMake(65, 142, 30, 30)];
    [loaddownlable setText:@"0"];
    [loaddownlable setFont: [UIFont systemFontOfSize:24.0]];
    [loaddownlable setTextColor:[UIColor greenColor]];
    [self.view addSubview:loaddownlable];
    [loaddownlable release];
    
// 带解析收藏次数
    UILabel * coverlable = [[UILabel alloc] initWithFrame:CGRectMake(198, 82, 30, 30)];
    [coverlable setText:@"2"];
    [coverlable setFont: [UIFont systemFontOfSize:24.0]];
    [coverlable setTextColor:[UIColor greenColor]];
    [self.view addSubview:coverlable];
    [coverlable release];
    
// 带解析分享次数
    UILabel * sharelable = [[UILabel alloc] initWithFrame:CGRectMake(198, 142, 30, 30)];
    [sharelable setText:@"0"];
    [sharelable setFont: [UIFont systemFontOfSize:24.0]];
    [sharelable setTextColor:[UIColor greenColor]];
    [self.view addSubview:sharelable];
    [sharelable release];
    
//  固定的图片
    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(65, 216, 20, 20)];
    [image setImage:[UIImage imageNamed:@"mileage_cup_blue@2x.png"]];
    [self.view addSubview:image];
    [image release];
//     固定的文字
    UILabel * namel = [[UILabel alloc] initWithFrame:CGRectMake(90, 216, 80, 30)];
    [namel setTextColor:[UIColor greenColor]];
    [namel setFont:[UIFont systemFontOfSize:14.0]];
    [namel setText:@"旅行总旅程"];
    [self.view addSubview: namel];
    [namel release];
    
//  带解析旅程公里数
    UILabel * countl = [[UILabel alloc] initWithFrame:CGRectMake(170, 216, 40, 30)];
    [countl setTextColor:[UIColor greenColor]];
    [countl setFont:[UIFont systemFontOfSize:18.0]];
    [countl setText:@"0"];
    [self.view addSubview: countl];
    [countl release];
// 固定的文字
    UILabel * kml = [[UILabel alloc] initWithFrame:CGRectMake(210, 216, 30, 30)];
    [kml setTextColor:[UIColor greenColor]];
    [kml setFont:[UIFont systemFontOfSize:14.0]];
    [kml setText:@"km"];
    [self.view addSubview: kml];
    [kml release];
    
//    国家数
    UILabel* countryl = [[UILabel alloc] initWithFrame:CGRectMake(60, 276, 30, 30)];
    [countryl setTextColor:[UIColor greenColor]];
    [countryl setFont:[UIFont systemFontOfSize:24.0]];
    [countryl setText:@"2"];
    [self.view addSubview:countryl];
    [countryl release];
    
//    城市数
    UILabel* cityl = [[UILabel alloc] initWithFrame:CGRectMake(202, 276, 30, 30)];
    [cityl setTextColor:[UIColor greenColor]];
    [cityl setFont:[UIFont systemFontOfSize:24.0]];
    [cityl setText:@"2"];
    [self.view addSubview:cityl];
    [cityl release];
    
}
-(void)backbuttonAction:(id)sender
{

    [self dismissViewControllerAnimated:YES completion:Nil];


}
-(void)homebuttonAction:(id)sender
{
    Tab_Single * single = [Tab_Single shareInterface];
    [single.tabbarcontroller setSelectedIndex:0];
    [self dismissViewControllerAnimated:YES completion:Nil];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
