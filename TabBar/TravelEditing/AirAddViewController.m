//
//  AirAddViewController.m
//  Air
//
//  Created by _ MarS. on 14-3-10.
//  Copyright (c) 2014年 王柏慧. All rights reserved.
//

#import "AirAddViewController.h"

@interface AirAddViewController ()

@end

@implementation AirAddViewController

- (void)dealloc
{
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
//    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UILabel *travelEditingOnLable = [[UILabel alloc]initWithFrame:CGRectMake(125, 10, 100, 30)];
    travelEditingOnLable.text = @"potato trip^";
    travelEditingOnLable.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = travelEditingOnLable;
    [travelEditingOnLable release];
    
    UIButton *resignButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    [resignButton addTarget:self action:@selector(resignButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resignButton];
    [resignButton release];
    //完成
    UIButton * reButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [reButton setBackgroundImage:[UIImage imageNamed:@"navbar_ok@2x"] forState:UIControlStateNormal];
    [reButton addTarget:self action:@selector(rightButtonItemAction:) forControlEvents:UIControlEventTouchUpInside];
    reButton.adjustsImageWhenDisabled = YES;
    UIBarButtonItem * rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:reButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    [reButton release];
    
    //提示文字（航班号）
    UILabel * airNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 290, 20)];
    [airNumberLabel setText:@"本次出发航班号"];
    [airNumberLabel setTextColor:[UIColor grayColor]];
    airNumberLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:airNumberLabel];
    [airNumberLabel release];
    //飞机图标
    UIImageView * airImage = [[UIImageView alloc] initWithFrame:CGRectMake(15,40, 25, 25)];
    [airImage setImage:[UIImage imageNamed:@"flight_icon@2x"]];
    [self.view addSubview:airImage];
    [airImage release];
    //航班号输入
    _airTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 35, 260, 40)];
    _airTextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:_airTextField];
    [_airTextField release];
    //下方线图标
    UIImageView * airLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 72, 290, 5)];
    [airLineImage setImage:[UIImage imageNamed:@"trip_map_separator@2x~ipad"]];
    [self.view addSubview:airLineImage];
    [airLineImage release];
    
    
    //航班日期提示（文字）
    UILabel * airNumberDate = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 60, 20)];
    [airNumberDate setText:@"航班日期"];
    [airNumberDate setTextColor:[UIColor grayColor]];
    airNumberDate.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:airNumberDate];
    [airNumberDate release];
    //日期图标
    UIImageView * dateImage = [[UIImageView alloc] initWithFrame:CGRectMake(15,117, 25, 25)];
    [dateImage setImage:[UIImage imageNamed:@"date_icon@2x"]];
    [self.view addSubview:dateImage];
    [dateImage release];
    //日期输入
    _airDateButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 110, 260, 40)];
    [_airDateButton addTarget:self action:@selector(planeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_airDateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_airDateButton setTitle:@"添加日期" forState:UIControlStateNormal];
    [self.view addSubview:_airDateButton];
    [_airDateButton release];
    //下方线图标
    UIImageView * dateLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 145, 290, 5)];
    [dateLineImage setImage:[UIImage imageNamed:@"trip_map_separator@2x~ipad"]];
    [self.view addSubview:dateLineImage];
    [dateLineImage release];
    }


-(void)planeButtonAction{
    
    //失去第一响应者
    [_airTextField resignFirstResponder];
    
    if (_apperPick==YES) {
        UIView *aView = [self.view viewWithTag:101];
        [aView removeFromSuperview];
        _apperPick = NO;
        
    }else{
        UIView *planeView=[[UIView alloc] initWithFrame:CGRectMake(0, 480, 320, 480)];
        planeView.tag = 101;
        [self.view addSubview:planeView];
        
        _datePicker=[[UIDatePicker alloc] initWithFrame:CGRectMake(5, 30, 320, 400)];
        _datePicker.date=[NSDate date];
        _datePicker.tag=100;
        _datePicker.datePickerMode= UIDatePickerModeDateAndTime;
        
        [planeView addSubview:_datePicker];
        [UIImageView animateWithDuration:0.5 animations:^{
            planeView.frame=CGRectMake(0, 180, 320,400);
        } completion:^(BOOL finished) {
            
        }];
        UIButton *pButton=[[UIButton alloc] initWithFrame:CGRectMake(10, 20, 50,25)];
        [pButton setTitle:@"完成" forState:UIControlStateNormal];
        [pButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [pButton addTarget:self action:@selector(huodePButton) forControlEvents:UIControlEventTouchUpInside];
        [planeView addSubview:pButton];
        [planeView release];
        [_datePicker release];
        _apperPick=YES;
    }
    
}
-(void)huodePButton{
    _formatter=[[NSDateFormatter alloc] init];
    _formatter.dateFormat=@"YY-MM-DD hh:mm-aa";
    _nssl=[_formatter stringFromDate:_datePicker.date];
    if (_apperPick==YES) {
        UIView *aView = [self.view viewWithTag:101];
        [aView removeFromSuperview];
        _apperPick = NO;
    }
    [_airDateButton setTitle:_nssl forState:UIControlStateNormal];
}


-(void)rightButtonItemAction:(id)sender{

    NSLog(@"完成  完成");
}
-(void)resignButtonAction:(id)sender{
    [_airTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
