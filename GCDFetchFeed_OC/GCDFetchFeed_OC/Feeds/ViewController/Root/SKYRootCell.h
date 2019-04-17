//
//  SKYRootCell.h
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SKYRootCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SKYRootCellDelegate;

@interface SKYRootCell : UIView

@property (nonatomic, weak) id <SKYRootCellDelegate> delegate;

- (instancetype)initWithViewModel:(SKYRootCellViewModel *)viewModel;
- (void)updateWithViewModel:(SKYRootCellViewModel *)viewModel;

@end

@protocol SKYRootCellDelegate <NSObject>

@optional
- (void)skyRootCellView:(SKYRootCell *)cell clickWithFeedModel:(SKYFeedModel *)feedModel;

@end

NS_ASSUME_NONNULL_END
