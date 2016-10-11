//
//  LQabstractActorBuilder.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/10.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseModel.h"
#import "LQProductModel.h"

@interface LQabstractActorBuilder : BaseModel

@property (strong, nonatomic) LQProductModel *actor;

//钩子方法
@property (nonatomic) BOOL isHaveCostume;

-(void)bulideType;
-(void)bulideSex;
-(void)bulideFace;
-(void)bulideCostume;

-(LQProductModel*)createActor;


//构建产品的组成部分较少可以将到眼泪合并到抽象的builder类中 构建产品的组成部分较多，建议还是将construct()方法单独封装在Director中

//将director 合并到 LQabstractActorBuilder 建造者模式 进阶1
+(LQProductModel *)productConstruct:(LQabstractActorBuilder *)builder;


//将director 合并到 LQabstractActorBuilder 并去掉上面方法的参数 建造者模式 进阶2
-(LQProductModel *)productConstruct;

@end
