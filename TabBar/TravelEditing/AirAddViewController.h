//
//  AirAddViewController.h
//  Air
//
//  Created by _ MarS. on 14-3-10.
//  Copyright (c) 2014年 王柏慧. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AirAddViewController : UIViewController
{
    UIDatePicker *_datePicker;
    NSDateFormatter *_formatter;
    NSString *_nssl;
    UIButton * _airDateButton;
    BOOL _apperPick;
    UITextField * _airTextField;
}
@end
