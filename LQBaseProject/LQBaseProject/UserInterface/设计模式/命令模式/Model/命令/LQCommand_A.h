//
//  LQCommand_A.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/17.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQAbstractCommand.h"
#import "LQCommandAReciver.h"

@interface LQCommand_A : LQAbstractCommand

@property (strong, nonatomic) LQCommandAReciver *reciver;


@end
