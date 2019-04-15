//
//  SKYLabel.m
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import "SKYLabel.h"

@implementation SKYLabel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.font = [SKYStyle fontNormal];
        self.textColor = [SKYStyle colorGrayDark];
    }
    return self;
}

@end
