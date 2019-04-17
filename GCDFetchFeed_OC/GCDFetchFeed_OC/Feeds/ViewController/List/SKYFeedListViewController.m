//
//  SKYFeedListViewController.m
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/17.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "SKYFeedStore.h"
#import "SKYFeedListCell.h"
#import "SKYFeedListViewController.h"

@interface SKYFeedListViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) SKYFeedModel *feedModel;
@property (nonatomic, strong) NSMutableArray *listData;
@property (nonatomic, strong) SKYFeedStore *feedStore;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SKYFeedListViewController

#pragma mark - Life Cycle

- (instancetype)initWithModel:(SKYFeedModel *)model {
    self = [super init];
    if (self) {
        self.feedModel = model;
        self.listData = [NSMutableArray arrayWithArray:model.items];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Getter and Setter

- (NSMutableArray *)listData {
    if (!_listData) {
        _listData = [NSMutableArray array];
    }
    return _listData;
}

@end
