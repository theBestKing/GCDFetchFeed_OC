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
#import "NSDate+InternetDateTime.h"
#import "SKYFeedListCellViewModel.h"
#import "SKYFeedListViewController.h"

static NSString * const feedListViewControllerCellIdentifier = @"SKYFeedListViewControllerCell";

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

- (instancetype)initWithFeedModel:(SKYFeedModel *)feedModel {
    self = [super init];
    if (self) {
        self.feedModel = feedModel;
        if (self.feedModel.items.count > 0) {
            self.listData = [NSMutableArray arrayWithArray:feedModel.items];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

#pragma mark - initUI

- (void)initUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.feedModel.title;
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

#pragma mark - Layout Subviews

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self layoutSubviews];
}

- (void)layoutSubviews {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideTop);
        make.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    SKYFeedItemModel *itemModel = self.listData[indexPath.row];
    SKYFeedListCellViewModel *viewModel = [[SKYFeedListCellViewModel alloc] init];
    viewModel.titleString = itemModel.title;
    return viewModel.cellHeight;
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:feedListViewControllerCellIdentifier];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    SKYFeedListCell *v = (SKYFeedListCell *)[cell viewWithTag:123421];
    if (!v) {
        v = [[SKYFeedListCell alloc] init];
        v.tag = 123421;
        [cell.contentView addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(cell.contentView);
        }];
    }
    
    SKYFeedItemModel *itemModel = self.listData[indexPath.row];
    SKYFeedListCellViewModel *viewModel = [[SKYFeedListCellViewModel alloc] init];
    viewModel.titleString = itemModel.title;
    NSDate *date = [NSDate dateFromInternetDateTimeString:itemModel.pubDate formatHint:DateFormatHintRFC822];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd"];
    NSString *authorString = @"";
    if (itemModel.author.length > 0) {
        authorString = itemModel.author;
    }
    NSString *categoryString = @"";
    if (itemModel.category.length > 0) {
        categoryString = [NSString stringWithFormat:@"[%@]", itemModel.category];
    }
    viewModel.contentString = [NSString stringWithFormat:@"%@ %@ %@", [dateFormatter stringFromDate:date], categoryString, authorString];
    viewModel.itemModel = itemModel;
    [v updateWithViewModel:viewModel];
    
    return cell;
}

#pragma mark - Setter and Getter

- (NSMutableArray *)listData {
    if (!_listData) {
        _listData = [NSMutableArray array];
    }
    return _listData;
}

@end
