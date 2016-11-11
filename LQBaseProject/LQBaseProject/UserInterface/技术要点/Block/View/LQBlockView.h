//
//  LQBlockView.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/24.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RedBtnBlock)();

@interface LQBlockView : UIView

@property (nonatomic) RedBtnBlock redBtnBlock;
@property (nonatomic,copy) RedBtnBlock redBtnBlock2;
@property (nonatomic) void(^success)(NSString * ,NSString *);

@end
