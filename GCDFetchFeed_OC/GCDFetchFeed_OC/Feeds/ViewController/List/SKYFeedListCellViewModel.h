//
//  SKYFeedListCellViewModel.h
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/17.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SKYFeedModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SKYFeedListCellViewModel : NSObject

@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, copy) NSString *contentString;
@property (nonatomic, strong) SKYFeedItemModel *itemModel;
@property (nonatomic, assign) CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
