//
//  LQMultithreading_GCDViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/26.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQMultithreading_GCDViewController.h"

#define IMAGE_COUNT 9

@interface LQMultithreading_GCDViewController ()
@property (strong, nonatomic) NSMutableArray *imageViewsArr;
//
@property (strong, atomic) NSMutableArray *imageNamesArr;
@property (strong, nonatomic) NSLock *lock;
@end

@implementation LQMultithreading_GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    self.imageViewsArr = [NSMutableArray arrayWithCapacity:3];
    
    self.imageNamesArr = [NSMutableArray array];
    
    for (int i=0; i<IMAGE_COUNT; i++) {
        [self.imageNamesArr addObject:[NSString stringWithFormat:@"http://images.cnblogs.com/cnblogs_com/kenshincui/613474/o_%i.jpg",i]];
    }
    
    CGFloat imageWidth = (ScreenWidth - SFwx(20))/3;
    CGFloat imageHeight = (ScreenHeight - SFwx(64+8))/5;
    for (int i = 0; i<15; i++) {
        UIImageView * iv = [[UIImageView alloc]initWithFrame:CGRectMake((imageWidth+10) * (i%3), (imageHeight+2) * (i/3), imageWidth, imageHeight)];
        iv.backgroundColor = [UIColor redColor];
        [iv setContentMode:UIViewContentModeScaleAspectFill];
        iv.clipsToBounds = YES;
        [self.view addSubview:iv];
        [self.imageViewsArr addObject:iv];
    }
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(50, 450, 220, 25);
    button.centerX = ScreenWidth/2;
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    //添加方法
    [button addTarget:self action:@selector(loadImageWithMultiGCD) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.lock = [[NSLock alloc]init];
}
/**
 *  多线程下载图片
 */
-(void)loadImageWithMultiGCD{
    
    /*创建一个串行队列
     第一个参数：队列名称
     第二个参数：队列类型 这个是串行
     队列
     */
    //
//    dispatch_queue_t serialQueue = dispatch_queue_create("queue_one", DISPATCH_QUEUE_SERIAL);
//    for (int i = 0; i < self.imageViewsArr.count; i ++) {
//        dispatch_async(serialQueue, ^{
//            [self loadImageView:i];
//        });
//    }
    //并行队列
    NSInteger count = 15;//self.imageViewsArr.count;
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i <count; i++) {
        //同步执行队列任务
//        dispatch_sync(globalQueue, ^{
//            [self loadImageView:i];
//        });
        //异步执行队列任务
        dispatch_async(globalQueue, ^{
            [self loadImageView:i];
        });
        
     
    }
    
}

#pragma mark 加载图片
-(void)loadImageView:(int)index{
    
    NSData * date = [self requestData:index];
    //回到主线程 *同步*更新UI
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self updateImageWithData:date andIndex:index];
    });
}

#pragma mark 将图片显示到界面
-(void)updateImageWithData:(NSData *)data andIndex:(int)index{
    UIImage *image=[UIImage imageWithData:data];
    UIImageView *imageView= self.imageViewsArr[index];
    imageView.image=image;
}

#pragma mark 请求图片数据
-(NSData *)requestData:(NSInteger)index{
    NSString * name;
    NSData *data;
    
    //第一种
//    //在抢占资源的地方枷锁
//    [self.lock lock];
//    if (self.imageNamesArr.count > 0) {
//        name = [self.imageNamesArr lastObject];
//        //拖慢一个线程的执行时间
//        for (int i = 0; i < 5 ; i++) {
//            NSLog(@"%@",[NSString stringWithFormat:@"%d",i]);
//        }
//        [self.imageNamesArr removeObject:name];
//    }
//    //完成后枷锁
//    [self.lock unlock];
    
    //第二种
    @synchronized (self) {
        if (self.imageNamesArr.count > 0) {
            name = [self.imageNamesArr lastObject];
            //拖慢一个线程的执行时间
            for (int i = 0; i < 5 ; i++) {
                NSLog(@"%@",[NSString stringWithFormat:@"%d",i]);
            }
            [self.imageNamesArr removeObject:name];
        }
    }
    
    
    if (name) {
        NSURL * url = [NSURL URLWithString:name];
        data = [NSData dataWithContentsOfURL:url];
    }
    return data;
}


@end
