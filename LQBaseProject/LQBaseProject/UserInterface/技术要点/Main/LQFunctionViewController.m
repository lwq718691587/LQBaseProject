//
//  LQFunctionViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/25.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQFunctionViewController.h"
#import "LQMultithreading_NSThreadViewController.h"
#import "LQMultithreading_NSOperationViewController.h"
#import "LQMultithreading_GCDViewController.h"
#import "LQCountViewController.h"
#import "LQScreenViewController.h"

#import "LQRunTimeViewController.h"
#import "LQKVOViewController.h"
#import "LQlgorithmViewController.h"
#import "LQObjectViewController.h"

#import "LQKVC_KVOViewController.h"
#import "LQCGContextRefViewController.h"
#import "LQGetLableHeightViewController.h"

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
            vc = [[LQMultithreading_NSThreadViewController alloc]init];
            break;
        case 1:
            vc = [[LQMultithreading_NSOperationViewController alloc]init];
            break;
        case 2:
            vc = [[LQMultithreading_GCDViewController alloc]init];
            break;
        case 3:
            vc = [[LQScreenViewController alloc]init];
            break;
        case 4:
            vc = [[LQCountViewController alloc]init];
            break;
        case 5:
            vc = [[LQRunTimeViewController alloc]init];
            break;
        case 6:
            vc = [[LQKVOViewController alloc]init];
            break;
        case 7:
            vc = [[LQlgorithmViewController alloc]init];
            break;
        case 8:
            vc = [[LQObjectViewController alloc]init];
            break;
        case 9:
            vc = [[LQKVC_KVOViewController alloc]init];
            break;    
        case 10:
            vc = [[LQCGContextRefViewController alloc]init];
            break;
        case 11:
            vc = [[LQGetLableHeightViewController alloc]init];
            break;
        default:
            break;
    }
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 更新数据
-(void)update{
    self.functionDataArr = @[@"多线程-NSThread",@"多线程-NSOperation",@"多线程-GCD",@"屏幕旋转",@"block内的self",@"runtime",@"KVO",@"简单的算法",@"面向对象",@"KVC&KVO",@"CGContextRef",@"计算label的高度",@"RAC",@"MVVM",@"原型模式与Copy",@"建造者（生成器）模式"];
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
