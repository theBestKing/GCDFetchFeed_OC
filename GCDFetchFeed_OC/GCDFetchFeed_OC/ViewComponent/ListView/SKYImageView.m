//
//  SKYImageView.m
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "SKYImageView.h"

@interface SKYImageView ()

@property (nonatomic, strong) UIButton *clickButton;

@end

@implementation SKYImageView

#pragma mark - Life Cycle

- (instancetype)initWithImage:(UIImage *)image {
    self = [super init];
    if (self) {
        [self creatSubviews];
        [self updateWithImage:image];
    }
    return self;
}

- (instancetype)initWithImageView:(UIImageView *)imageView {
    self = [super init];
    if (self) {
        [self creatSubviews];
        [self updateWithImageView:imageView];
    }
    return self;
}

- (instancetype)initWithImageWebUrl:(NSString *)webUrl {
    self = [super init];
    if (self) {
        [self creatSubviews];
        [self updateWithImageWebUrl:webUrl];
    }
    return self;
}

- (instancetype)initWithImageWebUrl:(NSString *)webUrl placeholderImage:(UIImage *)placeHolderImage {
    self = [super init];
    if (self) {
        [self creatSubviews];
        [self updateWithImageWebUrl:webUrl placeholderImage:placeHolderImage];
    }
    return self;
}

- (void)creatSubviews {
    [self addSubview:self.imageView];
    [self addSubview:self.clickButton];
}

#pragma mark - Layout Subviews

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - Event Response

- (void)clickButtonDidTapped:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(whenImageViewClicked:)]) {
        [self.delegate whenImageViewClicked:self];
    }
}

#pragma mark - Public Methods

- (void)updateWithImage:(UIImage *)image {
    [self.imageView setImage:image];
}

- (void)updateWithImageView:(UIImageView *)imageView {
    self.imageView = imageView;
}

- (void)updateWithImageWebUrl:(NSString *)webUrl {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:webUrl]];
}

- (void)updateWithImageWebUrl:(NSString *)webUrl placeholderImage:(UIImage *)placeholderImage {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:webUrl] placeholderImage:placeholderImage];
}

#pragma mark - Setter and Getter

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (UIButton *)clickButton {
    if (!_clickButton) {
        _clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_clickButton addTarget:self action:@selector(clickButtonDidTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clickButton;
}
@end
