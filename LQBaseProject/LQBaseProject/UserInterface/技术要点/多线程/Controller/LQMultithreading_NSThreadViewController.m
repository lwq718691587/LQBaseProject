//
//  MultithreadingViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/26.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQMultithreading_NSThreadViewController.h"
#import "LQImageData.h"


/**
 *  http://blog.csdn.net/shenjie12345678/article/details/44152605 多线程学习的博客地址
 */

@interface LQMultithreading_NSThreadViewController ()

@property (strong, nonatomic) NSMutableArray  *imageViewsArr;
@property (strong, nonatomic) NSMutableArray  *threadArr;

@end

@implementation LQMultithreading_NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)initUI{
    self.imageViewsArr = [NSMutableArray arrayWithCapacity:3];
    self.threadArr = [NSMutableArray arrayWithCapacity:3];
    CGFloat imageWidth = (ScreenWidth - SFwx(20))/3;
    for (int i = 0; i<9; i++) {
        UIImageView * iv = [[UIImageView alloc]initWithFrame:CGRectMake((imageWidth+10) * (i/3), (imageWidth+10) * 1.5 * (i%3), imageWidth, imageWidth * 1.5)];
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
    [button addTarget:self action:@selector(loadImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    //停止按钮
    UIButton *buttonStop=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonStop.frame=CGRectMake(280, 500, 220, 25);
    buttonStop.centerX = button.centerX;
    buttonStop.top = button.bottom + 5;
    [buttonStop setTitle:@"停止加载" forState:UIControlStateNormal];
    [buttonStop addTarget:self action:@selector(stopLoadImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonStop];
}
//开启现成加载图片 //NSThread 子线程 NSThread是轻量级的多线程开发，使用起来也并不复杂，但是使用NSThread需要自己管理线程生命周期
- (void)loadImageWithMultiThread{
    for (int i =0 ; i < self.imageViewsArr.count; i++) {
        //系统提供的快速创建线程 在后台执行一个操作，本质就是重新创建一个线程执行当前方法。
        //        [self performSelectorInBackground:@selector(loadImage:) withObject:[NSNumber numberWithInt:i]];
        //创建线程
        NSThread * thread = [[NSThread alloc]initWithTarget:self selector:@selector(loadImage:) object:[NSNumber numberWithInt:i]];
        thread.name = [NSString stringWithFormat:@"myThread%i",i];
        [self.threadArr addObject:thread];
    }
    for (NSThread * t in self.threadArr) {
        [t start];
    }
}
#pragma mark 停止加载图片
- (void)stopLoadImage{
    for (int i=0; i<self.imageViewsArr.count; i++) {
        NSThread *thread= self.threadArr[i];
        //判断线程是否完成，如果没有完成则设置为取消状态
        //注意设置为取消状态仅仅是改变了线程状态而言，并不能终止线程
        if (!thread.isFinished) {
            [thread cancel];
            NSLog(@"%@",thread.name);
        }
    }
}

#pragma mark 加载图片
- (void)loadImage:(NSNumber *)index{
    int i = [index intValue];
    NSThread *currentThread=[NSThread currentThread];
    //请求数据
    LQImageData * lqData = [[LQImageData alloc]init];
    lqData.imageData = [self requestData:i];
    lqData.index = i;
    //    如果当前线程处于取消状态，则退出当前线程
    if (currentThread.isCancelled) {
        NSLog(@"thread(%@) will be cancelled!",currentThread);
        [NSThread exit];//取消当前线程
    }
    NSLog(@"----%@",currentThread.name);
    /*将数据显示到UI控件,注意只能在主线程中更新UI,
     另外performSelectorOnMainThread方法是NSObject的分类方法，每个NSObject对象都有此方法，
     它调用的selector方法是当前调用控件的方法，例如使用UIImageView调用的时候selector就是UIImageView的方法
     Object：代表调用方法的参数,不过只能传递一个参数(如果有多个参数请使用对象进行封装)
     waitUntilDone:是否线程任务完成执行
     */
    [self performSelectorOnMainThread:@selector(updateImage:) withObject:lqData waitUntilDone:YES];
}

#pragma mark 将图片显示到界面
- (void)updateImage:(LQImageData *)lqData{
    
    UIImageView * iv = self.imageViewsArr[lqData.index];
    iv.image = [UIImage imageWithData:lqData.imageData];

}


#pragma mark 请求图片数据
- (NSData *)requestData:(int)index{
    @autoreleasepool {
        NSURL *url;
        switch (index) {
            case 0:
                url=[NSURL URLWithString:@"http://www.bz55.com/uploads/allimg/150707/139-150FG03416.jpg"];
                break;
            case 1:
                url=[NSURL URLWithString:@"http://img1.gamedog.cn/2011/11/05/14-1111051FT5-50.jpg"];
                break;
            case 2:
                url=[NSURL URLWithString:@"http://hiphotos.baidu.com/kw_sx/pic/item/51e960a6cc0854af9152ee4d.jpg"];
                break;
            
            default:
                url=[NSURL URLWithString:@"http://image.tianjimedia.com/uploadImages/2013/246/QCT323YPH3QB.jpg"];
                break;
        }
        NSData *data=[NSData dataWithContentsOfURL:url];
        return data;
    }
}



@end
