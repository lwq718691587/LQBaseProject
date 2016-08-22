//
//  LQImageLIstCollectionViewCell.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQImageListCollectionViewCell.h"

@interface LQImageListCollectionViewCell ()

@end
@implementation LQImageListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        [self createView];
    }
    return self;
}
-(void)createView{
    self.sexyWomenImageView = [[UIImageView alloc]initWithFrame:self.bounds];
    self.sexyWomenImageView.clipsToBounds = YES;
    [self.sexyWomenImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self addSubview:self.sexyWomenImageView];
    
}
-(void)setModel:(LQSexyWomanListModel *)model{
    _model = model;
    NSString * url = [NSString stringWithFormat:@"http://tnfs.tngou.net/image/%@",model.imageUrl];
    
    [self.sexyWomenImageView setShowActivityIndicatorView:YES];
    [self.sexyWomenImageView sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [self.sexyWomenImageView setShowActivityIndicatorView:NO];
    }];
}

@end
