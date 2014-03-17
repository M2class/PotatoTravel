//
//  TravelEdtingTopCell.h
//  TravelEdting
//
//  Created by _ MarS. on 14-3-8.
//  Copyright (c) 2014年 王柏慧. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TravelEdtingTopCell : UITableViewCell


@property (nonatomic ,retain) UIImageView * headView;
@property (nonatomic ,retain) UIButton * nameButton;
@property (nonatomic ,retain) UIImageView * mapImage;
@property (nonatomic ,retain) UIImageView * airImage;
@property (nonatomic ,retain) UIButton * airButton;
@property (nonatomic ,retain) UIImageView *cover1ImageView;
@property (nonatomic ,retain) UIImageView * hotelImage;
@property (nonatomic ,retain) UIButton * hotelButton;
@property (nonatomic ,retain) UIImageView * cover2ImageView;
@property (nonatomic ,retain) UILabel * dateLabel;
@property (nonatomic ,retain) UIImageView * image;

@property (nonatomic ,assign) SEL nameButtonAction;
@property (nonatomic ,assign) SEL airButtonAction;
@property (nonatomic ,assign) SEL hotelButtonAction;
@property (nonatomic ,assign) id target;

@end
