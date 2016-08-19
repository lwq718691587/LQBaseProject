//
//  ViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/18.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "ViewController.h"
#import "LQMacro.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",LoginUrl(@"1", @"2"));
    self.view.backgroundColor = FlatLime;
    ColorWithAlpha([UIColor redColor], 0.5);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
