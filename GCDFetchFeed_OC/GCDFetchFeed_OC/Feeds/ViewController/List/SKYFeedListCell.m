//
//  SKYFeedListCell.m
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/17.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import "SKYFeedListCell.h"
#import "SKYCellViewImport.h"

@interface SKYFeedListCell ()

@property (nonatomic, strong) SKYTitleLabel *titleLabel;
@property (nonatomic, strong) SKYContentLabel *contentlabel;
@property (nonatomic, strong) SKYFeedItemModel *itemModel;
@property (nonatomic, strong) UIButton *clickButton;

@end

@implementation SKYFeedListCell

#pragma mark - Life Cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self creatSubviews];
    }
    return self;
}

- (instancetype)initWithViewModel:(SKYFeedListCellViewModel *)viewModel {
    self = [super init];
    if (self) {
        [self creatSubviews];
        [self updateWithViewModel:viewModel];
    }
    return self;
}

- (void)creatSubviews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.contentlabel];
    [self addSubview:self.clickButton];
}

#pragma mark - Layout Subviews

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset([SKYStyle floatMarginMassive]);
    }];
    
    [self.contentlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset([SKYStyle floatTextIntervalVertical]);
    }];
}

#pragma mark - Event Response

- (void)clickButtonDidTapped:(UIButton *)sender {
    
}

#pragma mark - Public Methods

- (void)updateWithViewModel:(SKYFeedListCellViewModel *)viewModel {
    self.titleLabel.text = viewModel.titleString;
    self.contentlabel.text = viewModel.contentString;
    self.itemModel = viewModel.itemModel;
}

#pragma mark - Setter and Getter

- (SKYTitleLabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[SKYTitleLabel alloc] init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - [SKYStyle floatMarginMassive] * 2;
        [_titleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _titleLabel;
}

- (SKYContentLabel *)contentlabel {
    if (!_contentlabel) {
        _contentlabel = [[SKYContentLabel alloc] init];
        _contentlabel.textColor = [SKYStyle colorGrayLight];
    }
    return _contentlabel;
}

- (UIButton *)clickButton {
    if (!_clickButton) {
        _clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_clickButton setBackgroundColor:[SKYStyle colorBlackLightAlpha] forState:UIControlStateHighlighted];
        [_clickButton addTarget:self action:@selector(clickButtonDidTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clickButton;
}

@end
