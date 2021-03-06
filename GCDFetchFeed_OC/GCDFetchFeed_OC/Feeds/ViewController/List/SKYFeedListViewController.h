//
//  SKYFeedListViewController.h
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/17.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SKYFeedModel;

@interface SKYFeedListViewController : UIViewController

- (instancetype)initWithFeedModel:(SKYFeedModel *)feedModel;

@end

NS_ASSUME_NONNULL_END
