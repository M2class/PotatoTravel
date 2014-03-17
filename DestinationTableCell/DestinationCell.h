//
//  DestinationCell.h
//  Destination
//
//  Created by _ MarS. on 14-3-5.
//  Copyright (c) 2014年 王柏慧. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DestinationCell : UITableViewCell<MBProgressHUDDelegate>


@property(nonatomic,retain) UIImageView * pictureImage;
@property(nonatomic,retain) UILabel *nameLable;

@property(nonatomic,retain)MBProgressHUD* progressTest;
- (void)mbProgressHUDDestination;
@end
