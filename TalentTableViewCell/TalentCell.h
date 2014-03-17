//
//  TalentCell.h
//  PotatoTravel
//
//  Created by 可乐 on 14-3-4.
//  Copyright (c) 2014年 可乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TalentCell : UITableViewCell<MBProgressHUDDelegate>

@property(nonatomic,retain)UIButton * userimageButton;
@property(nonatomic,retain)UIButton * usernameButton;
@property(nonatomic,retain)UILabel  * atLable;
@property(nonatomic,retain)UIButton * travernameButton;
@property(nonatomic,retain)UIImageView * backimageButton;
@property(nonatomic,retain)UIView   * whiteView;
@property(nonatomic,retain)UIButton * loveButton;
@property(nonatomic,retain)UIButton * messageButton;
@property(nonatomic,retain)UILabel  * describeLable;
@property(nonatomic,retain)UILabel  * timeLable;
@property(nonatomic,retain)UIButton * locationButton;
@property(nonatomic,retain)UIButton * hiddenButton;

@property(nonatomic,retain)MBProgressHUD* progressTest;
- (void)mbProgressHUDTalent;
@end
