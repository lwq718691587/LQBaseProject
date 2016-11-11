//
//  LQListNode.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/21.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseModel.h"
#import "LQNode.h"
@interface LQListNode : BaseModel

@property (strong, nonatomic) LQNode *headNode;

-(void)addItem:(id )item;

@end
