//
//  SKYStyle.h
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UIColor-Expanded.h"

NS_ASSUME_NONNULL_BEGIN

@interface SKYStyle : NSObject

// UIFont
+ (UIFont *)fontHuge;
+ (UIFont *)fontBig;
+ (UIFont *)fontNormal;
+ (UIFont *)fontSmall;

// UIColor
+ (UIColor *)colorGrayLight;
+ (UIColor *)colorGrayDark;
+ (UIColor *)colorOrangeLight;
+ (UIColor *)colorBlackLightAlpha;

// CGFloat
+ (CGFloat)floatMarginMassive;              /**< 视图间距--大 */
+ (CGFloat)floatMarginNormal;               /**< 视图间距--正常 */
+ (CGFloat)floatMarginMinor;                /**< 视图间距--小 */
+ (CGFloat)floatTextIntervalHorizontal;     /**< 横向字之间的间隔 */
+ (CGFloat)floatTextIntervalVertical;       /**< 纵向字之间的间隔 */
+ (CGFloat)floatIconNormal;
+ (CGFloat)floatCompatibleWithStyleName:(NSString *)styleName;  /**< 兼容不同屏幕得到不同的值 */

@end

NS_ASSUME_NONNULL_END
