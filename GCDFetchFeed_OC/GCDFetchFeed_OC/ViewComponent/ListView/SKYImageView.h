//
//  SKYImageView.h
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SKYImageViewDelegate;

@interface SKYImageView : UIView

@property (nonatomic, weak) id <SKYImageViewDelegate> delegate;
@property (nonatomic, strong) UIImageView *imageView;

// 初始化
- (instancetype)initWithImage:(UIImage *)image;
- (instancetype)initWithImageView:(UIImageView *)imageView;
- (instancetype)initWithImageWebUrl:(NSString *)webUrl;
- (instancetype)initWithImageWebUrl:(NSString *)webUrl placeholderImage:(UIImage *)placeHolderImage;

// 更新
- (void)updateWithImage:(UIImage *)image;
- (void)updateWithImageView:(UIImageView *)imageView;
- (void)updateWithImageWebUrl:(NSString *)webUrl;
- (void)updateWithImageWebUrl:(NSString *)webUrl placeholderImage:(UIImage *)placeholderImage;

@end

@protocol SKYImageViewDelegate <NSObject>

@optional
- (void)whenImageViewClicked:(SKYImageView *)imageView;

@end

NS_ASSUME_NONNULL_END
