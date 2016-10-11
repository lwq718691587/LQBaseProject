//
//  UIImage+LogImageName.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/6.
//  Copyright © 2016年 刘伟强. All rights reserved.


//

#import "UIImage+LogImageName.h"
#import <objc/runtime.h>

@implementation UIImage (LogImageName)

+(void)load{
    
    Method imageName = class_getClassMethod(self, @selector(imageNamed:));
    
    Method imageName_log = class_getClassMethod(self, @selector(imageName_log:));
    
    method_exchangeImplementations(imageName_log, imageName);
    
}


+(instancetype)imageName_log:(NSString*)name{
    //这里调用 imageName_log 相当于 imageNamed
    UIImage * image = [self imageName_log:name];
    if (image == nil) {
        NSLog(@"***************runTime没有该图片***************");
    }
    return image;
}

@end
