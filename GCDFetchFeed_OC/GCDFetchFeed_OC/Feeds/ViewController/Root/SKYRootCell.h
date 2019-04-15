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

@interface SKYRootCell : UIView

- (instancetype)initWithViewModel:(SKYRootCellViewModel *)viewModel;
- (void)updateWithViewModel:(SKYRootCellViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
