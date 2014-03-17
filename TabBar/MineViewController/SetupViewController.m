//
//  SetupViewController.m
//  MyPage
//
//  Created by 可乐 on 14-3-10.
//  Copyright (c) 2014年 可乐. All rights reserved.
//

#import "SetupViewController.h"
#import "MainInterfaceViewController.h"
@interface SetupViewController ()

@end

@implementation SetupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.view setBackgroundColor:[UIColor lightGrayColor]];
        
           }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    

    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"gallery_back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(abuttonAction:)];
    [self.navigationItem setLeftBarButtonItem:leftButton animated:YES];
    [leftButton release];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navbar_home.png"] style:UIBarButtonItemStylePlain target:self action:@selector(bbuttonAction:)];
    [self.navigationItem setRightBarButtonItem:rightButton animated:YES];
    
    
    UITableView * mytable = [[UITableView alloc] initWithFrame:CGRectMake(10, 20, 300, 400) style:UITableViewStylePlain];
    mytable.delegate = self;
    mytable.dataSource = self;
    [self.view addSubview:mytable];
    [mytable release];
    
    
    _arr = [[NSArray alloc] initWithObjects:@"推送通知设置",@"连接社交网络",@"清空缓存",@"精品应用工具",@"关于我们",@"检查更新",@"意见反馈",@"退出登录", nil];

}
-(void)abuttonAction:(id)sender
{
//    ＊——————————
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"username"]) {
//        如果退出登录不成功回到我的页面
        Tab_Single * single = [Tab_Single shareInterface];
        [single.tabbarcontroller setSelectedIndex:3];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else
    {
//    如果 退出 成功 进入主页
        Tab_Single * single = [Tab_Single shareInterface];
        [single.tabbarcontroller setSelectedIndex:0];
         [self.navigationController popToRootViewControllerAnimated:YES];
    
    }
//————————————＊＊＊
}

-(void)bbuttonAction:(id)sender
{

    NSLog(@"返回主菜单点击事件");
    [self.navigationController popToRootViewControllerAnimated:YES];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 4;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
return @"       ";

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return 3;
    }
    else if(section ==1)
    {
        return 1;
    
    }
    else if (section ==2)
    {
    return 3;

    }
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
static NSString * cellidenty = @"chi1";
    UITableViewCell * mycell = [tableView dequeueReusableCellWithIdentifier:cellidenty];
    if (!mycell) {
        mycell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellidenty];
    }
    if (indexPath.section ==0) {
        mycell.textLabel.text = [_arr objectAtIndex:indexPath.row];
    }
    else if (indexPath.section ==1)
    {
        mycell.textLabel.text = [_arr objectAtIndex:(indexPath.row+3)];
        
    
    }
    else if (indexPath.section == 2)
    {
        mycell.textLabel.text = [_arr objectAtIndex:(indexPath.row+4)];
    
    }
    else{
    mycell.textLabel.text = [_arr lastObject];
    }
   
    return mycell;


}
//*________
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


    if (indexPath.section ==3) {
        if (indexPath.row == 0) {
            NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
            if ([user objectForKey:@"username"]) {
                NSLog(@"已经退出登录了");
            [user removeObjectForKey:@"username"];
                [user removeObjectForKey:@"password"];
//
                Tab_Single * single = [Tab_Single shareInterface];
                [single.tabbarcontroller setSelectedIndex:0];
                [self.navigationController popToRootViewControllerAnimated:YES];

                
            }

            
        }
    }


}
//————————————＊＊＊
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
