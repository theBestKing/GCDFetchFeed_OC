//
//  SKYSubContentLabel.m
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import "SKYSubContentLabel.h"

@implementation SKYSubContentLabel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.font = [SKYStyle fontSmall];
        self.textColor = [SKYStyle colorGrayLight];
    }
    return self;
}

@end
