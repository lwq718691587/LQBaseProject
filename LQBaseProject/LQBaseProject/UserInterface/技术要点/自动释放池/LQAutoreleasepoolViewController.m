//
//  LQAutoreleasepoolViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/11/8.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQAutoreleasepoolViewController.h"



@interface LQAutoreleasepoolViewController ()

@property (strong, nonatomic) NSThread *therad;
@property (nonatomic) int(^success)(NSString *s);
@end

@implementation LQAutoreleasepoolViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
     
    
    [self myblock:^int(NSString *s) {
        return 10;
    }];
    
    
    // Do any additional setup after loading the view.
}

- (void)myblock:(int(^)(NSString * s))complete{
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    int lagerNum = 1024 * 1024 * 2 ;
//    for(int i = 0 ; i < lagerNum; i++)
//    {
//        @autoreleasepool{
//            NSString *str = [NSString stringWithFormat:@"Hello"];
//            str = [str uppercaseString];
//            str = [str stringByAppendingFormat:@"-%@",@"World!"];
//            NSLog(@"%p",str);
//        }
//    
//    }
    
//    [self performSelectorInBackground:@selector(dothing) withObject:nil];
//    self.therad = [[NSThread alloc]initWithTarget:self selector:@selector(dothing) object:nil];
//    [self.therad start];
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//    
//        @autoreleasepool{
//            for(int i = 0 ; i < 1024 * 100; i++)
//            {
//                NSString *str = [NSString stringWithFormat:@"Hello"];
//                str = [str uppercaseString];
//                str = [str stringByAppendingFormat:@"-%@",@"World!"];
//                NSLog(@"%p",str);
//            }
//        }
//    });
    {
        NSString * __weak s = [[NSString alloc]init];
    }
    
}

- (void)dothing{
    for(int i = 0 ; i < 1024 * 100; i++)
    {
        if ([self.therad isCancelled]) {
            [NSThread exit];
        }
        NSString *str = [NSString stringWithFormat:@"Hello"];
        str = [str uppercaseString];
        str = [str stringByAppendingFormat:@"-%@",@"World!"];
        NSLog(@"%p",str);
    }
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.therad cancel];

}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];

}

- (void)dealloc{
   NSLog(@"%s",__func__);
}

@end
