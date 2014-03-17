//
//  FootWriteViewController.m
//  Foot
//
//  Created by _ MarS. on 14-3-10.
//  Copyright (c) 2014年 王柏慧. All rights reserved.
//

#import "FootWriteViewController.h"

@interface FootWriteViewController ()

@end

@implementation FootWriteViewController
-(void)dealloc{
    
    [_nss release];
    [_formatter release];
    
   
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
//    self.navigationItem.title = @"足迹编辑";
    UILabel *travelEditingOnLable = [[UILabel alloc]initWithFrame:CGRectMake(150, 10, 100, 30)];
    travelEditingOnLable.text = @"足迹编辑";
    travelEditingOnLable.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = travelEditingOnLable;
    [travelEditingOnLable release];

    
    //完成
    UIButton * reButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [reButton setBackgroundImage:[UIImage imageNamed:@"navbar_ok@2x"] forState:UIControlStateNormal];
    [reButton addTarget:self action:@selector(rightButtonItemAction:) forControlEvents:UIControlEventTouchUpInside];
    reButton.adjustsImageWhenDisabled = YES;
    UIBarButtonItem * rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:reButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    [reButton release];
    
    //所上传的图片
    UIButton * imageButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 10, 100, 100)];
    [imageButton setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:imageButton];
    [imageButton release];
    
    //给上传图片加描述
    UITextField * descripField = [[UITextField alloc] initWithFrame:CGRectMake(115, 10, 310 - 120, 85)];
    [descripField setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:descripField];
    [descripField release];
    //上传时间显示条
    _dateUpButton = [[UIButton alloc] initWithFrame:CGRectMake(115, 95, 310 - 120, 15)];
    [_dateUpButton setBackgroundColor:[UIColor lightGrayColor]];
    [_dateUpButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

    [_dateUpButton setTitle:@"2014-03-05  09:20" forState:UIControlStateNormal];
    _dateUpButton.adjustsImageWhenDisabled = YES;
    [_dateUpButton addTarget:self action:@selector(dateUpButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_dateUpButton];
    [_dateUpButton release];
    //下方黑线
    UIImageView * lineDownImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 14, 310 - 120, 2)];
    [lineDownImage setImage:[UIImage imageNamed:@"trip_map_separator~ipad"]];
    [_dateUpButton addSubview:lineDownImage];
    [lineDownImage release];
    
    
    //四个格的背景图
    UIImageView * bigImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 120, 290, 80)];
    [bigImage setImage:[UIImage imageNamed:@"poi_select_bg@2x"]];
    bigImage.userInteractionEnabled = YES;
    [self.view addSubview:bigImage];
    [bigImage release];
    //景点按钮
    UIButton * placeButton = [[UIButton alloc] initWithFrame:CGRectMake(-5, 5, 80, 80)];
    [placeButton setImage:[UIImage imageNamed:@"poi_attraction_btn@2x"] forState:UIControlStateNormal];
    [placeButton addTarget:self action:@selector(placeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bigImage addSubview:placeButton];
    [placeButton release];
    //住宿按钮
    UIButton * hotelButton = [[UIButton alloc] initWithFrame:CGRectMake(70, 5, 80, 80)];
    [hotelButton setBackgroundImage:[UIImage imageNamed:@"poi_hotel_btn@2x"] forState:UIControlStateNormal];
    [hotelButton addTarget: self action:@selector(hotelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bigImage addSubview:hotelButton];
    [hotelButton release];
    //餐饮按钮
    UIButton * restaurantButton = [[UIButton alloc] initWithFrame:CGRectMake(140, 5, 80, 80)];
    [restaurantButton setImage:[UIImage imageNamed:@"poi_restaurant_btn@2x"] forState:UIControlStateNormal];
    [restaurantButton addTarget:self action:@selector(restaurantButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bigImage addSubview:restaurantButton];
    [restaurantButton release];
    //购物按钮
    UIButton * shoppingButton = [[UIButton alloc] initWithFrame:CGRectMake(210, 5, 80, 80)];
    [shoppingButton setImage:[UIImage imageNamed:@"poi_shopping_btn@2x"] forState:UIControlStateNormal];
    [shoppingButton addTarget:self action:@selector(shoppingButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bigImage addSubview:shoppingButton];
    [shoppingButton release];
    
    //地图
    UIImageView * mapImage = [[UIImageView alloc] initWithFrame:CGRectMake(15,210, 290, 100)];
    [mapImage setBackgroundColor:[UIColor purpleColor]];
    mapImage.layer.masksToBounds = YES;
    mapImage.layer.cornerRadius = 5;
    [self.view addSubview:mapImage];
    [mapImage release];
    
    //所有人可见字加图
    _lockButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 320, 25, 25)];
    [_lockButton setBackgroundImage:[UIImage imageNamed:@"lock_round_blank@2x"] forState:UIControlStateNormal];
    _lockButton.selected = NO;
    [_lockButton addTarget:self action:@selector(lockButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_lockButton];
    [_lockButton release];
    
    UILabel * lockLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 320, 60, 20)];
    [lockLabel setText:@"所有人可见"];
    [lockLabel setTextColor:[UIColor lightGrayColor]];
    lockLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:lockLabel];
    [lockLabel release];
    
    //新浪微博
    _newButton = [[UIButton alloc] initWithFrame:CGRectMake(248, 320, 25, 25)];
    [_newButton setBackgroundImage:[UIImage imageNamed:@"sina_round_blank@2x"] forState:UIControlStateNormal];
    [_newButton addTarget:self action:@selector(newButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _newButton.selected = NO;
    [self.view addSubview:_newButton];
    [_newButton release];
    //腾讯微博
    _qqButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 320, 25, 25)];
    [_qqButton setBackgroundImage:[UIImage imageNamed:@"tencent_round_blank@2x"] forState:UIControlStateNormal];
    [_qqButton addTarget:self action:@selector(qqButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _qqButton.selected = NO;
    [self.view addSubview:_qqButton];
    [_qqButton release];
    
    //删除足迹图片
    UIButton * deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 400, 120, 40)];
    [deleteButton setBackgroundImage:[UIImage imageNamed:@"remove_button@2x"] forState:UIControlStateNormal];
    [deleteButton setTitle:@"       删除足迹" forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(deleteButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteButton];
    [deleteButton release];

}

-(void)rightButtonItemAction:(id)sender{
    
    NSLog(@"GOGOGOGOGOGO");
}

-(void)dateUpButtonAction:(id)sender{
    if (_apperPick==YES) {
        
        UIView *aView = [self.view viewWithTag:101];
        [aView removeFromSuperview];
        _apperPick = NO;
        
        
    }else{
        UIView *planeView=[[UIView alloc] initWithFrame:CGRectMake(0, 568, 320, 568)];
        planeView.tag = 101;
        [planeView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:planeView];
        
        _datePicker=[[UIDatePicker alloc] initWithFrame:CGRectMake(5, 30, 320, 250)];
        _datePicker.date=[NSDate date];
        _datePicker.tag=100;
        _datePicker.datePickerMode= UIDatePickerModeDateAndTime;
        
        [planeView addSubview:_datePicker];
        [UIImageView animateWithDuration:0.5 animations:^{
            planeView.frame=CGRectMake(0, 268, 320,300);
        } completion:^(BOOL finished) {
            
        }];
        UIButton *pButton=[[UIButton alloc] initWithFrame:CGRectMake(5, 10, 50,25)];
        [pButton setTitle:@"完成" forState:UIControlStateNormal];
        [pButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [pButton addTarget:self action:@selector(huodePButton) forControlEvents:UIControlEventTouchUpInside];
        [planeView addSubview:pButton];
        [planeView release];
        [_datePicker release];
        [pButton release];
        _apperPick=YES;
    }
    

    NSLog(@"date date date");
}
-(void)huodePButton{
    _formatter=[[NSDateFormatter alloc] init];
    _formatter.dateFormat=@"YY-MM-DD hh:mm-aa";
    
    _nss=[_formatter stringFromDate:_datePicker.date];
    [_dateUpButton setTitle:_nss forState:UIControlStateNormal];
    if (_apperPick==YES) {
        
        UIView *aView = [self.view viewWithTag:101];
        [aView removeFromSuperview];
        _apperPick = NO;
        
        
    }
   

}
-(void)placeButtonAction:(id)sender{
    NSLog(@"place place place");
}

-(void)hotelButtonAction:(id)sender{
    NSLog(@"hotel hotel hotel");
}

-(void)restaurantButtonAction:(id)sender{
    NSLog(@"eat eat eat");
}

-(void)shoppingButtonAction:(id)sender{
    NSLog(@"shopping shopping shopping");
}

//所有人可见点击变色  点击事件
-(void)lockButtonAction:(id)sender{
    
    UIButton * lock = (UIButton *)sender;
    if ([lock isSelected]) {
        [lock setBackgroundImage:[UIImage imageNamed:@"lock_round_blank.png"] forState:UIControlStateNormal];
        [lock setSelected:NO];
    }
    else
    {
        [lock setBackgroundImage:[UIImage imageNamed:@"lock_round.png"] forState:UIControlStateNormal];
        lock.selected = YES;
        
    }

}

//新浪微博点击换色  点击事件
-(void)newButtonAction:(id)sender{
    
    UIButton * new = (UIButton *)sender;
    if ([new isSelected]) {
        [new setBackgroundImage:[UIImage imageNamed:@"sina_round_blank@2x"] forState:UIControlStateNormal];
        [new setSelected:NO];
    }
    else{
        [new setBackgroundImage:[UIImage imageNamed:@"sina_round@2x"] forState:UIControlStateNormal];
        new.selected = YES;
    }
}

//腾讯qq点击换色  点击事件
-(void)qqButtonAction:(id)sender{
    
    UIButton * qq = (UIButton *)sender;
    if ([qq isSelected]) {
        [qq setBackgroundImage:[UIImage imageNamed:@"tencent_round_blank@2x"] forState:UIControlStateNormal];
        [qq setSelected:NO];
    }
    else{
        [qq setBackgroundImage:[UIImage imageNamed:@"tencent_round@2x"] forState:UIControlStateNormal];
        [qq setSelected:YES];
    }
}

//提示框
-(void)deleteButtonAction:(id)sender{
    UIAlertView *strataler = [[UIAlertView alloc]initWithTitle:@"提示" message:@"确定要删除足迹?" delegate:NULL cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    strataler.delegate = self;
    [strataler show];
    [strataler release];

}
//提示框代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        
        NSLog(@"删除数据");
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
