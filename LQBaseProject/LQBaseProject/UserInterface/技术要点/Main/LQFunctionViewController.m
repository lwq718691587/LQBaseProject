//
//  LQFunctionViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/25.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQFunctionViewController.h"
#import "LQFunction.h"
@interface LQFunctionViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *functionTableView;
@property (strong, nonatomic) NSArray *functionDataArr;
@end

@implementation LQFunctionViewController

#pragma mark - viewController lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigation];
    [self initUI];
    [self update];
    
    [self tableView:self.functionTableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:self.functionDataArr.count-1 inSection:0]];
    
    
}

#pragma mark - tableView delegate
//设置row的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.functionDataArr.count;
}
//设置cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *PickViewCell=@"PickViewCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:PickViewCell];
    if (cell==nil) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:PickViewCell];
    }
    cell.textLabel.text = self.functionDataArr[indexPath.row];
    return cell;
}
//设置cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

//cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[LQFunction getVCofIndex:indexPath.row] animated:YES];
}

#pragma mark - 更新数据
- (void)update{
    self.functionDataArr = [LQFunction getVcDataArr];
    [self.functionTableView reloadData];
}

#pragma mark - 定制导航栏


#pragma mark - 创建UI
- (void)initUI{
    self.functionTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.functionTableView.delegate = self;
    self.functionTableView.dataSource =self;
    self.functionTableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.functionTableView];
    
    //frame
    self.functionTableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - NavigationBarHeight - TabBarHeight);
}
#pragma mark - getter & setter



@end
