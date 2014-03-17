//
//  HotDoorCell.h
//  HotDoor
//
//  Created by _ MarS. on 14-3-4.
//  Copyright (c) 2014年 王柏慧. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotDoorCell : UITableViewCell<MBProgressHUDDelegate>


@property(nonatomic,retain) UIImageView * showImage;
@property(nonatomic,retain) UILabel * titleLabel;
@property(nonatomic,retain) UILabel * dateLabel;
@property(nonatomic,retain) UILabel * placeLabel;
@property(nonatomic,retain) UIButton * peopleButton;
@property(nonatomic,retain) UILabel * byLabel;
@property(nonatomic,retain) UILabel * nameLabel;
@property(nonatomic,retain) UIImageView * backImage;
@property(nonatomic,retain) UIImageView * dateImage;
@property(nonatomic,retain)MBProgressHUD* progressTest;
- (void)mbProgressHUDHotDoor;
@end
