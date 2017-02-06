//
//  LQHttpViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/12.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQHttpViewController.h"
#import "LQNetworking.h"
#import "LQMacro.h"

@interface LQHttpViewController ()<NSURLSessionDownloadDelegate>

@end

@implementation LQHttpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //http://3ciyuan.cn:12001/v1/579ee295eed471e92bbc3ecd/prizeList
    
    [self initUI];
    
//    [SVProgressHUD show];
    [LQNetworking getRequestWithUrlStr:@"http://3ciyuan.cn:12001/v1/579ee295eed471e92bbc3ecd/prizeList" success:^(id data) {
        NSLog(@"%@",data);
//        [SVProgressHUD dismiss];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
//        [SVProgressHUD dismiss];
    }];
    

    [LQNetworking postRequestWithUrlStr:@"http://3ciyuan.cn:12001/v1/signin" parameters:@{@"account":@"17600802935",@"passwdmd5":[@"111111" MD5]} success:^(id data) {
        NSLog(@"%@",data);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
//    [LQNetworking downloadWithUrlStr:@"http://mvvideo1.meitudata.com/579ee3bf1a9bf2478.mp4" success:^(id data) {
//        
//    } failure:^(NSError *error) {
//        
//    }];
    
    NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURL *url = [NSURL URLWithString:@"http://mvvideo1.meitudata.com/579ee3bf1a9bf2478.mp4"];
    
    
    
    NSURLSessionDownloadTask * task = [session downloadTaskWithURL:url];
    
    
    [task resume];

    
    
    // Do any additional setup after loading the view.
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    
    NSLog(@"####%lld / %lld / %lld",bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSString * fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    [[NSFileManager defaultManager] moveItemAtURL:location toURL:[NSURL fileURLWithPath:fullPath] error:nil];
    NSLog(@"%@",fullPath);
}


- (void)initUI{
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    btn.backgroundColor = [UIColor flatRedColor];
    [btn addTarget:self action:@selector(btnFun) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    
}
- (void)btnFun{
    NSLog(@"121");
}
@end
