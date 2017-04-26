//
//  LQCellViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2017/4/20.
//  Copyright © 2017年 刘伟强. All rights reserved.
//

#import "LQCellViewController.h"
#import "LQAutoHeightTableViewCell.h"
@interface LQCellViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableVIew;
@property (strong, nonatomic) NSArray *dataArr;
@end

@implementation LQCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.dataArr = @[@"就会疯狂就爱好的时刻就会发觉可视电话发货速度复活甲看的是尽快刻就会发觉可视电话发货速度复活甲看的是尽快发货数据库的",@"就会疯狂就爱好的时刻就会发觉可视电话发货速度复活甲看的是尽快发货数据库的",@"就会疯狂就爱好的时刻就会发觉可视电话发货速度复活甲看的是尽快发货数据库的",@"就会疯狂就爱好的时刻就刻就会发觉可视电话发货速度复活甲看的是尽快刻就会发觉可视电话发货速度复活甲看的是尽快会发觉可视电话发货速度复活甲看的是尽快发货数据库的",@"就会疯狂就爱好的时刻就会发觉可视电话发货速度复活甲看的是尽快发货数据库的",@"就会疯狂就爱好的时刻刻就会发觉可视电话发货速度复活甲看的是尽快刻就会发觉可视电话发货速度复活甲看的是尽快刻就会发觉可视电话发货速度复活甲看的是尽快就会发觉可视电话发货速度复活甲看的是尽快发货数据库的"];
    
    self.tableVIew.delegate = self;
    self.tableVIew.dataSource = self;
    self.tableVIew.rowHeight = UITableViewAutomaticDimension;
    self.tableVIew.estimatedRowHeight = 57.5;
    
    // Do any additional setup after loading the view from its nib.
}

//设置row的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
//设置cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *PickViewCell=@"PickViewCell";
    LQAutoHeightTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:PickViewCell];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"LQAutoHeightTableViewCell" owner:self options:nil] lastObject];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    cell.cusTextLabel.text = self.dataArr[indexPath.row];
    return cell;
}

@end
