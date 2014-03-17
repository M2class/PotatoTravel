//
//  HootDoorDetailDowCell.m
//  HootDoorDetail
//
//  Created by _ MarS. on 14-3-12.
//  Copyright (c) 2014年 王柏慧. All rights reserved.
//

#import "HootDoorDetailDowCell.h"

@implementation HootDoorDetailDowCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        //前方小球球分隔标示
        UIImageView * ballImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
        [ballImage setImage:[UIImage imageNamed:@"journey_table_header@2x"]];
        [self.contentView addSubview:ballImage];
        [ballImage release];
        //上传时间(第几天，时间)
        UILabel * timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, -8, 120, 30)];
        [timeLabel setText:@"第一天 2013.01.04"];
        timeLabel.adjustsFontSizeToFitWidth = YES;
        [ballImage addSubview:timeLabel];
        [timeLabel release];
        //图片Button
        UIImageView * pictureImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 30, 290, 150)];
        [pictureImage setBackgroundColor:[UIColor grayColor]];
        pictureImage.layer.masksToBounds = YES;
        pictureImage.layer.cornerRadius = 5;
        [self.contentView addSubview:pictureImage];
        [pictureImage release];
        //图片详情
        UILabel * descripLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 180, 290, 80)];
        [descripLabel setText:@"啦啦啦啦"];
        descripLabel.font = [UIFont systemFontOfSize:12.0];
        [descripLabel setTextColor:[UIColor blackColor]];
//        [descripLabel setBackgroundColor:[UIColor orangeColor]];
        [self.contentView addSubview:descripLabel];
        [descripLabel release];
        //上传时间（钟视图）
        UIImageView * clockImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 60, 15, 15)];
        [clockImage setImage:[UIImage imageNamed:@"clock_gray@2x"]];
        [descripLabel addSubview:clockImage];
        [clockImage release];
        //上传时间图标旁边的时间（日期，时间）
        UILabel * dateTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 70, 15)];
        [dateTimeLabel setText:@"04.10 09:03"];
        [dateTimeLabel setTextColor:[UIColor lightGrayColor]];
        dateTimeLabel.adjustsFontSizeToFitWidth = YES;
        [descripLabel addSubview:dateTimeLabel];
        [dateTimeLabel release];
        //下方分隔小灰条
        UIImageView * grayLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 77, 290, 3)];
        [grayLineImage setImage:[UIImage imageNamed:@"barshadow"]];
        [descripLabel addSubview:grayLineImage];
        [grayLineImage release];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
