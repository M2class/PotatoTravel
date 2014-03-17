//
//  RegisterViewController.m
//  我的分界面
//
//  Created by 可乐 on 14-3-11.
//  Copyright (c) 2014年 可乐. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _dic = [[NSMutableDictionary alloc]init];
        _arr = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    UIScrollView * scrol = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,320, self.view.frame.size.height)];
    [scrol setContentSize:CGSizeMake(0, 600)];
    [self.view addSubview:scrol];
    [scrol release];
   
    
//背景图
    UIImageView * iamge = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 600)];
    [iamge setImage:[UIImage imageNamed:@"account_login_prompt_ok.png"]];
    iamge.userInteractionEnabled = YES;
    [scrol addSubview:iamge];
    [iamge release];
    
    
    //   返回按钮
        UIButton * backbutton = [[UIButton alloc] initWithFrame:CGRectMake(10, 22, 20, 20)];
    [backbutton addTarget:self action:@selector(backbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
        [backbutton setBackgroundImage:[UIImage imageNamed:@"gallery_back.png"] forState:UIControlStateNormal ];
//       [backbutton setBackgroundColor:[UIColor whiteColor]];
        [iamge addSubview: backbutton];
        [backbutton release];
    
    
//    logo图标
    UIImageView * logo = [[UIImageView alloc] initWithFrame:CGRectMake(30, 50, 50, 50)];
    [logo setImage:[UIImage imageNamed:@"tudou.png"]];
    [iamge addSubview:logo];
    [logo release];
    
    
//    土豆旅行字
    UILabel * tudoulb = [[UILabel alloc] initWithFrame:CGRectMake(85, 50, 50, 20)];
    [tudoulb setText:@"potato"];
    [tudoulb setTextColor:[UIColor whiteColor]];
    [iamge addSubview:tudoulb];
    [tudoulb release];
    //    土豆旅行字
    UILabel * tudoulb1 = [[UILabel alloc] initWithFrame:CGRectMake(85, 75, 50, 20)];
    [tudoulb1 setText:@"travel"];
    [tudoulb1 setTextColor:[UIColor whiteColor]];
    [iamge addSubview:tudoulb1];
    [tudoulb1 release];

//邮箱
    _emailtext = [[UITextField alloc] initWithFrame:CGRectMake(30, 115, 250, 38)];
    //    [emailtext setBorderStyle:UITextBorderStyleLine];
    _emailtext.placeholder = @"邮箱";
    [_emailtext setBackgroundColor:[UIColor whiteColor]];
    [iamge addSubview:_emailtext];
    [_emailtext release];
    
//用户名
    _nametext = [[UITextField alloc] initWithFrame:CGRectMake(30, 170, 250, 38)];
    _nametext.placeholder = @"用户名，可以为中文";
    [_nametext setBackgroundColor:[UIColor whiteColor]];
    [iamge addSubview:_nametext];
    [_nametext release];
    
//密码
    _passwdtext = [[UITextField alloc] initWithFrame:CGRectMake(30, 220, 250, 38)];
    _passwdtext.secureTextEntry = YES;
    _passwdtext.placeholder = @"登录密码，最短6位";
    [_passwdtext setBackgroundColor:[UIColor whiteColor]];
    [iamge addSubview:_passwdtext];
    [_passwdtext release];
    
// 注册按钮
    _myregister = [[UIButton alloc] initWithFrame:CGRectMake(30, 270, 250, 38)];
    [_myregister setTitle:@"注册" forState:UIControlStateNormal];
    [_myregister addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    [_myregister setBackgroundColor:[UIColor greenColor]];
    [iamge addSubview:_myregister];
    [_myregister release];
    
}
//注册
-(void)registerAction:(id)sender
{
        NSLog(@" 注册——————");
        NSString *str1 = _nametext.text;
        NSString *str2 = _passwdtext.text;
        NSString *str3 = _emailtext.text;
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:str3,@"email",str2,@"password",str1,@"username", nil];
        NSLog(@"++++++++%@",dic);
        [AsyConnecModel connectionWithUrl:HS_TripConnection parmaters:dic finishBlock:^(id response){
            
            if ([response isKindOfClass:[NSDictionary class]] ) {
                [_dic addEntriesFromDictionary:response];
                NSLog(@"*********%@***********",response);
            }
            if ([response isKindOfClass:[NSString class]]) {
                [_arr addObject:response];
                NSLog(@"----------%@",response);
            }
//            NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
//            if ([user objectForKey:@"username"]) {
            if ([response objectForKey:@"error_code"] ==nil) {
                
            
                _okalert = [[UIAlertView alloc] initWithTitle:@"成功" message:nil
                                                     delegate:self cancelButtonTitle:Nil otherButtonTitles:@"ok", nil];
                
                
                
                
                
                
            }
            else
            {
                
                //            错误信息
                NSString * myerror = [response objectForKey:@"prompt"];
                
                _alert = [[UIAlertView alloc] initWithTitle:myerror message:nil
                                                   delegate:self cancelButtonTitle:Nil otherButtonTitles:@"ok", nil];
                
                
                
            }
            
            [_alert show];
            [_okalert show];
            [_okalert release];
            [_alert release];
            
            
        }];
       
    //    [AsyconnectModel asyncPostWithParmaUrl:HS_TripConnection parmaters:dic finishBlock:^{
    //
    //    }];
    
    //    [AsyconnectModel connectionWithUrl:HS_TripConnection parmaters:dic finishBlock:^{
    //
    //    }];
    
    


}
-(void)backbuttonAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:Nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
