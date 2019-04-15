//
//  SKYStyle.m
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import "SKYStyle.h"

@implementation SKYStyle

#pragma mark - UIFont

+ (UIFont *)fontHuge {
    return [UIFont systemFontOfSize:18];
}

+ (UIFont *)fontBig {
    return [UIFont systemFontOfSize:16];
}

+ (UIFont *)fontNormal {
    return [UIFont systemFontOfSize:14];
}

+ (UIFont *)fontSmall {
    return [UIFont systemFontOfSize:12];
}

#pragma mark - UIColor

+ (UIColor *)colorGrayLight {
    return [UIColor colorWithHexString:@"cccccc"];
}

+ (UIColor *)colorGrayDark {
    return [UIColor colorWithHexString:@"666666"];
}

+ (UIColor *)colorOrangeLight {
    return [UIColor colorWithHexString:@"ff9933"];
}

#pragma mark - CGFloat

+ (CGFloat)floatMarginMassive {
    return 20;
}

+ (CGFloat)floatMarginNormal {
    return 10;
}

+ (CGFloat)floatMarginMinor {
    return 5;
}

+ (CGFloat)floatTextIntervalHorizontal {
    return 8;
}

+ (CGFloat)floatTextIntervalVertical {
    return 10;
}

+ (CGFloat)floatIconNormal {
    return 30;
}

+ (CGFloat)floatCompatibleWithStyleName:(NSString *)styleName {
    return 0;
}

@end
