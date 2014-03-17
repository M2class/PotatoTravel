//
//  Tab_Single.h
//  PotatoTravel
//
//  Created by 可乐 on 14-3-13.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tab_Single : NSObject
@property(nonatomic,retain)UITabBarController * tabbarcontroller;
+(Tab_Single *)shareInterface;
@end
