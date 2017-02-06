//
//  LQKeychainViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/12/21.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQKeychainViewController.h"
#import "LQPasswordTool.h"



@interface LQKeychainViewController ()


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@property (strong, nonatomic) NSArray *arr;

@property (copy, nonatomic) NSArray *arr1;

@end

@implementation LQKeychainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.numberOfLines = 0;
    [self.titleLabel setAdjustsFontSizeToFitWidth:YES];
    
  
    
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"张三",@"李四",@"王五",@"赵六", nil];
    NSLog(@"%@",dic);
    

    
    NSMutableArray * mArr = [NSMutableArray arrayWithArray:@[@"1",@"2"]] ;
    self.arr = mArr;
    self.arr1 = mArr;
    NSLog(@"%p",mArr);
    NSLog(@"%p,%p",self.arr,self.arr1);
    
    [mArr addObject:@"3"];
    
    NSLog(@"%p,%p",self.arr,self.arr1);
    
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)saveBtnFun:(id)sender {
    [LQPasswordTool saveUserName:@"哇哈12jjk" passWord:@{@"loginFrome":@"qq",@"id":@"1233422"}];
}
- (IBAction)readBtnFun:(id)sender {
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@--%@",[LQPasswordTool readUserName],[LQPasswordTool readPassWord]];
}



@end
