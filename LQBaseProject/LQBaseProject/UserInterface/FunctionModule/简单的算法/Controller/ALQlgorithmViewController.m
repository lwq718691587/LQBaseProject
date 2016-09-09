//
//  ALQlgorithmViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/2.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "ALQlgorithmViewController.h"

@interface ALQlgorithmViewController ()

@end

@implementation ALQlgorithmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%d",[self funSumOne:100]);
    NSLog(@"%d",[self funSumTwo:100]);
    NSLog(@"%d",[self funMult:4]);
   
    
    NSMutableArray * numberArr = [NSMutableArray arrayWithArray:@[@4,@8,@1,@6,@7,@2,@5,@3,@9]];
    NSLog(@"%@",[self insertion_sort:numberArr]);
    

    
    // Do any additional setup after loading the view.
}

//从1加到n
-(int)funSumOne:(int)n{
    return (1 + n) * (n / 2);
}
//从1加到n
-(int)funSumTwo:(int)n{
    int sum = 0;
    for (int i = 0; i <= n; i++) {
        sum = sum + i;
    }
    return sum;
}
//阶乘sum = 5*4*3*2*1
-(int)funMult:(int)n{
    int sum = 1 ;
    for (int i = n ; i > 0; i--) {
        sum = sum * i;
    }
    return sum;
}

//插入排序算法
-(NSMutableArray *)insertion_sort:(NSMutableArray*)numberArr{
    for (int j = 1; j < numberArr.count ; j++) {
        int key = [numberArr[j] intValue];
        int i = j - 1;
        while (i >= 0 && key < [numberArr[i] intValue] ) {
            [numberArr exchangeObjectAtIndex:i withObjectAtIndex:i+1];
            i--;
        }
    }
    return numberArr;
}

@end
