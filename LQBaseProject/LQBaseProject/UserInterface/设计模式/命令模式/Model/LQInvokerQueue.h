//
//  LQInvokerQueue.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/17.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseModel.h"
#import "LQCommandQueue.h"
@interface LQInvokerQueue : BaseModel

@property (strong, nonatomic) LQCommandQueue *commandQueue;

-(void)call;

@end
