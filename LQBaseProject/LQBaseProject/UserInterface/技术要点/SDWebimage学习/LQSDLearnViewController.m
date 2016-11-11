//
//  LQSDLearnViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/18.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQSDLearnViewController.h"
#import "LQTestModel.h"

@interface LQSDLearnViewController ()

@end

@implementation LQSDLearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView * iv = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:iv];
    
    [iv setShowActivityIndicatorView:YES];
    [iv sd_setImageWithURL:[NSURL URLWithString:@"http://cdn.duitang.com/uploads/item/201508/08/20150808155741_WiKXk.jpeg"] placeholderImage:[UIImage imageNamed:@"zhanweitu"] options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        NSLog(@"%ld------%ld",receivedSize,expectedSize);
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        iv.image = image;
        NSLog(@"%ld-----%@",(long)cacheType,imageURL);
    }];
    
    // Do any additional setup after loading the view.
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
