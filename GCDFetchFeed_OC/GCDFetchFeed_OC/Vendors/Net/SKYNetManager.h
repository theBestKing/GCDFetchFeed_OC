//
//  SKYNetManager.h
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface SKYNetManager : AFHTTPSessionManager

@property (nonatomic, strong) NSMutableArray *feeds;

+ (instancetype)shareInstance;
- (void)fetchAllFeedsWithModelArray:(NSArray *)modelArray;

@end

NS_ASSUME_NONNULL_END
