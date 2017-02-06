//
//  LQDveloperUtilityTableViewCell.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/12.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQDveloperUtilityTableViewCell.h"

@interface LQDveloperUtilityTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *cusTitleLable;

@property (weak, nonatomic) IBOutlet UITextField *cusDownloadUrl;




@end

@implementation LQDveloperUtilityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setModel:(LQDeveloperUtilityModel *)model{
    _model = model;
    self.cusTitleLable.text = model.title;
    self.cusDownloadUrl.text = model.url;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
