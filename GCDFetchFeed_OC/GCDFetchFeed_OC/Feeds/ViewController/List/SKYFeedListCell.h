//
//  SKYFeedListCell.h
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/17.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SKYFeedListCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SKYFeedListCellDelegate;

@interface SKYFeedListCell : UIView

@property (nonatomic, weak) id <SKYFeedListCellDelegate> delegate;

- (instancetype)initWithViewModel:(SKYFeedListCellViewModel *)viewModel;
- (void)updateWithViewModel:(SKYFeedListCellViewModel *)viewModel;

@end

@protocol SKYFeedListCellDelegate <NSObject>

@optional
- (void)skyFeedListCellView:(SKYFeedListCell *)cell clickWithItemModel:(SKYFeedItemModel *)itemModel;

@end

NS_ASSUME_NONNULL_END
