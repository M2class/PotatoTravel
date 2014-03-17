//
//  Tab_Single.m
//  PotatoTravel
//
//  Created by 可乐 on 14-3-13.
//  Copyright (c) 2014年 riseikan. All rights reserved.
//

#import "Tab_Single.h"
static Tab_Single * interface = NULL;
@implementation Tab_Single


//实例构造检查静态实例是否为nil
+(Tab_Single *)shareInterface
{
//    单线程安全
 @synchronized (self)
    {
    
        if (interface == Nil)
        {
            [[self alloc] init];
        }
    }

    return interface;

}
//重写allocWithZone方法
+(id)allocWithZone:(struct _NSZone *)zone
{
//    生打出来 不提示的
@synchronized (self) {
    
    if (interface == Nil)
    {
        interface = [super allocWithZone:zone];
        return interface;
    }
   return Nil;
    
}
}
- (id) copyWithZone:(NSZone *)zone //第四步
    {
        return self;
    }
-(id)retain
    {
        
        return self;
    }
-(unsigned )retainCount
    {
        
        return UINT_MAX;
        
        
    }
-(oneway void)relase
    {
        
        
        
        
    }
- (id) autorelease
    {
        return self;
    }
    
- (id)init
    {
        @synchronized(self)
        {
            [super init];//往往放一些要初始化的变量.
            return self;
        }
    }
    
    
    
    
    
    
    
    
    
    






@end
