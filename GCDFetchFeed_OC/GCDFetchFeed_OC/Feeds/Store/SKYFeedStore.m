//
//  SKYFeedStore.m
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import <Ono/Ono.h>

#import "SKYFeedStore.h"

@implementation SKYFeedStore

#pragma mark - Public Methods

- (SKYFeedModel *)updateFeedModelWithData:(NSData *)feedData preModel:(SKYFeedModel *)preModel {
    ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithData:feedData error:nil];
    SKYFeedModel *feedModel = [[SKYFeedModel alloc] init];
    feedModel.feedUrl = preModel.feedUrl;
    for (ONOXMLElement *element in document.rootElement.children) {
        if ([element.tag isEqualToString:@"channel"]) {
            NSMutableArray *itemArray = [NSMutableArray array];
            for (ONOXMLElement *channelChild in element.children) {
                if ([self isEqualToWithDoNotCareLowcaseString:channelChild.tag compareString:@"title"]) {
                    feedModel.title = channelChild.stringValue;
                }
                if ([self isEqualToWithDoNotCareLowcaseString:channelChild.tag compareString:@"link"]) {
                    feedModel.link = channelChild.stringValue;
                }
                if ([self isEqualToWithDoNotCareLowcaseString:channelChild.tag compareString:@"description"]) {
                    feedModel.des = channelChild.stringValue;
                }
                if ([self isEqualToWithDoNotCareLowcaseString:channelChild.tag compareString:@"copytight"]) {
                    feedModel.copyright = channelChild.stringValue;
                }
                if ([self isEqualToWithDoNotCareLowcaseString:channelChild.tag compareString:@"generator"]) {
                    feedModel.generator = channelChild.stringValue;
                }
                if ([self isEqualToWithDoNotCareLowcaseString:channelChild.tag compareString:@"image"]) {
                    for (ONOXMLElement *channelImage in channelChild.children) {
                        if ([self isEqualToWithDoNotCareLowcaseString:channelImage.tag compareString:@"url"]) {
                            if (channelImage.stringValue.length > 0) {
                                feedModel.imageUrl = channelImage.stringValue;
                            }
                        }
                    }
                }
                if ([self isEqualToWithDoNotCareLowcaseString:channelChild.tag compareString:@"item"]) {
                    SKYFeedItemModel *feedItemModel = [[SKYFeedItemModel alloc] init];
                    for (ONOXMLElement *channelItem in channelChild.children) {
                        if ([self isEqualToWithDoNotCareLowcaseString:channelItem.tag compareString:@"link"]) {
                            feedItemModel.link = channelChild.stringValue;
                        }
                        if ([self isEqualToWithDoNotCareLowcaseString:channelItem.tag compareString:@"title"]) {
                            feedItemModel.title = channelChild.stringValue;
                        }
                        if ([self isEqualToWithDoNotCareLowcaseString:channelItem.tag compareString:@"author"]) {
                            feedItemModel.title = channelChild.stringValue;
                        }
                        if ([self isEqualToWithDoNotCareLowcaseString:channelItem.tag compareString:@"category"]) {
                            feedItemModel.title = channelChild.stringValue;
                        }
                        if ([self isEqualToWithDoNotCareLowcaseString:channelItem.tag compareString:@"pubdate"]) {
                            feedItemModel.title = channelChild.stringValue;
                        }
                        if ([self isEqualToWithDoNotCareLowcaseString:channelItem.tag compareString:@"description"]) {
                            feedItemModel.des = channelChild.stringValue;
                        }
                    }
                    [itemArray addObject:feedItemModel];
                }
                if (feedModel.imageUrl.length > 0) {
                    
                } else {
                    feedModel.imageUrl = preModel.imageUrl;
                }
            }
            feedModel.items = [NSArray arrayWithArray:itemArray];
        }
    }
    return feedModel;
}

#pragma mark - Private Methods

- (BOOL)isEqualToWithDoNotCareLowcaseString:(NSString *)string compareString:(NSString *)compareString {
    if ([string.lowercaseString isEqualToString:compareString.lowercaseString]) {
        return YES;
    }
    return NO;
}

@end
