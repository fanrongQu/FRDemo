//
//  SearchViewController.m
//  sugeOnlineMart
//
//  Created by 1860 on 16/7/6.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//

/**
 *  搜索历史的plist文件
 */
#define searchHistoryPlist @"searchHistory"

#import "SearchViewController.h"
#import "FRPlist.h"

static NSInteger const edgeDistance = 12;

@interface SearchViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITextField *searchTextField;

@property (nonatomic, strong) NSArray *hotWords;

@property (nonatomic, strong) NSMutableArray *historys;


@property (nonatomic, assign) CGFloat hotWordBtnMaxY;

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation SearchViewController

#pragma mark - 控制器生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kUIColor_RGB(240, 240, 240, 1);
    
    self.navigationItem.titleView = self.searchTextField;
    
    [self setHotSearchWords:self.hotWords];
    [self setSearchHistory:self.historys];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.searchTextField.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.searchTextField becomeFirstResponder];
    
    // 导航栏颜色
    self.navigationController.navigationBar.barTintColor = kSubjectColor;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.searchTextField resignFirstResponder];
    
    // 导航栏颜色
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    self.searchTextField.delegate = nil;
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
}

- (void)dealloc {
    if (_searchTextField != nil) {
        _searchTextField = nil;
    }
    
    if (_tableView != nil) {
        _tableView = nil;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.searchTextField resignFirstResponder];
}

/**
 *  设置热门搜索
 */
- (void)setHotSearchWords:(NSArray *)words {
    
    UILabel *hotLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 70, 100, 36)];
    hotLabel.textColor = [UIColor lightGrayColor];
    hotLabel.font = kFontSize(14);
    hotLabel.text = @"热门搜索";
    [self.view addSubview:hotLabel];
    
    NSInteger count = words.count;
    NSInteger margin = 1;
    NSInteger list = 3;
    
    CGFloat btnX;
    CGFloat btnY;
    CGFloat btnW = (kScreenWidth - edgeDistance * 2 - margin * 2) / list;
    CGFloat btnH = 32;
    CGFloat hotLabelMaxY = CGRectGetMaxY(hotLabel.frame);
    
    for (int n = 0; n < count; n++) {
        btnX = edgeDistance + n % list * (btnW + margin);
        btnY = hotLabelMaxY + n / list * (btnH + margin);
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        btn.titleLabel.font = kFontSize(14);
        [btn setTitle:words[n] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        btn.backgroundColor = [UIColor whiteColor];
        
        btn.tag = n;
        [btn addTarget:self action:@selector(hotWordsClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        if (n == count - 1) {
            _hotWordBtnMaxY = CGRectGetMaxY(btn.frame);
        }
    }
}

#pragma - mark 热门搜索词点击
- (void)hotWordsClick:(UIButton *)button {
    
    [_searchTextField resignFirstResponder];
    NSInteger tag = button.tag;
    NSLog(@"%@",self.hotWords[tag]);
}

/**
 *  设置搜索历史
 */
- (void)setSearchHistory:(NSArray *)historys {
    CGRect tableViewF = CGRectMake(edgeDistance, _hotWordBtnMaxY, kScreenWidth - 2 * edgeDistance, kScreenHeight - _hotWordBtnMaxY);
    self.tableView.frame = tableViewF;
    
    //设置cell分割线从左边开始
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}
/**
 *  清除搜索历史
 */
- (void)clearSearchHistory {
    NSLog_func();
    FRPlist *plist = [[FRPlist alloc]init];
    _historys = [NSMutableArray array];
    [plist removePlistFileWithName:searchHistoryPlist];
    [self.tableView reloadData];
}

#pragma mark - tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = self.historys.count;
    if (count > 0) {
        tableView.hidden = NO;
        return count + 1;
    }else {
        tableView.hidden = YES;
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger row = indexPath.row;
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = kFontSize(14);
    }
    if (row == self.historys.count) {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        CGRect footerViewF = CGRectMake(0, 0, kScreenWidth - 2 * edgeDistance, 44);
        UIButton *clearHistoryBtn = [[UIButton alloc]initWithFrame:footerViewF];
        [clearHistoryBtn setTitle:@"清除搜索记录" forState:UIControlStateNormal];
        [clearHistoryBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        clearHistoryBtn.titleLabel.font = kFontSize(14);
        [clearHistoryBtn addTarget:self action:@selector(clearSearchHistory) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:clearHistoryBtn];
    }else {
        
        cell.textLabel.text = _historys[row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_searchTextField resignFirstResponder];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"搜索历史--%@",_historys[indexPath.row]);
}

#pragma mark - scrollView delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [_searchTextField resignFirstResponder];
}

#pragma mark - textField delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    NSString *text = textField.text;
    if (text.length > 0) {//搜索有内容，根据搜索内容进行操作(数据处理、页面跳转)
        for (NSString *history in self.historys) {
            if ([history isEqualToString:text]) return YES;
        }
        [self.historys addObject:text];
        FRPlist *plist = [[FRPlist alloc]init];
        [plist writeArray:self.historys toPlist:searchHistoryPlist];
        
    }
    
    return YES;
}

#pragma - mark 懒加载
- (UITextField *)searchTextField {
    if (!_searchTextField) {
        CGRect searchTextFieldF = CGRectMake(0, 0, kScreenWidth - 80, 30);
        _searchTextField = [[UITextField alloc] initWithFrame:searchTextFieldF];
        _searchTextField.backgroundColor = [UIColor whiteColor];
        UIImageView *fieldLeftView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        fieldLeftView.image = [UIImage imageNamed:@"搜索"];
        _searchTextField.leftView = fieldLeftView;
        _searchTextField.leftViewMode = UITextFieldViewModeAlways;//一直显示
        _searchTextField.returnKeyType = UIReturnKeySearch;
        
        _searchTextField.font = kFontSize(14);
        _searchTextField.placeholder = @"请输入商家名或分类";
        [_searchTextField.layer setMasksToBounds:YES];
        _searchTextField.layer.cornerRadius = 15;

    }
    return _searchTextField;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.rowHeight = 44;
        [self.view addSubview:_tableView];
        
        CGRect headerViewF = CGRectMake(0, 0, kScreenWidth, 40);
        //headerView
        UILabel *historyLabel = [[UILabel alloc]initWithFrame:headerViewF];
        historyLabel.text = @"历史搜索";
        historyLabel.textColor = [UIColor lightGrayColor];
        historyLabel.font = kFontSize(14);
        self.tableView.tableHeaderView = historyLabel;
        
    }
    return _tableView;
}

- (NSArray *)hotWords {
    if (!_hotWords) {
        _hotWords = @[@"多美奇",@"瑶瑶家",@"李二鲜",@"三色鸽",@"德克士",@"乳果爱",@"汉丽轩",@"锅大侠",@"至尊披萨"];
    }
    return _hotWords;
}

- (NSMutableArray *)historys {
    if (!_historys) {
        FRPlist *plist = [[FRPlist alloc]init];
        _historys = [NSMutableArray arrayWithArray:[plist arrayWithPlistName:searchHistoryPlist]];
//        _historys = @[@"多美奇",@"瑶瑶家",@"李二鲜",@"三色鸽",@"德克士",@"乳果爱",@"汉丽轩",@"锅大侠",@"至尊披萨"];
    }
    return _historys;
}

@end
