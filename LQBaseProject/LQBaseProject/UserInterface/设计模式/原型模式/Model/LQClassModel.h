//
//  LQClassMOdel.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/10.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseModel.h"

@interface LQClassModel : BaseModel<NSCopying,NSMutableCopying>

@property (copy, nonatomic) NSString *className;
@property (copy, nonatomic) NSString *classAdress;
@property (copy, nonatomic) NSString *classStudentsNumber;





@end
