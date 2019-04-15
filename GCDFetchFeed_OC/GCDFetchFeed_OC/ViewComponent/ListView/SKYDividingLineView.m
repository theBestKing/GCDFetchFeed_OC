//
//  SKYDividingLineView.m
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import "SKYDividingLineView.h"

@implementation SKYDividingLineView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [SKYStyle colorGrayLight];
    }
    return self;
}

+ (CGFloat)defaultSize {
    return 0.5;
}

@end
