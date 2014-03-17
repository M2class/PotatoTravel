//
//  AppDelegate.m
//  PotatoTravel
//
//  Created by riseikan on 14-3-4.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import "AppDelegate.h"
#import "MainInterfaceViewController.h"
#import "DestinationViewController.h"
#import "TravelEditingViewController.h"
#import "MineViewController.h"
#import "OffIneViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <MAMapKit/MAMapKit.h>
#import "LoginViewController.h"
#import "WXApi.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
//    高德
    [MAMapServices sharedServices].apiKey =@"1a65741141c4ef27be884ff37b550b20";
    //shareSDK
    [ShareSDK registerApp:@"1585f494c69b"];
    [self shareSDKInit];
    //地图第三方
//    [MAMapServices sharedServices].apiKey =@"0c0494bfdd30bc411cd60f7a83296c79";
    [self tabBarInit];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)tabBarInit{
    //创建TabBarItem
    MainInterfaceViewController *mainRoot =[[MainInterfaceViewController alloc]init];
    UIImage *mainImage = [UIImage imageNamed:@"tabbar_explore.png"];
    //转换成显示模式
    UIImage *mainImageStyle = [mainImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *mainImagehl = [UIImage imageNamed:@"tabbar_explore_hl.png"];
    //转换成显示模式
    UIImage *mainImagehlStyle = [mainImagehl imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [mainRoot.tabBarItem initWithTitle:nil image:mainImageStyle selectedImage:mainImagehlStyle];
    DestinationViewController *destinationRoot = [[DestinationViewController alloc]init];
    UIImage *destinationRootImage = [UIImage imageNamed:@"tabbar_dest.png"];
    //转换成显示模式
    UIImage *destinationRootImageStyle = [destinationRootImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *destinationRootImagehl = [UIImage imageNamed:@"tabbar_dest_hl.png"];
    //转换成显示模式
    UIImage *destinationRootImagehlStyle = [destinationRootImagehl imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [destinationRoot.tabBarItem initWithTitle:nil image:destinationRootImageStyle selectedImage:destinationRootImagehlStyle];
    
    TravelEditingViewController *travelRoot = [[TravelEditingViewController alloc]init];
   _travelNavigation = [[UINavigationController alloc]initWithRootViewController:travelRoot];
    UIImage *traveRootImage = [UIImage imageNamed:@"tabbar_trip_create.png"];
    //转换成显示模式
    UIImage *traveRootImageStyle = [traveRootImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *traveRootImagehl = [UIImage imageNamed:@"tabbar_trip_create_hl.png"];
    //转换成显示模式
    UIImage *traveRootImagehlStyle = [traveRootImagehl imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [travelRoot.tabBarItem initWithTitle:nil image:traveRootImageStyle selectedImage:traveRootImagehlStyle];
    
    
    MineViewController *mineRoot = [[MineViewController alloc]init];
    
    _mineNavigation = [[UINavigationController alloc]initWithRootViewController:mineRoot];
//    *

    [_mineNavigation.navigationBar setBackgroundImage:[UIImage imageNamed:@"account_uploadavatar_btn.png"] forBarMetrics:UIBarMetricsDefault];
    _mineNavigation.navigationBar.tintColor=[UIColor whiteColor];
    UIImage *mineImage = [UIImage imageNamed:@"tabbar_me.png"];
    //转换能显示模式
    UIImage *mineImageStyle = [mineImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *mineImagehl = [UIImage imageNamed:@"tabbar_me_hl.png"];
    //转换能显示模式
    UIImage *mineImagehlStyle = [mineImagehl imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [mineRoot.tabBarItem initWithTitle:nil image:mineImageStyle selectedImage:mineImagehlStyle];
    
    
    OffIneViewController *offLineRoot = [[OffIneViewController alloc]init];
    UIImage *offLineRootImage = [UIImage imageNamed:@"tabbar_offline.png"];
    //转换能显示模式
    UIImage *offLineRootImageStyle = [offLineRootImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *offLineRootImagehl = [UIImage imageNamed:@"tabbar_offline_hl.png"];
    //转换能显示模式
    UIImage *offLineRootImagehlStyle = [offLineRootImagehl imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [offLineRoot.tabBarItem initWithTitle:nil image:offLineRootImageStyle selectedImage:offLineRootImagehlStyle];
    NSArray *arr = [NSArray arrayWithObjects:mainRoot,destinationRoot,_travelNavigation,_mineNavigation,offLineRoot, nil];
    //设置tabBar上的图片偏移
    [offLineRoot.tabBarItem setImageInsets:UIEdgeInsetsMake(0, 0, -7, 0)];
    [mainRoot.tabBarItem setImageInsets:UIEdgeInsetsMake(0, 0, -7, 0)];
    [destinationRoot.tabBarItem setImageInsets:UIEdgeInsetsMake(0, 0, -7, 0)];
    [travelRoot.tabBarItem setImageInsets:UIEdgeInsetsMake(0, 0, -7, 0)];
    [mineRoot.tabBarItem setImageInsets:UIEdgeInsetsMake(0, 0, -7, 0)];
    //创建TabBar
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    
    
//    单例赋值
    Tab_Single * single = [Tab_Single shareInterface];
    single.tabbarcontroller = tabBar;
    
    tabBar.delegate = self;
    //TabBar字体颜色
    tabBar.tabBar.tintColor = [UIColor whiteColor];
    //TabBar背景颜色
//    tabBar.tabBar.barTintColor = [UIColor blackColor];
    //TabBar背景图片
    tabBar.tabBar.backgroundImage = [UIImage imageNamed:@"account_uploadavatar_btn.png"];
    [tabBar setViewControllers:arr animated:YES];
    [_window setRootViewController:tabBar];
    [mainRoot release];
    [destinationRoot release];
    [travelRoot release];
    [mineRoot release];
    [offLineRoot release];
    [_mineNavigation release];
    [_travelNavigation release];
    
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSUserDefaults * userdefult = [NSUserDefaults standardUserDefaults];
    if (viewController == _mineNavigation) {
        if (![userdefult objectForKey:@"username"]) {
            NSLog(@"没登录呢");
            LoginViewController * login = [[LoginViewController alloc] init];
            //            没登录的时候让他跳转到登录页面
            
            [_mineNavigation presentViewController:login animated:NO completion:NULL];            [login release];
            
        }
    }
        if (viewController == _travelNavigation) {
            if (![userdefult objectForKey:@"username"]) {
                NSLog(@"没登录呢");
                LoginViewController * login = [[LoginViewController alloc] init];
                //            没登录的时候让他跳转到登录页面
                
                [_travelNavigation presentViewController:login animated:NO completion:NULL];
                [login release];
                
            }
        
        
        
    }
    NSLog(@"已经选中了 %@ 视图",viewController);


}
- (void)shareSDKInit{
    //添加新浪微博应用
    [ShareSDK connectSinaWeiboWithAppKey:@"1768208563"
                               appSecret:@"b3e2787c53fb806a6ee217e82f71ec7e"
                             redirectUri:@"http://weibo.com"];
    
    //添加腾讯微博应用
    [ShareSDK connectTencentWeiboWithAppKey:@"801486289"
                                  appSecret:@"af66cc919dc0c238fb7d40c9ea15e73e"
                             redirectUri:@"http://breadtrip.com/"];
    
    
//    [ShareSDK connectWeChatSessionWithAppId:@"wx4b6ceeacc45b4109" wechatCls:[WXApi class]];
//    [ShareSDK connectWeChatTimelineWithAppId:@"wx4b6ceeacc45b4109" wechatCls:[WXApi class]];
//    [ShareSDK connectWeChatFavWithAppId:@"wx4b6ceeacc45b4109" wechatCls:[WXApi class]];
//    [ShareSDK connectWeChatWithAppId:@"wx4b6ceeacc45b4109" wechatCls:[WXApi class]];
    
//    //添加QQ空间应用
//    [ShareSDK connectQZoneWithAppKey:@"101036111"
//                           appSecret:@"41d420b3e8cdde9efc14abad0ad2d020"];
//
//    //添加网易微博应用
//    [ShareSDK connect163WeiboWithAppKey:@"T5EI7BXe13vfyDuy"
//                              appSecret:@"gZxwyNOvjFYpxwwlnuizHRRtBRZ2lV1j"
//                            redirectUri:@"http://www.shareSDK.cn"];
//    
//    //添加搜狐微博应用
//    [ShareSDK connectSohuWeiboWithConsumerKey:@"SAfmTG1blxZY3HztESWx"
//                               consumerSecret:@"yfTZf)!rVwh*3dqQuVJVsUL37!F)!yS9S!Orcsij"
//                                  redirectUri:@"http://www.sharesdk.cn"];
//    
//    //添加豆瓣应用
//    [ShareSDK connectDoubanWithAppKey:@"07d08fbfc1210e931771af3f43632bb9"
//                            appSecret:@"e32896161e72be91"
//                          redirectUri:@"http://dev.kumoway.com/braininference/infos.php"];
//    
    //添加人人网应用
    [ShareSDK connectRenRenWithAppKey:@"9a5afead901c4fb0b25333e6ac1b601b"
                            appSecret:@"14406f4112e3488ab8074655a90d0bd7"];
//    
//    //添加开心网应用
//    [ShareSDK connectKaiXinWithAppKey:@"358443394194887cee81ff5890870c7c"
//                            appSecret:@"da32179d859c016169f66d90b6db2a23"
//                          redirectUri:@"http://www.sharesdk.cn/"];
//    
//    //添加Instapaper应用
//    [ShareSDK connectInstapaperWithAppKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA"
//                                appSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
//
//    //添加有道云笔记应用
//    [ShareSDK connectYouDaoNoteWithConsumerKey:@"dcde25dca105bcc36884ed4534dab940"
//                                consumerSecret:@"d98217b4020e7f1874263795f44838fe"
//                                   redirectUri:@"http://www.sharesdk.cn/"];
//    
//    //添加Facebook应用
//    [ShareSDK connectFacebookWithAppKey:@"107704292745179"
//                              appSecret:@"38053202e1a5fe26c80c753071f0b573"];
    
//    //添加Twitter应用
//    [ShareSDK connectTwitterWithConsumerKey:@"mnTGqtXk0TYMXYTN7qUxg"
//                             consumerSecret:@"ROkFqr8c3m1HXqS3rm3TJ0WkAJuwBOSaWhPbZ9Ojuc"
//                                redirectUri:@"http://www.sharesdk.cn"];
//    
//    //添加搜狐随身看应用
//    [ShareSDK connectSohuKanWithAppKey:@"e16680a815134504b746c86e08a19db0"
//                             appSecret:@"b8eec53707c3976efc91614dd16ef81c"
//                           redirectUri:@"http://sharesdk.cn"];
//    
//    //添加Pocket应用
//    [ShareSDK connectPocketWithConsumerKey:@"11496-de7c8c5eb25b2c9fcdc2b627"
//                               redirectUri:@"pocketapp1234"];
//    
//    //添加印象笔记应用
//    [ShareSDK connectEvernoteWithType:SSEverNoteTypeSandbox
//                          consumerKey:@"sharesdk-7807"
//                       consumerSecret:@"d05bf86993836004"];
//    
//    //添加LinkedIn应用
//    [ShareSDK connectLinkedInWithApiKey:@"ejo5ibkye3vo"
//                              secretKey:@"cC7B2jpxITqPLZ5M"
//                            redirectUri:@"http://sharesdk.cn"];
//    

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
