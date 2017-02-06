//
//  CommandQueue.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/17.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQCommandQueue.h"

@interface LQCommandQueue ()
@property (strong, nonatomic) NSMutableArray *commandQueue;
@end

@implementation LQCommandQueue

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.commandQueue = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)addCommand:(LQAbstractCommand *)command{
    [self.commandQueue addObject:command];
}

- (void)execute{
    for (LQAbstractCommand * command in self.commandQueue) {
        [command execute];
    }
}

@end
