//
//  LQPenModel.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/11.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseModel.h"
#import "LQAbstractPenColorModel.h"
@interface LQAbstractPenModel : BaseModel

@property (strong, nonatomic) LQAbstractPenColorModel *pencolor;

- (void)usePenDrawLine:(NSString*)thing;

@end
