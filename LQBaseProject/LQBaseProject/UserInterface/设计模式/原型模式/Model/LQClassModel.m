//
//  LQClassMOdel.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/10.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQClassModel.h"

@implementation LQClassModel

-(id)copyWithZone:(NSZone *)zone{
    LQClassModel * newModel = [[LQClassModel allocWithZone:zone]init];
    newModel.classAdress = [_classAdress copy];
    newModel.className = [_className copy];
    newModel.classStudentsNumber = [_classStudentsNumber copy];
    return newModel;
}


-(id)mutableCopyWithZone:(NSZone *)zone{
    LQClassModel * newModel = [[LQClassModel allocWithZone:zone]init];
    newModel.classAdress = [_classAdress mutableCopy];
    newModel.className = [_className mutableCopy];
    newModel.classStudentsNumber = [_classStudentsNumber mutableCopy];
    return newModel;
}




@end
