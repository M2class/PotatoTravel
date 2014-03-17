//
//  AllmessageCell.m
//  PotatoTravel
//
//  Created by 可乐 on 14-3-14.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import "AllmessageCell.h"

@implementation AllmessageCell

- (void)dealloc
{
    [_iamgebutton release];
    [_usernamelable release];
    [_messagelable release];
    [_timelable release];
    [_inimage retain];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
//         发信息的人的头像
        self.iamgebutton = [[UIButton alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_iamgebutton];
        _iamgebutton.layer.cornerRadius = 20;
        _iamgebutton.layer.masksToBounds = YES;
        [_iamgebutton addTarget:self action:@selector(iamgebuttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_iamgebutton release];
        
//          发信息的人的名字
        self.usernamelable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_usernamelable setTextColor:[UIColor greenColor]];
        [_usernamelable setFont:[UIFont systemFontOfSize:14.0]];
        [self.contentView addSubview:_usernamelable];
        [_usernamelable release];
        
        
//        发信息的内容
        self.messagelable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_messagelable setTextColor:[UIColor lightGrayColor]];
        [_messagelable setFont:[UIFont systemFontOfSize:14.0]];
        [self.contentView addSubview:_messagelable];
        [_messagelable release];
        
//       发信息的时间
        self.timelable = [[UILabel alloc] initWithFrame:CGRectZero];
        [_timelable setTextColor:[UIColor lightGrayColor]];
        [_timelable setFont:[UIFont systemFontOfSize:12.0]];
        [self.contentView addSubview:_timelable];
        [_timelable release];
        
//        小->
        self.inimage = [[UIImageView alloc] initWithFrame:CGRectZero];
        [_inimage setImage:[UIImage imageNamed:@"accessory@2x.png"]];
        [self.contentView addSubview:_inimage];
        [_inimage release];
        
        
        
        
    }
    return self;
}

-(void)layoutSubviews
{

    [super layoutSubviews];
    [_iamgebutton setFrame:CGRectMake(10, 10, 40, 40)];
    [_usernamelable setFrame:CGRectMake(60, 10, 150, 20)];
    [_messagelable setFrame:CGRectMake(60, 30, 230, 20)];
    [_timelable setFrame:CGRectMake(230, 10, 80, 20)];
    [_inimage setFrame:CGRectMake(300, 15, 20, 20)];


    



}

-(void)iamgebuttonAction:(id)sender
{

    NSLog(@" 点击进入发信息者主页");

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
