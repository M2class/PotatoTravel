//
//  HotDoorCell.m
//  HotDoor
//
//  Created by _ MarS. on 14-3-4.
//  Copyright (c) 2014年 王柏慧. All rights reserved.
//

#import "HotDoorCell.h"

@implementation HotDoorCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.showImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 280, 140)];
//        [_button setBackgroundImage:[UIImage imageNamed:@"1.1.png"] forState:UIControlStateNormal];
        _showImage.layer.cornerRadius = 5;
        _showImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_showImage];
        [_showImage release];
        
        self.backImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 280, 140)];
        [_backImage setImage:[UIImage imageNamed:@"黑影.png"]];
        _backImage.layer.cornerRadius = 5;
        _backImage.layer.masksToBounds = YES;
        _backImage.userInteractionEnabled = YES;
        [self.contentView addSubview:_backImage];
        [_backImage release];
        
        self.dateImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, 70, 25)];
        [_dateImage setImage:[UIImage imageNamed:@"日期地点.png"]];
        [_showImage addSubview:_dateImage];
        [_dateImage release];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, 260, 30)];
//        [_titleLabel setText:@"超级玛丽之超级玛丽"];
//        _titleLabel.adjustsFontSizeToFitWidth = YES;
        [_titleLabel setFont:[UIFont fontWithName:nil size:15.0]];
        [_titleLabel setTextColor:[UIColor whiteColor]];

        _titleLabel.shadowColor=[UIColor lightGrayColor];
        _titleLabel.shadowOffset = CGSizeMake(0, 1);
        [self.contentView addSubview:_titleLabel];
        [_titleLabel release];
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 32, 50, 15)];
//        [_dateLabel setText:@"2014.03.03"];
        [_dateLabel setTextColor:[UIColor whiteColor]];
        _dateLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_dateLabel];
        [_dateLabel release];
        
        self.placeLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 42, 200, 20)];
//        [_placeLabel setText:@"中国，大连"];
        [_placeLabel setTextColor:[UIColor whiteColor]];
        [_placeLabel setFont:[UIFont fontWithName:nil size:8.0]];
//        _placeLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_placeLabel];
        [_placeLabel release];
        
        self.peopleButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 75, 30, 30)];
        [_peopleButton setBackgroundImage:[UIImage imageNamed:@"1.2png"] forState:UIControlStateNormal];
        _peopleButton.layer.masksToBounds = YES;
        _peopleButton.layer.cornerRadius = 15;
        [_peopleButton addTarget:self action:@selector(peopleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_backImage addSubview:_peopleButton];
        [_peopleButton release];
        
        self.byLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 113, 15, 15)];
        _byLabel.adjustsFontSizeToFitWidth = YES;
        [_byLabel setText:@"by"];
        _byLabel.font = [UIFont fontWithName:@"Courier-BoldOblique" size:12];
        [_byLabel setTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:_byLabel];
        [_byLabel release];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(53, 112, 50, 15)];
//        _nameLabel.adjustsFontSizeToFitWidth = YES;
//        [_nameLabel setText:@"米修米修米修"];
        [_nameLabel setFont:[UIFont fontWithName:nil size:10.0]];
        [_nameLabel setTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel release];
    
    }
    return self;
}


-(void)buttonAction:(id)sender{
    NSLog(@"gogogogogogogogogog");
}


-(void)peopleButtonAction:(id)sender{
    NSLog(@"lalalallaalalalalalalal");
}

#pragma mark -
#pragma mark 等待加载第三方
- (void)mbProgressHUDHotDoor{
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
