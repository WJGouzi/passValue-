//
//  ViewController.m
//  传值
//
//  Created by gouzi on 2017/3/27.
//  Copyright © 2017年 王钧. All rights reserved.
//

#import "ViewController.h"
#import "wjDelegateFirstVC.h"
#import "wjBlockFirstVC.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

/** dataArray*/
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"传值";
    UITableView *tabelView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tabelView.delegate = self;
    tabelView.dataSource = self;
    [self.view addSubview:tabelView];
    
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray array];
        _dataArray = @[@"代理传值", @"block传值", @"属性传值"];
    }
    return _dataArray;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%ld", self.dataArray.count);
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        wjDelegateFirstVC *first = [[wjDelegateFirstVC alloc] init];
        [self.navigationController pushViewController:first animated:YES];
    }
    if (indexPath.row == 1) {
        wjBlockFirstVC *first = [[wjBlockFirstVC alloc] init];
        [self.navigationController pushViewController:first animated:YES];
    }
}




@end
