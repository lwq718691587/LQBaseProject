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

@end

@implementation LQKeychainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.numberOfLines = 0;
    [self.titleLabel setAdjustsFontSizeToFitWidth:YES];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)saveBtnFun:(id)sender {
    [LQPasswordTool saveUserName:@"哇哈12jjk" passWord:@{@"loginFrome":@"qq",@"id":@"1233422"}];
}
- (IBAction)readBtnFun:(id)sender {
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@--%@",[LQPasswordTool readUserName],[LQPasswordTool readPassWord]];
}



@end
