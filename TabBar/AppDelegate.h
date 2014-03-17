//
//  AppDelegate.h
//  PotatoTravel
//
//  Created by riseikan on 14-3-4.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>


{

    UINavigationController * _mineNavigation;
    UINavigationController *_travelNavigation;
}
@property (strong, nonatomic) UIWindow *window;
@end
