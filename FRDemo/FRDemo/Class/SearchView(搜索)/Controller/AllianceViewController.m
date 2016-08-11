//
//  AllianceViewController.m
//  sugeOnlineMart
//
//  Created by 1860 on 16/7/4.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//

#import "AllianceViewController.h"
#import "PositionBtn.h"
#import "SearchViewController.h"

@interface AllianceViewController ()<UITextFieldDelegate>

/** 定位按钮  */
@property (nonatomic, weak) UIButton *positionBtn;

@end

@implementation AllianceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavigationItem];
}

- (void)viewWillAppear:(BOOL)animated {
    
    // 导航栏颜色
    self.navigationController.navigationBar.barTintColor = kSubjectColor;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    // 导航栏颜色
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (void)addNavigationItem {
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]init];
    //搜索
    CGRect searchTextFieldF = CGRectMake(0, 0, kScreenWidth - 120, 30);
    UITextField *searchTextField = [[UITextField alloc] initWithFrame:searchTextFieldF];
    searchTextField.backgroundColor = [UIColor whiteColor];
    UIImageView *fieldLeftView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    fieldLeftView.image = [UIImage imageNamed:@"搜索"];
    searchTextField.leftView = fieldLeftView;
    searchTextField.leftViewMode = UITextFieldViewModeAlways;//一直显示
    
    searchTextField.font = kFontSize(14);
    searchTextField.placeholder = @"请输入商家名或分类";
    searchTextField.delegate = self;
    [searchTextField.layer setMasksToBounds:YES];
    searchTextField.layer.cornerRadius = 15;
    self.navigationItem.titleView = searchTextField;
    
    PositionBtn *positionBtn = [[PositionBtn alloc]initWithFrame:CGRectMake(0, 0, 56, 30)];
    positionBtn.titleLabel.font = kFontSize(14);
    positionBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [positionBtn setTitle:@"北京市" forState:UIControlStateNormal];
    [positionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [positionBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [positionBtn setImage:[UIImage imageNamed:@"下拉箭头"] forState:UIControlStateNormal];
    _positionBtn = positionBtn;
    
    [positionBtn addTarget:self action:@selector(positionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *matginView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 1, 20)];
    
    UIBarButtonItem *positionItem = [[UIBarButtonItem alloc]initWithCustomView:positionBtn];
    UIBarButtonItem *marginItem = [[UIBarButtonItem alloc]initWithCustomView:matginView];
    
    self.navigationItem.rightBarButtonItems = @[positionItem,marginItem];
}

/**
 *  点击右上方定位按钮
 */
- (void)positionBtnAction:(UIButton *)button {
    
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [textField resignFirstResponder];
    NSLog(@"跳转到搜索页面");
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
}

@end
