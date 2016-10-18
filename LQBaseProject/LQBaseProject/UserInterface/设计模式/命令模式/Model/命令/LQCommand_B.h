//
//  LQCommand_B.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/17.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQAbstractCommand.h"
#import "LQCommandBReciver.h"
@interface LQCommand_B : LQAbstractCommand

@property (strong, nonatomic) LQCommandBReciver *reciver;

@end
