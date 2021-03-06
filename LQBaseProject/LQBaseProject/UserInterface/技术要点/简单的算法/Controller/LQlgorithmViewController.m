//
//  ALQlgorithmViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/2.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQlgorithmViewController.h"
#import "LQListNode.h"
@interface LQlgorithmViewController ()
@property (strong, nonatomic) LQListNode *linkedList;
@end

@implementation LQlgorithmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    
//    NSLog(@"%d",[self funSumOne:100]);
//    NSLog(@"%d",[self funSumTwo:100]);
//    NSLog(@"%d",[self funMult:4]);
//     
    NSMutableArray * numberArr = [NSMutableArray arrayWithArray:@[@4,@8,@1,@6,@7,@2,@5,@3,@9]];
    NSLog(@"%@",[self insertion_sort:numberArr]);
    NSLog(@"%@",[self bubbling_sort:numberArr]);
    NSLog(@"%@",[self selectSortWithArray:numberArr]);

    NSLog(@"%d",[self funMult_2:4]);
    
    
//    // 初始化链表
//    self.linkedList = [[LQListNode alloc] init];
//    
//    // 添加节点
//    [self.linkedList addItem:@"A"];
//    [self.linkedList addItem:@"B"];
//    [self.linkedList addItem:@"C"];
//    [self.linkedList addItem:@"D"];
//    
//    // 打印节点数目
//    
//    
//    // 遍历节点
//    LQNode *point = self.linkedList.headNode;
//    do {
//        
//        NSLog(@"item -> %@", point.item);
//        point = point.nextNode;
//        
//    } while (point);

    
    // Do any additional setup after loading the view.
}

//从1加到n
- (int)funSumOne:(int)n{
    return (1 + n) * (n / 2);
}
//从1加到n
- (int)funSumTwo:(int)n{
    int sum = 0;
    for (int i = 0; i <= n; i++) {
        sum = sum + i;
    }
    return sum;
}
//阶乘sum = 5*4*3*2*1
- (int)funMult:(int)n{
    int sum = 1 ;
    for (int i = n ; i > 0; i--) {
        sum = sum * i;
    }
    return sum;
}

- (int)funMult_2:(int)n{
    int sum = 1;
    if (n > 2) {
        sum = n * [self funMult_2:n-1];
    }
    return sum;
}

//插入排序算法
- (NSMutableArray *)insertion_sort:(NSMutableArray*)numberArr{
    

//    for (int j = 1 ; j<numberArr.count ; j++) {
//        int key = [numberArr[j] intValue];
//        int i = j - 1;
//        while (i >= 0 && key < [numberArr[i] intValue]) {
//            numberArr[i+1] = numberArr[i];
//            i--;
//        }
//        numberArr[i + 1] = [NSNumber numberWithInt:key];
//    }
//    NSLog(@"%@",[numberArr componentsJoinedByString:@","]);
//    return numberArr;
    
    
//    for (int i = 1 ; i<numberArr.count ;i++) {
//        NSNumber * key = numberArr[i];
//        int j = i - 1;
//        while (j >= 0 && key < numberArr[j]) {
//            numberArr[j+1] = numberArr[j];
//            j--;
//        }
//        numberArr[j+1] = key;
//    }
//    return numberArr;
    
    
    for (int i = 1; i < numberArr.count; i++) {
        NSNumber *key = numberArr[i];
        int j = i - 1;
        while (j >= 0 && numberArr[j] > key) {
            numberArr[j+1] = numberArr[j];
            j--;
        }
        numberArr[j + 1] = key;
    }
    return numberArr;
    
    
}

//冒泡排序
- (NSMutableArray *)bubbling_sort:(NSMutableArray *)numberArr{
    
//    for (int i = 0; i < numberArr.count; i++) {
//        for (int j = 1 ; j < numberArr.count - i; j++) {
//            if ([numberArr[j] intValue] < [numberArr[j-1] intValue]) {
//                [numberArr exchangeObjectAtIndex:j withObjectAtIndex:j-1];
//            }
//        }
//    }
    
    
    for (int i = 0; i < numberArr.count; i ++) {
        for (int j = 1; j < numberArr.count - i; j++) {
            if (numberArr[j] < numberArr[j-1]) {
                [numberArr exchangeObjectAtIndex:j withObjectAtIndex:j-1];
            }
        }
    }
    
    
    return numberArr;
}

//选择排序
-(NSMutableArray *)selectSortWithArray:(NSMutableArray *)numberArr{
    
    
//    for (int i = 0;  i < numberArr.count -1 ; i++) {
//        int m = i;
//        for (int j = m + 1 ; j < numberArr.count - 1; j++) {
//            if (numberArr[j] < numberArr[m]) {
//                m = j;
//            }
//        }
//        if (m != i) {
//            [numberArr exchangeObjectAtIndex:m withObjectAtIndex:i];
//        }
//    }
//    return numberArr;
    
    
    for (int i = 0; i < numberArr.count; i++) {
        int m = i;
        for (int j = m +1 ; j < numberArr.count; j++) {
            if (numberArr[m] > numberArr[j] ) {
                m = j;
            }
        }
        if (m != i) {
            [numberArr exchangeObjectAtIndex:m withObjectAtIndex:i];
        }
    }
    
    return numberArr;
}

-(int )quickSortWithArray:(NSMutableArray *)numberArr{
    
    NSNumber *key = numberArr[0];
    
    int low = 0;
    int high = (int)numberArr.count - 1;
    
    while (low < high) {
        
        while (low < high && numberArr[high] >= key ) {
            --high;
        }
        
        numberArr[low] = numberArr[high];
        
        while (low < high && numberArr[low] <= key) {
            ++low;
        }
        numberArr[high] = numberArr[low];
    }
    numberArr[low] = key;
    
    return low;
}



@end
