//
//  LQDveloperUtilityViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/12.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQDveloperUtilityViewController.h"
#import "LQDveloperUtilityTableViewCell.h"
#import "LQDeveloperUtilityModel.h"
@interface LQDveloperUtilityViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *developerUtilitytableView;
@property (strong, nonatomic) NSMutableArray<LQDeveloperUtilityModel *> *dataArr;

@end

@implementation LQDveloperUtilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initData];
    [self initUI];
    // Do any additional setup after loading the view.
}

-(void)initNavigation{
    self.title = @"开发工具";
}
-(void)initData{
    self.dataArr = [LQDeveloperUtilityModel getdataArr];
}
-(void)initUI{
    [self.view addSubview:self.developerUtilitytableView];
}

//设置row的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
//设置cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cells = @"LQDveloperUtilityTableView";
    LQDveloperUtilityTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cells];
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LQDveloperUtilityTableViewCell" owner:self options:Nil] lastObject];
    }
    cell.model = self.dataArr[indexPath.row];
    return cell;
}


//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark - geter setter

-(UITableView *)developerUtilitytableView{
    if (!_developerUtilitytableView) {
        _developerUtilitytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0 , self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStylePlain];
        _developerUtilitytableView.delegate = self;
        _developerUtilitytableView.dataSource =self;
        _developerUtilitytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _developerUtilitytableView.backgroundColor=[UIColor clearColor];
        _developerUtilitytableView.rowHeight = 112;
    }
    return _developerUtilitytableView;
}

@end
