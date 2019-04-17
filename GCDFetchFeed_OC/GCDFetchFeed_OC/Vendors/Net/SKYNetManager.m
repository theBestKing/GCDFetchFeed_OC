//
//  SKYNetManager.m
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import "SKYFeedModel.h"
#import "SKYFeedStore.h"
#import "SKYNetManager.h"
#import "SKYNotificationConst.h"

@interface SKYNetManager ()

@property (nonatomic, strong) SKYFeedStore *feedStore;

@end

@implementation SKYNetManager

#pragma mark - Life Cycle

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

#pragma mark - Public Methods

- (void)fetchAllFeedsWithModelArray:(NSArray *)modelArray {
    __weak __typeof(self)weakSelf = self;
    dispatch_queue_t fetchFeedQueue = dispatch_queue_create("com.hikvision.fetchfeed_OC.fetchfeed", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    self.feeds = [NSMutableArray arrayWithArray:modelArray];
    
    for (int i = 0; i < modelArray.count; i++) {
        dispatch_group_enter(group);
        SKYFeedModel *feedModel = modelArray[i];
        dispatch_async(fetchFeedQueue, ^{
            [weakSelf GET:feedModel.feedUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                weakSelf.feeds[i] = [weakSelf.feedStore updateFeedModelWithData:responseObject preModel:feedModel];
                
                // 发送通知
                NSDictionary *userInfo = @{ @"index" : [NSString stringWithFormat:@"%d", i] };
                [[NSNotificationCenter defaultCenter] postNotificationName:NetworkingFetchOneFeedCompleteNotification object:nil userInfo:userInfo];
                
                dispatch_group_leave(group);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"Error: %@", error);
                dispatch_group_leave(group);
            }];
        });
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:NetworkingFetchAllFeedsCompleteNotification object:nil userInfo:nil];
    });
}

#pragma mark - Setter and Getter

- (SKYFeedStore *)feedStore {
    if (!_feedStore) {
        _feedStore = [[SKYFeedStore alloc] init];
    }
    return _feedStore;
}

- (NSMutableArray *)feeds {
    if (!_feeds) {
        _feeds = [NSMutableArray array];
    }
    return _feeds;
}

@end
