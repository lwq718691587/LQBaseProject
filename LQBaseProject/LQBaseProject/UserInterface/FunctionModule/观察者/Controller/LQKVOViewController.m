//
//  LQKVOViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/1.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQKVOViewController.h"
#import "LQKVOModel.h"

@interface LQKVOViewController ()
@property (strong, nonatomic) UILabel *myLabel;
@property (strong, nonatomic) UIButton *btn;
@property (strong, nonatomic) LQKVOModel *kvoModel;
@end

@implementation LQKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.kvoModel = [[LQKVOModel alloc]init];
    [self.kvoModel setValue:@"searph" forKey:@"stockName"];
    [self.kvoModel setValue:@"10.0" forKey:@"price"];
    [self.kvoModel addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, 100, 100)];
    [btn addTarget:self action:@selector(btnFun:) forControlEvents:UIControlEventTouchDown];
    btn.backgroundColor = FlatBlue;
    [self.view addSubview:btn];
    
    self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 30 )];
    self.myLabel.textColor = [UIColor redColor];
    self.myLabel.text = [NSString stringWithFormat:@"%f",self.kvoModel.price];
    [self.view addSubview:self.myLabel];
    

    // Do any additional setup after loading the view.
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.kvoModel removeObserver:self forKeyPath:@"price"];
}
-(void)btnFun:(UIButton *)btn{
    btn.selected = !btn.selected;
    self.kvoModel.price = 12;
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"price"]) {
        self.myLabel.text = [NSString stringWithFormat:@"%f",self.kvoModel.price];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
