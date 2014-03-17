//
//  AllmessageViewController.m
//  PotatoTravel
//
//  Created by 可乐 on 14-3-14.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import "AllmessageViewController.h"
#import "AllmessageCell.h"

@interface AllmessageViewController ()

@end

@implementation AllmessageViewController

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
    UIImageView * topimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    topimage.userInteractionEnabled = YES;
    [topimage setImage:[UIImage imageNamed:@"account_uploadavatar_btn@2x.png"]];
    [self.view addSubview:topimage];
    [topimage release];
    
    UIButton * backbutton = [[UIButton alloc] initWithFrame:CGRectMake(10, 22, 80,30)];
    [backbutton setTitleEdgeInsets:UIEdgeInsetsMake(0, 9, 0, 0)];
    //    //    改变图片位置
    [backbutton setImageEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 45)];
    [backbutton addTarget:self action:@selector(backbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [backbutton setImage:[UIImage imageNamed:@"back@2x.png"] forState:UIControlStateNormal];
    [topimage addSubview:backbutton];
    [backbutton release];
    
    UILabel *mineOnLable = [[UILabel alloc]initWithFrame:CGRectMake(125, 18, 100, 30)];
    mineOnLable.text =@"全部消息";
    
    mineOnLable.textColor = [UIColor whiteColor];
    [topimage addSubview:mineOnLable];
    [mineOnLable release];
    
    
    
    
    
    UITableView * tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height)];
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    [tableview release];
    
    
   
    
}

//返回按钮点击事件
-(void)backbuttonAction:(id)sender
{

    [self dismissViewControllerAnimated:YES completion:Nil];


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

static NSString * cellIdentfy = @"chi1";
    AllmessageCell * mycell = [tableView dequeueReusableCellWithIdentifier:cellIdentfy];
    if (!mycell) {
        mycell = [[AllmessageCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentfy];
    }
    [mycell.iamgebutton setBackgroundImage:[UIImage imageNamed:@"tudou.png"] forState:UIControlStateNormal];
    [mycell.usernamelable setText:@"土豆旅行"];
    [mycell.messagelable setText:@"精品内容推荐"];
    [mycell.timelable setText:@"03-14-20:01"];
    return mycell;




}
@end
