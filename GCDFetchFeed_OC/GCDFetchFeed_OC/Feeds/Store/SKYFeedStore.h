//
//  SKYFeedStore.h
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SKYFeedModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SKYFeedStore : NSObject

- (SKYFeedModel *)updateFeedModelWithData:(NSData *)feedData preModel:(SKYFeedModel *)preModel;

@end

NS_ASSUME_NONNULL_END
