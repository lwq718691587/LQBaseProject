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
@property (nonatomic) dispatch_semaphore_t semaphore;

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
        iv.tag = i;
        [self.view addSubview:iv];
        [self.imageViewsArr addObject:iv];
    }
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(50, 450, 220, 25);
    button.centerX = ScreenWidth/2;
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    //添加方法
//    [button addTarget:self action:@selector(loadimage) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(loadImageWithMultiGCD) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.lock = [[NSLock alloc]init];
    self.semaphore = dispatch_semaphore_create(1);
}

-(void)loadimage{
    
    // 无论是串行队列 还是 并行队列 只有异步操作任务 GCD才会开启子线程 同步操作任务 不会开启子线程
    // 同步操作 串行队列中的任务：不会新建线程，按顺序执行任务(毫无用处)
    // 同步操作 并行队列中的任务：不会新建线程，按顺序执行任务(几乎没用)
    // 异步操作 串行队列中的任务，会新建线程，按顺序执行任务(非常有用)
    // 异步操作 并行队列中的任务：会新建多个线程，但是无法确定任务的执行顺序(有用，但是很容易出错)
    
    dispatch_queue_t queueBingXing  = dispatch_queue_create("BingXing", DISPATCH_QUEUE_CONCURRENT);//并行队列
    
    dispatch_queue_t queueXiTongBingXing = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);//全局队列 类似并行队列 一般用这个
    

    
    //变更 线程的优先级
//    dispatch_set_target_queue(queueBingXing, queueXiTongBingXing);
    
    //DISPATCH_QUEUE_SERIAL 串行
    //DISPATCH_QUEUE_CONCURRENT 并行
    dispatch_queue_t queueChuanXing = dispatch_queue_create("ChuanXing", DISPATCH_QUEUE_SERIAL);//串行队列//
    //每一个应用程序只有一个主线程即只有一个主队列 为什么需要再主线程上执行任务呢？因为在ios开发中，所有UI的更新任务都必须在主线程上执行。
    //    主队列中的操作都是在主线程中执行的，不存在异步的概念
    //    主队列中添加的同步操作永远不会被执行(会死锁)
    dispatch_queue_t queueMain      = dispatch_get_main_queue();

    for (UIImageView * iv in self.imageViewsArr) {
        dispatch_async(queueBingXing, ^{
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://image.tianjimedia.com/uploadImages/2013/246/QCT323YPH3QB.jpg"]];
            NSLog(@"%@",[NSThread currentThread]);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                iv.image = [UIImage imageWithData:data];
                NSLog(@"是否主线程：%d",[NSThread isMainThread]);
            });
            
//            dispatch_sync(dispatch_get_main_queue(), ^{
//                iv.image = [UIImage imageWithData:data];
//                NSLog(@"是否主线程：%d",[NSThread isMainThread]);
//            });
        });
    }
    

    
    //同步任务 不能再主线程中执行
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"同步执行logo语句");
//    });
    
    
    

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
        //异步执行队列任务
        dispatch_async(globalQueue, ^{
            [self loadImageView:i];
        });
        
     
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    
    
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
    
    //第二种 保证线程A进入相应代码之后B无法进入，只有等待A完成相关操作之后B才能进入即可。下面分别使用NSLock和@synchronized对代码进行修改。
//    @synchronized (self) {
//        if (self.imageNamesArr.count > 0) {
//            name = [self.imageNamesArr lastObject];
//            //拖慢一个线程的执行时间
//            for (int i = 0; i < 5 ; i++) {
//                NSLog(@"%@",[NSString stringWithFormat:@"%d",i]);
//            }
//            [self.imageNamesArr removeObject:name];
//        }
//    }
    
    //第三种条件信号量。
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    if (self.imageNamesArr.count > 0) {
        name = [self.imageNamesArr lastObject];
        //拖慢一个线程的执行时间
        for (int i = 0; i < 5 ; i++) {
            NSLog(@"%@",[NSString stringWithFormat:@"%d",i]);
        }
        [self.imageNamesArr removeObject:name];
    }
    dispatch_semaphore_signal(self.semaphore);
    
    
    
    if (name) {
        NSURL * url = [NSURL URLWithString:name];
        data = [NSData dataWithContentsOfURL:url];
    }
    
    
    return data;
}


@end
