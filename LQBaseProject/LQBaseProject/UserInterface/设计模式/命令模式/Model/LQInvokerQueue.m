//
//  LQInvokerQueue.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/17.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQInvokerQueue.h"

@implementation LQInvokerQueue

-(void)call{
    [self.commandQueue execute];
}

@end
