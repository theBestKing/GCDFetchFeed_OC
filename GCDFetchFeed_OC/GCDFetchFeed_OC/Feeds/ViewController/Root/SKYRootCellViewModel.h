//
//  SKYRootCellViewModel.h
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SKYRootCellViewModel : NSObject

@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, copy) NSString *contentString;
@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *highlightString;

@end

NS_ASSUME_NONNULL_END
