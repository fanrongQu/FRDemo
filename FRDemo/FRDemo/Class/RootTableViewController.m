//
//  RootTableViewController.m
//  FRDemo
//
//  Created by 1860 on 16/8/5.
//  Copyright © 2016年 QuFanrong. All rights reserved.
//

#import "RootTableViewController.h"
#import "PersonalIconViewController.h"
#import "AllianceViewController.h"
#import "SVProgressHUDViewController.h"

@interface RootTableViewController ()

/**  分类数组  */
@property (nonatomic, strong) NSArray *typeArray;

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.typeArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"typeTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.typeArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    switch (row) {
        case 0: {//头像
            PersonalIconViewController *personalIconVC = [[PersonalIconViewController alloc]init];
            [self.navigationController pushViewController:personalIconVC animated:YES];
        }
            break;
        case 1: {
            AllianceViewController *allianceViewController = [[AllianceViewController alloc]init];
            [self.navigationController pushViewController:allianceViewController animated:YES];
        }
            break;
        case 2: {
            SVProgressHUDViewController *progressHUDViewController = [[SVProgressHUDViewController alloc]initWithNibName:@"SVProgressHUDViewController" bundle:nil];
            [self.navigationController pushViewController:progressHUDViewController animated:YES];
        }
            break;
        case 3: {
            
        }
            break;
        default:
            break;
    }
}


#pragma mark - 懒加载
- (NSArray *)typeArray {
    if (!_typeArray) {
        _typeArray = @[@"上传头像",@"搜索",@"SVProgressHUD"];
    }
    return _typeArray;
}

@end
