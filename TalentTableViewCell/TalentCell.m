//
//  TalentCell.m
//  PotatoTravel
//
//  Created by 可乐 on 14-3-4.
//  Copyright (c) 2014年 可乐. All rights reserved.
//

#import "TalentCell.h"

@implementation TalentCell
- (void)dealloc
{
    [_userimageButton release];
    [_usernameButton release];
    [_atLable release];
    [_travernameButton release];
    [_backimageButton release];
    [_loveButton release];
    [_messageButton release];
    [_describeLable release];
    [_timeLable release];
    [_loveButton release];
    [_whiteView release];
    [_hiddenButton release];
    
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
//        用户头像
        self.userimageButton = [[UIButton alloc]initWithFrame:CGRectZero];
        _userimageButton.layer.cornerRadius = 20;
        _userimageButton.layer.masksToBounds = YES;
        [_userimageButton addTarget:self action:@selector(userimageAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_userimageButton];
        [_userimageButton release];
        
//        用户名
        self.usernameButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_usernameButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//        _usernameButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        _usernameButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        _userimageButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        [_usernameButton addTarget:self action:@selector(usernameAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_usernameButton];
        [_usernameButton release];
        
//        字：“在”
         self.atLable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_atLable setTextColor:[UIColor darkGrayColor]];

        _atLable.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:_atLable];
        [_atLable release];
        
//        旅行日记标题
         self.travernameButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_travernameButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_travernameButton addTarget:self action:@selector(travelnameAction:) forControlEvents:UIControlEventTouchUpInside];
        _travernameButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:_travernameButton];
        [_travernameButton release];
        
//        背景图
        self.backimageButton = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_backimageButton];
        _backimageButton.userInteractionEnabled = YES;
        [_backimageButton release];
        
//        白色底片
       self.whiteView = [[UIView alloc] initWithFrame:CGRectZero];
        [_whiteView setBackgroundColor:[UIColor whiteColor]];
//        _whiteView.userInteractionEnabled = YES;
        [self.contentView addSubview:_whiteView];
        [_whiteView release];
        
//        时间
       self.timeLable= [[UILabel alloc]initWithFrame:CGRectZero];
        [_timeLable setTextColor:[UIColor grayColor]];
        _timeLable.font = [UIFont systemFontOfSize:12.0];
        [_whiteView addSubview:_timeLable];
        [_timeLable release];
        
//        描述
        self.describeLable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_describeLable setTextColor:[UIColor grayColor]];
        _describeLable.font = [UIFont systemFontOfSize:16.0];
        [_whiteView addSubview:_describeLable];
        [_describeLable release];
        
//        喜欢
        self.loveButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_loveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loveButton setBackgroundImage:[UIImage imageNamed:@"love.png"] forState:UIControlStateNormal];
        _loveButton.selected = NO;
        [_loveButton addTarget:self action:@selector(loveAction:) forControlEvents:UIControlEventTouchUpInside];
        [_backimageButton addSubview:_loveButton];
        [_loveButton release];
        
//        信息
        self.messageButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_messageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_messageButton addTarget:self action:@selector(messageAction:) forControlEvents:UIControlEventTouchUpInside];
        [_messageButton setBackgroundImage:[UIImage imageNamed:@"message.png"] forState:UIControlStateNormal];
        [_backimageButton addSubview:_messageButton];
        [_messageButton release];
     
//        地点
        self.locationButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_locationButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
          _locationButton.titleLabel.font= [UIFont systemFontOfSize:12.0];
//        _locationButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        [_locationButton addTarget:self action:@selector(locationAction:) forControlEvents:UIControlEventTouchUpInside];
  
        //    改变字体位置 上左下右
        [_locationButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 50, 0, 0)];
        //    改变图片位置
        [_locationButton setImageEdgeInsets:UIEdgeInsetsMake(0, 50, 0, 0)];
              [_whiteView addSubview:_locationButton];
        [_locationButton release];
        
//        隐藏信息
       self.hiddenButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_hiddenButton setBackgroundColor:[UIColor lightGrayColor]];
        
        [_hiddenButton addTarget:self action:@selector(hiddenAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_hiddenButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _hiddenButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:_hiddenButton];
        [_hiddenButton release];
        
        
    }
    return self;
}
-(void)userimageAction:(id)sender
{
    NSLog(@"用户头像👦");
}
-(void)usernameAction:(id)sender
{
    NSLog(@" 用户名");

}
-(void)travelnameAction:(id)sender
{
    NSLog(@"✈️旅行日子名");

}
-(void)locationAction:(id)sender
{

    NSLog(@"旅行地点");

}
-(void)hiddenAction:(id)sender
{

    NSLog(@"隐藏消息");

}
//喜欢按钮
-(void)loveAction:(id)sender
{
    NSLog(@"喜欢");
    UIButton * bt = (UIButton *)sender;
    if ([bt isSelected]) {
        [_loveButton setBackgroundImage:[UIImage imageNamed:@"love.png"] forState:UIControlStateNormal];
        [bt setSelected:NO];
    }
    else
    {
        [_loveButton setBackgroundImage:[UIImage imageNamed:@"love1.png"] forState:UIControlStateNormal];
        bt.selected = YES;
    
    }

}
-(void)messageAction:(id)sender
{

    NSLog(@"message");
}
-(void)layoutSubviews
{
//    默认不使用父类的大小（一小条）
    [super layoutSubviews];

    [_userimageButton setFrame:CGRectMake(10, 0, 40, 40)];
    [_usernameButton setFrame:CGRectMake(55, 15, 60, 15)];
    [_atLable setFrame:CGRectMake(115, 15, 15, 15)];
    [_travernameButton setFrame:CGRectMake(130, 15, 150, 15 )];
    [_backimageButton setFrame:CGRectMake(45, 35, 255, 120)];
    [_whiteView setFrame:CGRectMake(45, 155, 255, 45)];
    [_timeLable setFrame:CGRectMake(5, 25, 80, 15)];
    [_describeLable setFrame:CGRectMake(5, 5, 255, 20)];
    [_loveButton setFrame:CGRectMake(180, 75, 25, 20)];
    [_messageButton setFrame:CGRectMake(203, 75, 25, 20)];
    [_locationButton setFrame:CGRectMake(100, 25, 150, 15)];
    [_hiddenButton setFrame:CGRectMake(45, 200, 255, 20)];


}

#pragma mark -
#pragma mark 等待加载第三方
- (void)mbProgressHUDTalent{
    _progressTest = [[MBProgressHUD alloc] initWithView:self.contentView];
    [self.contentView addSubview:_progressTest];
    [self.contentView bringSubviewToFront:_progressTest];
    _progressTest.mode = MBProgressHUDModeAnnularDeterminate;
    _progressTest.animationType=MBProgressHUDAnimationZoom;
    _progressTest.delegate = self;
    _progressTest.labelText = @"Loading...";
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
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
