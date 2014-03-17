//
//  DestinationDetailsCell.m
//  destinationDetails
//
//  Created by riseikan on 14-3-13.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import "DestinationDetailsCell.h"

@implementation DestinationDetailsCell
- (void)dealloc
{
    [_showImageView release];
    [_showLable release];
    [_titleLable release];
    [_titleLeftLineImageView release];
    [_titleRightLineImageView release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //展示图片
        self.showImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_showImageView];
        [_showImageView release];
        //展示文字
        self.showLable = [[UILabel alloc]initWithFrame:CGRectZero];
        [_showLable sizeToFit];
        _showLable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_showLable];
        [_showLable release];
        //标题线
        self.titleLeftLineImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_titleLeftLineImageView];
        [_titleLeftLineImageView release];
        //标题线
        self.titleRightLineImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_titleRightLineImageView];
        [_titleRightLineImageView release];
        //标题
        self.titleLable = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_titleLable];
        [_titleLable release];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [_showImageView setFrame:CGRectMake(10,30 , 300, 100)];
    [_showLable setFrame:CGRectMake(10, 130, 300, 70)];
    [_titleLeftLineImageView setFrame:CGRectMake(10, 16, 100, 2)];
    [_titleRightLineImageView setFrame:CGRectMake(210, 16, 100, 2)];
    [_titleLable setFrame:CGRectMake(110, 0, 100, 30)];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
