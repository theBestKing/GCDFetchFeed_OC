//
//  SKYFeedListCellViewModel.m
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/17.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import "SKYStyle.h"
#import "SKYFeedListCellViewModel.h"

@implementation SKYFeedListCellViewModel

- (void)setTitleString:(NSString *)titleString {
    _titleString = titleString;
    CGRect frame = [titleString boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 2 * [SKYStyle floatMarginMassive], 999) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:@{ NSAttachmentAttributeName : [SKYStyle fontHuge] } context:nil];
    _cellHeight = 70 + (frame.size.height - 18);
}

@end
