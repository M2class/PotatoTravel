//
//  AsyConnecModel.h
//  AFNETWORK
//
//  Created by riseikan on 14-3-6.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


extern NSString * const AF_TripConnection;//逛一逛热门首页
extern NSString * const AF_TalentConnection;//逛一逛达人首页
extern NSString * const AF_NearbyConnection;//逛一逛附近首页
extern NSString * const AF_Destination;//目的地首页
extern NSString * const AF_Mine;//我的登录界面

//**______  web引用
extern NSString * const HS_TripConnection;
extern NSString * const RS_TripConnection;
//______**

typedef void(^ConnectBlock)();

@interface AsyConnecModel : NSObject
{
    ConnectBlock _connBlock;
    NSMutableData * _receiveData;

}
+ (void)asyncGetWithUrl:(NSString *)urlstr strparmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block;

//  数据上传
+(void)asyncPostWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block;

+(void)asyncPostWithParmaUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block;


+(void)connectionWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block;
@end
