//
//  FootWriteViewController.h
//  Foot
//
//  Created by _ MarS. on 14-3-10.
//  Copyright (c) 2014年 王柏慧. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FootWriteViewController : UIViewController<UIAlertViewDelegate>
{
    UIButton * _lockButton;
    UIButton * _newButton;
    UIButton * _qqButton;
    UIDatePicker *_datePicker;
    BOOL _apperPick;
    NSDateFormatter *_formatter;
    NSString *_nss;
    UIButton * _dateUpButton;
    
}
@end
