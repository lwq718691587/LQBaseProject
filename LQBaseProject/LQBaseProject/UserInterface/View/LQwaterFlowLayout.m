//
//  LQwaterFlowLayout.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/22.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQwaterFlowLayout.h"

#define wCount  2

@implementation LQwaterFlowLayout


-(void)prepareLayout{
    
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray * arr = [super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes * att in arr) {
        
        NSInteger remainder = att.indexPath.row % wCount;
        NSInteger currentRow = att.indexPath.row / wCount;
        
        CGFloat currentHeight = att.size.height;
        
        CGFloat positonX = att.size.width * remainder + 10 * ( remainder + 1);
        
        CGFloat positionY = (currentRow + 1) * 10;
        
        for (NSInteger i=0; i < currentRow; i++) {
            NSInteger position = remainder + i * 3;
            positionY += att.size.height;
        }
        att.frame = CGRectMake(positonX, positionY,att.size.width,currentHeight) ;

        
    }
    return arr;
}



@end
