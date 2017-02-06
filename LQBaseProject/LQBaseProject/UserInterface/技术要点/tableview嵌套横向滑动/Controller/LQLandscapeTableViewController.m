//
//  LQLandscapeTableViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/11/4.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQLandscapeTableViewController.h"

@interface LQLandscapeTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *myTableView;
@end

@implementation LQLandscapeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    // Do any additional setup after loading the view.
}

//创建tableView
- (void)createTableView
{
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0 , self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource =self;

    self.myTableView.backgroundColor=[UIColor clearColor];
    self.myTableView.tableFooterView = [self createFooterView];
    [self.view addSubview:self.myTableView];
}

//设置row的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
//设置cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *PickViewCell=@"PickViewCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:PickViewCell];
    if (cell==nil) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:PickViewCell];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
//设置cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UIView *)createFooterView{
    
    UIView * v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 300)];
    
    UIScrollView * sv = [[UIScrollView alloc]initWithFrame:v.frame];
    
    
    sv.backgroundColor = [UIColor redColor];
    sv.contentSize = CGSizeMake(ScreenWidth*2, 300);
    sv.pagingEnabled = YES;
    [v addSubview:sv];
    
    for (int i = 0; i < 2; i++) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake( ScreenWidth * i,0, ScreenWidth, 100)];
        label.text = [NSString stringWithFormat:@"%d",i];
        label.textColor = [UIColor whiteColor];
        [sv addSubview:label];
    }
    
    return v;
}



@end
