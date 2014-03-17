//
//  HootDoorDetailUpCell.m
//  HootDoorDetail
//
//  Created by _ MarS. on 14-3-12.
//  Copyright (c) 2014年 王柏慧. All rights reserved.
//

#import "HootDoorDetailUpCell.h"

@implementation HootDoorDetailUpCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        //头像
        UIButton * faceButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        [faceButton setBackgroundImage:[UIImage imageNamed:@"auth_avatar_placeholder_image@2x~ipad"] forState:UIControlStateNormal];
        [self.contentView addSubview:faceButton];
        [faceButton release];
        //标题
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 15, 200, 40)];
        [titleLabel setText:@"啦啦啦德玛西亚"];
        titleLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:titleLabel];
        [titleLabel release];
        //时间，天数
        UILabel * dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 30, 80, 50)];
        [dateLabel setText:@"2013.01.04,9天"];
        [dateLabel setTextColor:[UIColor lightGrayColor]];
        dateLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:dateLabel];
        [dateLabel release];
        //分隔符
        UILabel * lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 30, 3, 50)];
        [lineLabel setText:@"|"];
        [lineLabel setTextColor:[UIColor lightGrayColor]];
        lineLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:lineLabel];
        [lineLabel release];
        //多少人收藏
        UILabel * putLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 30, 50, 50)];
        [putLabel setText:@"26人收藏"];
        [putLabel setTextColor:[UIColor lightGrayColor]];
        putLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:putLabel];
        [putLabel release];
        //地图
        UIImageView * mapImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 80, 300, 150)];
        [mapImage setBackgroundColor:[UIColor orangeColor]];
        mapImage.layer.masksToBounds = YES;
        mapImage.layer.cornerRadius = 3;
        [self.contentView addSubview:mapImage];
        [mapImage release];
        //蓝色分割线
        UIImageView * blueLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 200, 300, 40)];
        [blueLineImage setImage:[UIImage imageNamed:@"explore_tab_selected@2x"]];
        [self.contentView addSubview:blueLineImage];
        [blueLineImage release];
        //灰色分割线
        UIImageView * leftLineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 255, 100, 2)];
        [leftLineImageView setImage:[UIImage imageNamed:@"barshadow"]];
        [self.contentView addSubview:leftLineImageView];
        [leftLineImageView release];
        
        UIImageView * rightLineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 255, 100, 2)];
        [rightLineImageView setImage:[UIImage imageNamed:@"barshadow"]];
        [self.contentView addSubview:rightLineImageView];
        [rightLineImageView release];
        //奖杯图标
        UIImageView * cupImageView = [[UIImageView alloc] initWithFrame:CGRectMake(122, 248, 12, 12)];
        [cupImageView setImage:[UIImage imageNamed:@"mileage_cup_blue@2x"]];
        [self.contentView addSubview:cupImageView];
        [cupImageView release];
        //距离米数
        UILabel * distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 245, 50, 15)];
        [distanceLabel setText:@"54321km"];
        distanceLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:distanceLabel];
        [distanceLabel release];
        //飞机图
        UIButton * airPictureButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 270, 30, 30)];
        [airPictureButton setBackgroundImage:[UIImage imageNamed:@"flight_count_icon"] forState:UIControlStateNormal];
        [airPictureButton addTarget:self action:@selector(airButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:airPictureButton];
        [airPictureButton release];
        //飞机字
        UIButton * airCountButton = [[UIButton alloc] initWithFrame:CGRectMake(55, 270, 60, 30)];
        [airCountButton setTitle:@"0 航班" forState:UIControlStateNormal];
        [airCountButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [airCountButton addTarget:self action:@selector(airButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:airCountButton];
        [airCountButton release];
        //酒店图
        UIButton * hotelPictureButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 270, 30, 30)];
        [hotelPictureButton setBackgroundImage:[UIImage imageNamed:@"hotel_count_icon"] forState:UIControlStateNormal];
        [hotelPictureButton addTarget:self action:@selector(hotelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:hotelPictureButton];
        [hotelPictureButton release];
        //酒店字
        UIButton * hotelCountButton = [[UIButton alloc] initWithFrame:CGRectMake(235, 270, 60, 30)];
        [hotelCountButton setTitle:@"0 酒店" forState:UIControlStateNormal];
        [hotelCountButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [hotelCountButton addTarget:self action:@selector(hotelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:hotelCountButton];
        [hotelCountButton release];
        //景点图
        UIButton * placePictureButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 310, 30, 30)];
        [placePictureButton setBackgroundImage:[UIImage imageNamed:@"attraction_count_icon@2x"] forState:UIControlStateNormal];
        [placePictureButton addTarget:self action:@selector(placeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:placePictureButton];
        [placePictureButton release];
        //景点字
        UIButton * placeCountButton = [[UIButton alloc] initWithFrame:CGRectMake(55, 310, 60, 30)];
        [placeCountButton setTitle:@"0 景点" forState:UIControlStateNormal];
        [placeCountButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [placeCountButton addTarget:self action:@selector(placeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:placeCountButton];
        [placeCountButton release];
        //餐厅图
        UIButton * restaurantPictureButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 310, 30, 30)];
        [restaurantPictureButton setBackgroundImage:[UIImage imageNamed:@"food_count_icon@2x"] forState:UIControlStateNormal];
        [restaurantPictureButton addTarget:self action:@selector(restaurantButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:restaurantPictureButton];
        [restaurantPictureButton release];
        //餐厅字
        UIButton * restaurantCountButton = [[UIButton alloc] initWithFrame:CGRectMake(235, 310, 60, 30)];
        [restaurantCountButton setTitle:@"0 餐厅" forState:UIControlStateNormal];
        [restaurantCountButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [restaurantCountButton addTarget:self action:@selector(restaurantButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:restaurantCountButton];
        [restaurantCountButton release];
        
        
        
        //查看线路日程
        UIButton * lookButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 380, 300, 20)];
        [lookButton setTitle:@"查看线路日程" forState:UIControlStateNormal];
        [lookButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [lookButton addTarget:self action:@selector(loobButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:lookButton];
        [lookButton release];
        //日程边框
        UIImageView * lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 380, 300, 20)];
        [lineImage setImage:[UIImage imageNamed:@"cellshadow@2x"]];
        [self.contentView addSubview:lineImage];
        [lineImage release];
    }
    return self;
}


-(void)airButtonAction:(id)sender{
    NSLog(@"air air air");
}

-(void)hotelButtonAction:(id)sender{
    NSLog(@"hotel hotel hotel");
}

-(void)placeButtonAction:(id)sender{
    NSLog(@"place place place");
}

-(void)restaurantButtonAction:(id)sender{
    NSLog(@"restaurant restaurant restaurant");
}

-(void)loobButtonAction:(id)sender{
    NSLog(@"look look look");
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
