//
//  LQSecondBlockViewController.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/24.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseViewController.h"

@interface LQSecondBlockViewController : BaseViewController

@property (copy, nonatomic) void (^tfBlock)(UITextField *textField);

@end
