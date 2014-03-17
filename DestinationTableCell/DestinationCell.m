//
//  DestinationCell.m
//  Destination
//
//  Created by _ MarS. on 14-3-5.
//  Copyright (c) 2014年 王柏慧. All rights reserved.
//

#import "DestinationCell.h"

@implementation DestinationCell
- (void)dealloc
{
    [_nameLable release];
    [_pictureImage release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.pictureImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 280, 140)];
        [_pictureImage setImage:[UIImage imageNamed:@"11.png"]];
        _pictureImage.layer.cornerRadius = 5;
        _pictureImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_pictureImage];
        [_pictureImage release];
        
        self.nameLable = [[UILabel alloc]initWithFrame:CGRectZero];
        _nameLable.textColor = [UIColor whiteColor];
        _nameLable.shadowColor = [UIColor blackColor];
        _nameLable.shadowOffset = CGSizeMake(1, 2);
        _nameLable.font = [UIFont systemFontOfSize:25];
        [self.contentView addSubview:_nameLable];
        [_nameLable release];
    }
    return self;
}
-(void)layoutSubviews
{
    //    默认不使用父类的大小（一小条）
    [super layoutSubviews];
    
    [_nameLable setFrame:CGRectMake(40, 0, 320, 80)];
}
#pragma mark -
#pragma mark 等待加载第三方
- (void)mbProgressHUDDestination{
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
