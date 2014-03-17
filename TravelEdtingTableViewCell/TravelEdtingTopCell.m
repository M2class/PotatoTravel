//
//  TravelEdtingTopCell.m
//  TravelEdting
//
//  Created by _ MarS. on 14-3-8.
//  Copyright (c) 2014年 王柏慧. All rights reserved.
//

#import "TravelEdtingTopCell.h"


@implementation TravelEdtingTopCell

- (void)dealloc
{
    [_headView release];
    [_nameButton release];
    [_mapImage release];
    [_nameButton release];
    [_airImage release];
    [_cover1ImageView release];
    [_hotelImage release];
    [_hotelButton release];
    [_cover2ImageView release];
    [_dateLabel release];
    [_image release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        //头像
        self.headView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 20, 60, 60)];
        [_headView setImage:[UIImage imageNamed:@"avatar_placeholder"]];
        [self.contentView addSubview:_headView];
        [_headView release];
        
        //名字输入框
        self.nameButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 20, 30, 30)];
        [_nameButton setBackgroundImage:[UIImage imageNamed:@"edit_round@2x"] forState:UIControlStateNormal];
        [_nameButton addTarget:self.target action:self.nameButtonAction forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_nameButton];
        [_nameButton release];
        
        //地图测试区域
        self.mapImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 90, 290, 120)];
        [_mapImage setBackgroundColor:[UIColor orangeColor]];
        [self.contentView addSubview:_mapImage];
        [_mapImage release];
        
        //航班信息栏
        //图标
        self.airImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 220, 50, 40)];
        [_airImage setImage:[UIImage imageNamed:@"flight_count_icon@2x"]];
        [self.contentView addSubview:_airImage];
        [_airImage release];
        //点击框
        self.airButton = [[UIButton alloc] initWithFrame:CGRectMake(65, 220, 240, 40)];
        [_airButton setTitle:@" ⊕  添加航班信息" forState:UIControlStateNormal];
        [_airButton setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        
        [self.contentView addSubview:_airButton];
        [_airButton release];
        //外框
        self.cover1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 220, 290, 40)];
        [_cover1ImageView setImage:[UIImage imageNamed:@"map_cover@2x"]];
        [self.contentView addSubview:_cover1ImageView];
        [_cover1ImageView release];
        
        
        //酒店预订信息栏
        //图标
        self.hotelImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 270, 50, 40)];
        [_hotelImage setImage:[UIImage imageNamed:@"hotel_count_icon@2x"]];
        [self.contentView addSubview:_hotelImage];
        [_hotelImage release];
        //点击框
        self.hotelButton = [[UIButton alloc] initWithFrame:CGRectMake(65, 270, 240, 40)];
        [_hotelButton setTitle:@" ⊕  添加酒店信息" forState:UIControlStateNormal];
        [_hotelButton setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];

        [self.contentView addSubview:_hotelButton];
        [_hotelButton release];
        //外框
        self.cover2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 270, 290, 40)];
        [_cover2ImageView setImage:[UIImage imageNamed:@"map_cover@2x"]];
        [self.contentView addSubview:_cover2ImageView];
        [_cover2ImageView release];
        
        //时间Label
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 55, 70, 20)];
        [_dateLabel setText:@"2013.01.04"];
        _dateLabel.adjustsFontSizeToFitWidth = YES;
        [_dateLabel setTextColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:_dateLabel];
        [_dateLabel release];
        
        //下方下小条条
        self.image = [[UIImageView alloc] initWithFrame:CGRectMake(20, 330, 3, 100)];
        [_image setImage:[UIImage imageNamed:@"trip_info_separator_vertical~ipad"]];
        [self.contentView addSubview:_image];
        [_image release];

    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    [_airButton addTarget:self.target action:self.airButtonAction forControlEvents:UIControlEventTouchUpInside];
    [_nameButton addTarget:self.target action:self.nameButtonAction forControlEvents:UIControlEventTouchUpInside];
    [_hotelButton addTarget:self.target action:self.hotelButtonAction forControlEvents:UIControlEventTouchUpInside];
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
