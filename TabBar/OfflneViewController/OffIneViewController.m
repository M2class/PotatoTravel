//
//  OffIneViewController.m
//  PotatoTravel
//
//  Created by riseikan on 14-3-4.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import "OffIneViewController.h"

@interface OffIneViewController ()

@end

@implementation OffIneViewController
- (void)dealloc
{
    [_progressTest release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self UIImageViewInit];
//        [self mbProgressHUD];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
#pragma mark - 
#pragma mark UIImageView
- (void)UIImageViewInit{
    
    UIImageView * offLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 140, 260, 180)];
    [offLineImage setImage:[UIImage imageNamed:@"12345.jpg"]];
    [self.view addSubview:offLineImage];
    [offLineImage release];
    UIImageView * offLineOnImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 320, 50)];
    [offLineOnImage setImage:[UIImage imageNamed:@"account_login_prompt_ok.png"]];
    [self.view addSubview:offLineOnImage];
    [offLineOnImage release];
    UILabel *offLineOnLable = [[UILabel alloc]initWithFrame:CGRectMake(125, 30, 100, 30)];
    offLineOnLable.text = @"离线内容";
    offLineOnLable.textColor = [UIColor whiteColor];
    [self.view addSubview:offLineOnLable];
    [offLineOnLable release];

}

#pragma mark -
#pragma mark donnotchange
-(NSUInteger)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskAllButUpsideDown;
    
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
