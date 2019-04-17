//
//  SKYRootViewController.m
//  GCDFetchFeed_OC
//
//  Created by sunjinyang on 2019/4/15.
//  Copyright © 2019 Hangzhou Hikvision Digital Technology Co.,Ltd. All rights reserved.
//

#import <Ono/Ono.h>
#import <Masonry/Masonry.h>

#import "SKYRootCell.h"
#import "SKYFeedStore.h"
#import "SKYNetManager.h"
#import "SKYRootDataSource.h"
#import "SKYNotificationConst.h"
#import "SKYRootViewController.h"
#import "SKYFeedListViewController.h"

static NSString * const rootViewControllerIdentifier = @"SKYRootViewControllerCell";

@interface SKYRootViewController ()
<
SKYRootCellDelegate,
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) NSMutableArray *feeds;
@property (nonatomic, strong) SKYFeedStore *feedStore;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SKYRootDataSource *dataSource;

@end

@implementation SKYRootViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildNotificationObserver];
    [self initUI];
    [self loadData];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

#pragma mark - initUI

- (void)initUI {
    self.title = @"GCDFetchFeed_OC";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

#pragma mark - Load Data

- (void)loadData {
    // 空判断
    if (self.feeds.count <= 0) {
        return;
    }
    
    [[SKYNetManager shareInstance] fetchAllFeedsWithModelArray:self.feeds];
}

#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

#pragma mark - SKYRootCell Delegate

- (void)skyRootCellView:(SKYRootCell *)cell clickWithFeedModel:(SKYFeedModel *)feedModel {
    SKYFeedListViewController *feedListViewController = [[SKYFeedListViewController alloc] initWithFeedModel:feedModel];
    [self.navigationController pushViewController:feedListViewController animated:YES];
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rootViewControllerIdentifier];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    SKYRootCell *rootCell = (SKYRootCell *)[cell viewWithTag:123432];
    if (!rootCell) {
        rootCell = [[SKYRootCell alloc] init];
        rootCell.tag = 123432;
        rootCell.delegate = self;
        [cell.contentView addSubview:rootCell];
        [rootCell mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(cell.contentView);
        }];
    }
    
    SKYFeedModel *model = self.feeds[indexPath.row];
    SKYRootCellViewModel *viewModel = [[SKYRootCellViewModel alloc] init];
    viewModel.titleString = model.title;
    viewModel.contentString = model.des;
    viewModel.iconUrl = model.imageUrl;
    NSUInteger itemsCount = model.items.count;
    viewModel.highlightString = [NSString stringWithFormat:@"%lu条", (unsigned long)itemsCount];
    viewModel.feedModel = model;
    [rootCell updateWithViewModel:viewModel];
    
    return cell;
}

#pragma mark - Private Methods

- (void)buildNotificationObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchOneFeed:) name:NetworkingFetchOneFeedCompleteNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchAllFeeds:) name:NetworkingFetchAllFeedsCompleteNotification object:nil];
}

// 抓完一个 feed
- (void)fetchOneFeed:(NSNotification *)notification {
    NSString *indexString = [notification.userInfo objectForKey:@"index"];
    NSUInteger index = indexString.integerValue;
    self.feeds[index] = [SKYNetManager shareInstance].feeds[index];
    [self.tableView reloadData];
}

// 抓完所有的 feeds
- (void)fetchAllFeeds:(NSNotification *)notification {
    NSLog(@"fetch complete");
}

#pragma mark - Setter and Getter

- (SKYRootDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [[SKYRootDataSource alloc] init];
    }
    return _dataSource;
}

- (SKYFeedStore *)feedStore {
    if (!_feedStore) {
        _feedStore = [[SKYFeedStore alloc] init];
    }
    return _feedStore;
}

- (NSMutableArray *)feeds {
    if (!_feeds) {
        NSMutableArray *mArr = [NSMutableArray array];
        SKYFeedModel *starmingFeed = [[SKYFeedModel alloc] init];
        starmingFeed.title = @"Starming星光社最新更新";
        starmingFeed.feedUrl = @"http://www.starming.com/atom.xml";
        starmingFeed.imageUrl = @"https://github.com/ming1016/GCDFetchFeed/blob/master/GCDFetchFeed/resource/logo_starming.png?raw=true";
        starmingFeed.des = @"戴铭的博客";
        [mArr addObject:starmingFeed];
        
        SKYFeedModel *cnbetaFeed = [[SKYFeedModel alloc] init];
        cnbetaFeed.title = @"cnBeta.COM业界咨询";
        cnbetaFeed.feedUrl = @"http://www.cnbeta.com/backend.php";
        cnbetaFeed.imageUrl = @"https://github.com/ming1016/GCDFetchFeed/blob/master/GCDFetchFeed/resource/logo_cnbeta.jpeg?raw=true";
        [mArr addObject:cnbetaFeed];
        
        SKYFeedModel *dgtleFeed = [[SKYFeedModel alloc] init];
        dgtleFeed.title = @"数字尾巴-分享美好数字生活";
        dgtleFeed.feedUrl = @"http://www.dgtle.com/rss/dgtle.xml";
        dgtleFeed.imageUrl = @"https://github.com/ming1016/GCDFetchFeed/blob/master/GCDFetchFeed/resource/logo_dgtle.jpeg?raw=true";
        [mArr addObject:dgtleFeed];
        
        SKYFeedModel *ifanrFeed = [[SKYFeedModel alloc] init];
        ifanrFeed.title = @"爱范儿";
        ifanrFeed.feedUrl = @"http://www.ifanr.com/feed";
        ifanrFeed.imageUrl = @"https://github.com/ming1016/GCDFetchFeed/blob/master/GCDFetchFeed/resource/logo_ifanr.jpeg?raw=true";
        [mArr addObject:ifanrFeed];
        
        SKYFeedModel *zhihuDaily = [[SKYFeedModel alloc] init];
        zhihuDaily.title = @"知乎每日精选";
        zhihuDaily.feedUrl = @"http://www.zhihu.com/rss";
        zhihuDaily.imageUrl = @"https://github.com/ming1016/GCDFetchFeed/blob/master/GCDFetchFeed/resource/logo_zhihu.png?raw=true";
        [mArr addObject:zhihuDaily];
        
        SKYFeedModel *geekpark = [[SKYFeedModel alloc] init];
        geekpark.title = @"极客公园";
        geekpark.feedUrl = @"http://www.geekpark.net/rss";
        geekpark.imageUrl = @"https://github.com/ming1016/GCDFetchFeed/blob/master/GCDFetchFeed/resource/logo_geekpark.jpeg?raw=true";
        [mArr addObject:geekpark];
        
        _feeds = [NSMutableArray arrayWithArray:mArr];
    }
    return _feeds;
}

@end
