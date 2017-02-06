//
//  CommandQueue.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/17.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseModel.h"
#import "LQAbstractCommand.h"

@interface LQCommandQueue : BaseModel

- (void)addCommand:(LQAbstractCommand *)command;

- (void)execute;

@end
