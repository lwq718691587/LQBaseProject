//
//  LQBlockView.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/24.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQBlockView.h"
#import "LQMacro.h"
@implementation LQBlockView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}
-(void)createView{
    UIButton * redbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
    [redbtn setBackgroundColor:[UIColor redColor]];
    [self addSubview:redbtn];
    [redbtn addTarget:self action:@selector(redbtnFun) forControlEvents:UIControlEventTouchDown];
}
-(void)redbtnFun{
    if (self.redBtnBlock2) {
        self.redBtnBlock2();
    }
    
    if (self.success) {
        self.success(@"a",@"b");
    }
}


@end
