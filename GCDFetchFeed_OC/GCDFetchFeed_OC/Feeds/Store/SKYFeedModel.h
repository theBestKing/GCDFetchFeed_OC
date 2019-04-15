//
//  SKYFeedModel.h
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@class SKYFeedItemModel;

@interface SKYFeedModel : JSONModel

@property (nonatomic, copy) NSString<Optional> *title;      /**< 文章标题 */
@property (nonatomic, copy) NSString<Optional> *link;       /**< 文章链接 */
@property (nonatomic, copy) NSString<Optional> *des;        /**< 描述 */
@property (nonatomic, copy) NSString<Optional> *copyright;  /**< 版权 */
@property (nonatomic, copy) NSString<Optional> *generator;  /**< 出版社 */
@property (nonatomic, copy) NSString<Optional> *imageUrl;   /**< icon 图标 */
@property (nonatomic, strong) NSArray *items;               /**< SKYFeedItemModel */
@property (nonatomic, copy) NSString<Optional> *feedUrl;    /**< 博客 feed 的链接 */

@end

@interface SKYFeedItemModel : JSONModel

@property (nonatomic, copy) NSString<Optional> *link;       /**< 文章链接 */
@property (nonatomic, copy) NSString<Optional> *title;      /**< 文章标题 */
@property (nonatomic, copy) NSString<Optional> *author;     /**< 作者 */
@property (nonatomic, copy) NSString<Optional> *category;   /**< 分类 */
@property (nonatomic, copy) NSString<Optional> *pubDate;    /**< 发布日期 */
@property (nonatomic, copy) NSString<Optional> *des;        /**< 描述 */

@end

NS_ASSUME_NONNULL_END
