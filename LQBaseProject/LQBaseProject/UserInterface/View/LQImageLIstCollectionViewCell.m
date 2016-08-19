//
//  LQImageLIstCollectionViewCell.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQImageLIstCollectionViewCell.h"

@interface LQImageLIstCollectionViewCell ()
@property (strong, nonatomic) UIImageView *sexyWomenImageView;
@end
@implementation LQImageLIstCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}
-(void)createView{
    self.sexyWomenImageView = [[UIImageView alloc]initWithFrame:self.bounds];
    self.sexyWomenImageView.clipsToBounds = YES;
    [self.sexyWomenImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:self.sexyWomenImageView];
    
}
-(void)setModel:(LQSexyWomanListModel *)model{
    _model = model;
    NSString * url = [NSString stringWithFormat:@"http://tnfs.tngou.net/image/%@",model.imageUrl];
    
    [self.sexyWomenImageView setShowActivityIndicatorView:YES];
    [self.sexyWomenImageView sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"%f",image.size.width);
        [self.sexyWomenImageView setShowActivityIndicatorView:NO];
    }];
    
//    [[SDWebImageDownloader sharedDownloader]downloadImageWithURL:[NSURL URLWithString:url] options:SDWebImageDownloaderProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        NSLog(@"%ld---%ld",receivedSize,expectedSize);
//    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//        self.sexyWomenImageView.image = image;
//    }];

}

@end
