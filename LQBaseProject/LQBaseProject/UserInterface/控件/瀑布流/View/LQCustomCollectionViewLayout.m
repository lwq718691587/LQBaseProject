//
//  LQCustomCollectionViewLayout.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/22.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQCustomCollectionViewLayout.h"
#import "LQMacro.h"
#import "LQSexyWomanListViewController.h"
#import "LQSexyWomanListModel.h"


#define itemSpaceWidth 10   //宽度
#define MaxNumCols 2    //最大的列数
@interface LQCustomCollectionViewLayout ()

{
    NSMutableArray *_yOffsets;//存储各列的当前offest
}

@property (strong, nonatomic) NSMutableArray *layoutaArr;
@property (nonatomic, strong) NSMutableDictionary *layoutInformation;

@end

static NSUInteger CellWidth = 100;


@implementation LQCustomCollectionViewLayout


-(CGSize)collectionViewContentSize{
    
    NSMutableArray * heightArr = [NSMutableArray arrayWithCapacity:MaxNumCols];
    for (int i = 0; i < MaxNumCols; i++) {
        NSInteger numSections = [self.collectionView numberOfSections];
        NSInteger numItems = [self.collectionView numberOfItemsInSection:numSections-1];
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:numItems - i - 1 inSection:numSections - 1];
        UICollectionViewLayoutAttributes * leftAttributes = [self.layoutInformation objectForKey:indexPath];
        [heightArr addObject:@(CGRectGetMaxY(leftAttributes.frame))];
    }
    NSArray *array2 = [heightArr sortedArrayUsingSelector:@selector(compare:)];


    CGFloat contentWidth = self.collectionView.bounds.size.width;
    CGSize contentSize = CGSizeMake(contentWidth, [array2.lastObject floatValue]);
    return contentSize;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray *myAttributes = [NSMutableArray arrayWithCapacity:self.layoutInformation.count];
    for(NSString *key in self.layoutInformation.allKeys){
        UICollectionViewLayoutAttributes *attributes = [self.layoutInformation objectForKey:key];
        
        if(CGRectIntersectsRect(rect, attributes.frame)){
            [myAttributes addObject:attributes];
        }
    }
    return myAttributes;
}

- (void)prepareLayout{
    
    _yOffsets = [NSMutableArray arrayWithCapacity:MaxNumCols];
    for (int i = 0; i < MaxNumCols; i++) {
        [_yOffsets addObject:@0];
    }
    
    //初始化cell的宽度
    CellWidth = (self.collectionView.bounds.size.width - (MaxNumCols-1) * itemSpaceWidth) / MaxNumCols;
    
    //事先创建好UICollectionViewLayoutAttributes
    _layoutInformation = [NSMutableDictionary dictionary];
    
    NSIndexPath *indexPath;
    NSInteger numSections = [self.collectionView numberOfSections];
    for(NSInteger section = 0; section < numSections; section++){
        NSInteger numItems = [self.collectionView numberOfItemsInSection:section];
        for(NSInteger item = 0; item < numItems; item++){
            indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            UICollectionViewLayoutAttributes *attributes =
            [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
            NSInteger col = indexPath.item % MaxNumCols;
            
            LQSexyWomanListViewController * ds = (LQSexyWomanListViewController *)self.collectionView.dataSource;
            LQSexyWomanListModel * model = ds.dataArr[indexPath.row];
            NSInteger height = (CGFloat)model.imageHeight/(CGFloat)model.imageWidth * CellWidth;
            
            attributes.frame = CGRectMake( col * (CellWidth + itemSpaceWidth), [_yOffsets[col] floatValue], CellWidth, height);
            
            CGFloat yOffset;
            yOffset = [_yOffsets[col] floatValue] + height + itemSpaceWidth;
            _yOffsets[col] = @(yOffset);
            [_layoutInformation setObject:attributes forKey:indexPath];
        }
    }
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return NO;
}




@end
