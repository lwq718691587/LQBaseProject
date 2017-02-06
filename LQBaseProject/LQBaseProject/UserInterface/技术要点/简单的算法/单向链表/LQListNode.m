//
//  LQListNode.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/21.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQListNode.h"

@interface LQListNode ()



@end

@implementation LQListNode


- (void)addItem:(id )item{
    if (self.headNode == nil) {
        self.headNode = [LQNode nodeWithItem:item];
    }else{
        [self addItem:item node:self.headNode];
    }
}

- (void)addItem:(id)item node:(LQNode *)node{
    
    if (node.nextNode == nil) {
        node.nextNode = [LQNode nodeWithItem:item];
    }else{
        [self addItem:item node:node.nextNode];
    }
    
}

@end
