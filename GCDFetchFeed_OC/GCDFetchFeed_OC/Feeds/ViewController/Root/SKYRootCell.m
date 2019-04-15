//
//  SKYRootCell.m
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import "SKYRootCell.h"
#import "SKYCellViewImport.h"

@interface SKYRootCell ()

@property (nonatomic, strong) SKYImageView *iconImageView;
@property (nonatomic, strong) SKYTitleLabel *titleLabel;
@property (nonatomic, strong) SKYContentLabel *contentLabel;
@property (nonatomic, strong) SKYHighlightLabel *highlightLabel;

@end

@implementation SKYRootCell

#pragma mark - Life Cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self creatSubviews];
    }
    return self;
}

- (instancetype)initWithViewModel:(SKYRootCellViewModel *)viewModel {
    self = [super init];
    if (self) {
        [self creatSubviews];
        [self updateWithViewModel:viewModel];
    }
    return self;
}

- (void)creatSubviews {
    [self addSubview:self.iconImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.contentLabel];
    [self addSubview:self.highlightLabel];
}

#pragma mark - Layout Subviews

- (void)layoutSubviews {
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset([SKYStyle floatMarginMassive]);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset([SKYStyle floatMarginNormal]);
        make.top.equalTo(self.iconImageView).offset([SKYStyle floatMarginMinor]);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset([SKYStyle floatTextIntervalVertical]);
    }];
    [self.highlightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-[SKYStyle floatMarginMassive]);
        make.top.equalTo(self.titleLabel).offset([SKYStyle floatMarginMinor]);
    }];
}

#pragma mark - Public Methods

- (void)updateWithViewModel:(SKYRootCellViewModel *)viewModel {
    self.titleLabel.text = viewModel.titleString;
    self.contentLabel.text = viewModel.contentString;
    [self.iconImageView updateWithImageWebUrl:viewModel.iconUrl];
    self.highlightLabel.text = viewModel.highlightString;
}

#pragma mark - Getter and Setter

- (SKYImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[SKYImageView alloc] init];
    }
    return _iconImageView;
}

- (SKYTitleLabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[SKYTitleLabel alloc] init];
    }
    return _titleLabel;
}

- (SKYContentLabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[SKYContentLabel alloc] init];
        _contentLabel.textColor = [SKYStyle colorGrayLight];
    }
    return _contentLabel;
}

- (SKYHighlightLabel *)highlightLabel {
    if (!_highlightLabel) {
        _highlightLabel = [[SKYHighlightLabel alloc] init];
        _highlightLabel.textAlignment = NSTextAlignmentRight;
    }
    return _highlightLabel;
}

@end
