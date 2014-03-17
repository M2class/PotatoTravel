//
//  DestinationDetailsViewController.m
//  PotatoTravel
//
//  Created by riseikan on 14-3-12.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import "DestinationDetailsViewController.h"
#import "DestinationDetailsCell.h"
@interface DestinationDetailsViewController ()

@end

@implementation DestinationDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self destinationDetailsTableViewInit];
    [self LeftAndRightButtonAndTopImageInit];
}

#pragma mark -
#pragma mark navigationBarItem
- (void)LeftAndRightButtonAndTopImageInit{
    UIImageView *topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
    [topImageView setImage:[UIImage imageNamed:@"account_uploadavatar_btn.png"]];
    [self.view addSubview:topImageView];
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 70, 50)];
    [leftButton setImage:[UIImage imageNamed:@"gallery_back.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftButton];
    [leftButton release];
 
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(250, 20, 70, 50)];
    [rightButton setImage:[UIImage imageNamed:@"navbar_home.png"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightButton];
    [rightButton release];
}
- (void)leftButtonAction:(id)sender{
    NSLog(@"返回");
    [self dismissViewControllerAnimated:YES completion:Nil];
}
- (void)rightButtonAction:(id)sender{
    NSLog(@"主页");
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark -
#pragma mark destinationDetailsTableView
- (void)destinationDetailsTableViewInit{
    UITableView *aTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, 320, self.view.frame.size.height-70) style:UITableViewStylePlain];
    aTableView.separatorColor = [UIColor orangeColor];
    aTableView.delegate = self;
    aTableView.dataSource = self;
    aTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:aTableView];
    [aTableView release];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *name = @"firstRoot";
    DestinationDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:name];
    if (!cell) {
        cell = [[DestinationDetailsCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:name];
    }
    cell.showLable.text = @"未解析";
    cell.showImageView.backgroundColor = [UIColor orangeColor];
    cell.titleLeftLineImageView.image = [UIImage imageNamed:@"feed_nav_bottom_bar.png"];
    cell.titleRightLineImageView.image = [UIImage imageNamed:@"feed_nav_bottom_bar.png"];
    cell.titleLable.text = @"未解析";
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
