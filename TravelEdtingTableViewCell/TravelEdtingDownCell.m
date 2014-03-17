//
//  TravelEdtingDownCell.m
//  TravelEdting
//
//  Created by _ MarS. on 14-3-8.
//  Copyright (c) 2014年 王柏慧. All rights reserved.
//

#import "TravelEdtingDownCell.h"

@implementation TravelEdtingDownCell

- (void)dealloc
{

    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        //分隔图
        UIImageView * lineimage1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
        [lineimage1 setImage:[UIImage imageNamed:@"journey_section_header@2x.png"]];
        [self.contentView addSubview:lineimage1];
        [lineimage1 release];
        
        //分割图旁边的添加日期
        UILabel * dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 90, 15)];
        dayLabel.adjustsFontSizeToFitWidth = YES;
        [dayLabel setText:@"第一天 02月02日"];
        [dayLabel setTextColor:[UIColor brownColor]];
        [self.contentView addSubview:dayLabel];
        [dayLabel release];
        
        //所上传的图片
        UIButton * pictureButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, 81, 81)];
        [pictureButton setBackgroundColor:[UIColor orangeColor]];
        [self.contentView addSubview:pictureButton];
        [pictureButton release];
        
        //上传图片时添加的描述
        UILabel * pictuerLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, 215, 81)];
//        [pictuerLabel setBackgroundColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:pictuerLabel];
        [pictuerLabel release];
        
        //上传图片日期图标
        UIImageView * dateUpImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 69, 10, 10)];
        [dateUpImage setImage:[UIImage imageNamed:@"clock_gray@2x"]];
        [pictuerLabel addSubview:dateUpImage];
        [dateUpImage release];
        
        //上传图片日期
        UILabel * dateUpLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 56, 70, 30)];
        [dateUpLabel setText:@"2013-01-01 09:30"];
        dateUpLabel.adjustsFontSizeToFitWidth = YES;
        [dateUpLabel setTextColor:[UIColor grayColor]];
        [pictuerLabel addSubview:dateUpLabel];
        [dateUpLabel release];
        
        //详情点击标示
        UIImageView * buttonImage = [[UIImageView alloc] initWithFrame:CGRectMake(200, 30, 20, 20)];
        [buttonImage setImage:[UIImage imageNamed:@"accessory@2x"]];
        [pictuerLabel addSubview:buttonImage];
        [buttonImage release];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
