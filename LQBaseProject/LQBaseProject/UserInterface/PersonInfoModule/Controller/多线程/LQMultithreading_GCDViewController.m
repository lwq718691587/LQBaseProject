//
//  LQMultithreading_GCDViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/26.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQMultithreading_GCDViewController.h"

@interface LQMultithreading_GCDViewController ()
@property (strong, nonatomic) NSMutableArray *imageViewsArr;
@end

@implementation LQMultithreading_GCDViewController

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
    [button addTarget:self action:@selector(loadImageWithMultiGCD) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)loadImageWithMultiGCD{
    /*创建一个串行队列
     第一个参数：队列名称
     第二个参数：队列类型 这个是串行
     队列
     */
//    dispatch_queue_t serialQueue = dispatch_queue_create("queue_one", DISPATCH_QUEUE_SERIAL);
//    for (int i = 0; i < self.imageViewsArr.count; i ++) {
//        dispatch_async(serialQueue, ^{
//            [self loadImageView:i];
//        });
//    }
    //并发
    for (int i = 0; i <self.imageViewsArr.count; i++) {
        //同步调用
//        dispatch_sync(globalQueue, ^{
//            [self loadImageView:i];
//        });
        //异步调用
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
        });
        
        [self loadImageView:i];
    }
    
}

-(void)loadImageView:(int)index{
    NSData * date = [self requestData:index];
    //回到主线程 更新UI
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


@end
