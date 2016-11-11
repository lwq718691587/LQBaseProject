//
//  LQNode.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/21.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseModel.h"

@interface LQNode : BaseModel
//节点挂在的对象
@property (strong, nonatomic) id item;
//只想下一个节点
@property (strong, nonatomic) LQNode *nextNode;


+(LQNode*)nodeWithItem:(id)item;

@end
