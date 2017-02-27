//
//  LQJSViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2017/2/23.
//  Copyright © 2017年 刘伟强. All rights reserved.
//

#import "LQJSViewController.h"

@interface LQJSViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) UIWebView *jsWebview;

@end

@implementation LQJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.jsWebview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight/2)];
    self.jsWebview.userInteractionEnabled = YES;
    self.jsWebview.delegate = self;
    [self.view addSubview:self.jsWebview];
      [self.jsWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.1.17/OCAndJS.html"]]];
    
    UIView * ocView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight/2, ScreenWidth, ScreenHeight/2)];
    ocView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:ocView];
    UILabel * mylabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
    mylabel.text = @"小红 ： 17600802935";
    [ocView addSubview:mylabel];
    
    NSArray * arr = @[@"小黄的手机号",@"给小黄打电话",@"给小黄发短信"];
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 40 + 40 * i, ScreenWidth, 30)];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        btn.tag = 100 + i;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnfun:) forControlEvents:UIControlEventTouchDown];
        [ocView addSubview:btn];
    }
    
    // Do any additional setup after loading the view.
}

-(void)btnfun:(UIButton*)btn{
    switch (btn.tag) {
        case 100:
            [self.jsWebview stringByEvaluatingJavaScriptFromString:@"alertMobile()"];
            break;
        case 101:
            [self.jsWebview stringByEvaluatingJavaScriptFromString:@"alertName('小红')"];
            break;
        case 102:
            [self.jsWebview stringByEvaluatingJavaScriptFromString:@"alertSendMsg('18870707070','周末爬山真是件愉快的事情')"];
            break;
        default:
            break;
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSLog(@"%@",request.URL);
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
