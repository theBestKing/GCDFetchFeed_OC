//
//  SKYNetManager.m
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import "SKYNetManager.h"

@implementation SKYNetManager

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static SKYNetManager *netManager;
    dispatch_once(&onceToken, ^{
        netManager = [[SKYNetManager alloc] init];
        netManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        netManager.requestSerializer.timeoutInterval = 20.0f;
    });
    return netManager;
}

@end
