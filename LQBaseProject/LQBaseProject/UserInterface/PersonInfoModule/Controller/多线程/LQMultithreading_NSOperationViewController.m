//
//  Multithreading_NSOperationViewControllerViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/26.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQMultithreading_NSOperationViewController.h"

@interface LQMultithreading_NSOperationViewController ()

@property (strong, nonatomic) NSMutableArray  *imageViewsArr;

@end

@implementation LQMultithreading_NSOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

-(void)initUI{
    self.imageViewsArr = [NSMutableArray arrayWithCapacity:3];

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
    [button addTarget:self action:@selector(loadImageWithMultiOperation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

//开启子线程
-(void)loadImageWithMultiOperation{
//    NSOperationQueue *operationQueue=[[NSOperationQueue alloc]init];
//    operationQueue.maxConcurrentOperationCount=5;//设置最大并发线程数
//    for (int i =0 ; i < self.imageViewsArr.count; i++) {
//        //方法1：创建操作块添加到队列
//        //        //创建多线程操作
//        //        NSBlockOperation *blockOperation=[NSBlockOperation blockOperationWithBlock:^{
//        //            [self loadImage:[NSNumber numberWithInt:i]];
//        //        }];
//        //        //创建操作队列
//        //
//        //        [operationQueue addOperation:blockOperation];
//        
//        //方法2：直接使用操队列添加操作
//        [operationQueue addOperationWithBlock:^{
//            [self loadImage:[NSNumber numberWithInt:i]];
//        }];
//    }
    
    //每个NSOperation可以设置依赖线程。假设操作A依赖于操作B，线程操作队列在启动线程时就会首先执行B操作，然后执行A。对于前面优先加载最后一张图的需求，只要设置前面的线程操作的依赖线程为最后一个操作即可
    //创建操作队列
    NSOperationQueue *operationQueue=[[NSOperationQueue alloc]init];
    operationQueue.maxConcurrentOperationCount=5;//设置最大并发线程数
    
    NSBlockOperation *lastBlockOperation=[NSBlockOperation blockOperationWithBlock:^{
        [self loadImage:[NSNumber numberWithInt:((int)self.imageViewsArr.count-1)]];
    }];
    //创建多个线程用于填充图片
    for (int i=0; i<self.imageViewsArr.count-1; ++i) {
        //方法1：创建操作块添加到队列
        //创建多线程操作
        NSBlockOperation *blockOperation=[NSBlockOperation blockOperationWithBlock:^{
            [self loadImage:[NSNumber numberWithInt:i]];
        }];
#pragma mark - 设置依赖线程
        //设置依赖操作为最后一张图片加载操作
        [blockOperation addDependency:lastBlockOperation];
        
        [operationQueue addOperation:blockOperation];
        
    }
    //将最后一个图片的加载操作加入线程队列
    [operationQueue addOperation:lastBlockOperation];
    
    
}
#pragma mark 加载图片
-(void)loadImage:(NSNumber *)index{
    int i = [index intValue];
    NSData * data = [self requestData:i];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self updateImageWithData:data andIndex:i];
    }];
    
}

#pragma mark 将图片显示到界面
-(void)updateImageWithData:(NSData *)data andIndex:(int )index{
    UIImage *image=[UIImage imageWithData:data];
    UIImageView *imageView= self.imageViewsArr[index];
    imageView.image=image;
}


#pragma mark 请求图片数据
-(NSData *)requestData:(int)index{
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
