//
//  LQNode.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/21.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQNode.h"

@implementation LQNode


+(instancetype)nodeWithItem:(id)item{
    LQNode *node = [[[self class]alloc]init];
    node.item = item;
    return node;
}

@end
