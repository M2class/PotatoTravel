//
//  AsyConnecModel.m
//  AFNETWORK
//
//  Created by riseikan on 14-3-6.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import "AsyConnecModel.h"


#import "AFHTTPSessionManager.h"


NSString * const AF_TripConnection = @"http://api.breadtrip.com/trips/hot/?start=0&count=20&is_ipad=true";
NSString * const AF_TalentConnection = @"http://api.breadtrip.com/feeds/grouped/?count=20";
NSString * const AF_NearbyConnection = @"http://api.breadtrip.com/feeds/around/?lat=38.886006608329645&lng=121.54316915009309&count=20&shift=false";
NSString * const AF_Destination = @"http://api.breadtrip.com/destination/";
NSString * const AF_Mine = @"http://api.breadtrip.com/users/2386767053";

//*________________
NSString * const HS_TripConnection =@"http://api.breadtrip.com/accounts/signup/";
NSString *const RS_TripConnection = @"http://api.breadtrip.com/accounts/login/";
//______________*


@implementation AsyConnecModel

+ (void)asyncGetWithUrl:(NSString *)urlstr strparmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlstr parameters:parmaters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
                block(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSLog(@"error=====%@",error);
        
    }];
}
//数据上传
+(void)asyncPostWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block
{
    AFHTTPRequestOperationManager *manage = [AFHTTPRequestOperationManager manager];
    
    [manage POST:urlstr parameters:parmaters success:^(AFHTTPRequestOperation *operation,id responseObject){
        block(responseObject);
        NSLog(@"response====%@",responseObject);
    }
         failure:^(AFHTTPRequestOperation *operation,NSError *error){
             NSLog(@"error======%@",error);
         }];
    
}
+(void)asyncPostWithParmaUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block
{
    AFHTTPRequestOperationManager *manage = [AFHTTPRequestOperationManager manager];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlstr]];
    
    [request setHTTPMethod:@"POST"];
    [manage HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"response === %@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error == %@",error);
    }];
}

+(void)connectionWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block{
    AsyConnecModel *model = [[AsyConnecModel alloc] init];
    [model startWithUrl:urlstr parmaters:parmaters finishBlock:block];
    [model release];
}

-(void)startWithUrl:(NSString *)urlstr parmaters:(NSDictionary *)parmaters finishBlock:(ConnectBlock)block{
    _connBlock = Block_copy(block);
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlstr]];
    
    NSString *par = @"";
    for (NSString *key in parmaters) {
        if ([par length] == 0) {
            par = [NSString stringWithFormat:@"%@=%@",key,[parmaters objectForKey:key]];
        }else{
            par = [NSString stringWithFormat:@"%@&%@=%@",par,key,[parmaters objectForKey:key]];
        }
        
    }
    
    NSData *data = [par dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:data];
    [request setHTTPMethod:@"POST"];
    [NSURLConnection connectionWithRequest:request delegate:self];
    //    z账号密码：蓝鸥大连6 1234567890
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _receiveData = [[NSMutableData alloc] init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_receiveData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    //    NSString *str = [[NSString alloc] initWithData:_receiveData encoding:NSUTF8StringEncoding];
    NSString *str = [[NSString alloc] initWithData:_receiveData encoding:NSUTF8StringEncoding];
    NSLog(@"str == %@",str);
    NSError *error = nil;
    id dic= [NSJSONSerialization JSONObjectWithData:_receiveData options:(NSJSONReadingMutableContainers) error:&error];
    if (error) {
        NSLog(@"error jason ===%@",error);
    }
    _connBlock(dic);
    
}



@end
