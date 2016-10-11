//
//  LQPatternViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/11.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQPatternViewController.h"
#import "LQRACMainViewController.h"
#import "LQGoodsViewController.h"
#import "LQCopyViewController.h"
#import "LQBuilderViewController.h"

@interface LQPatternViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *functionTableView;
@property (strong, nonatomic) NSArray *functionDataArr;
@end

@implementation LQPatternViewController

#pragma mark - viewController lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigation];
    [self initUI];
    [self update];

    //    [self tableView:self.functionTableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:self.functionDataArr.count-1 inSection:0]];
}

#pragma mark - tableView delegate
//设置row的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.functionDataArr.count;
}
//设置cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *PickViewCell=@"PickViewCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:PickViewCell];
    if (cell==nil) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:PickViewCell];
    }
    cell.textLabel.text = self.functionDataArr[indexPath.row];
    return cell;
}
//设置cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIViewController * vc ;
    switch (indexPath.row) {
        case 0:
            vc = [[LQRACMainViewController alloc]init];
            break;
        case 1:
            vc = [[LQGoodsViewController alloc]init];
            break;
        case 2:
            vc = [[LQCopyViewController alloc]init];
            break;
        case 3:
            vc = [[LQBuilderViewController alloc]init];
        default:
            break;
    }
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 更新数据
-(void)update{
    self.functionDataArr = @[@"RAC",@"MVVM",@"原型模式与Copy",@"建造者（生成器）模式"];
    [self.functionTableView reloadData];
}

#pragma mark - 定制导航栏


#pragma mark - 创建UI
-(void)initUI{
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
