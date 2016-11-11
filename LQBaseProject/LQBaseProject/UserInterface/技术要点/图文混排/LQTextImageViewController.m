//
//  LQTextImageViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/11/2.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQTextImageViewController.h"

@interface LQTextImageViewController ()

@end

@implementation LQTextImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextView * tv = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64)];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"、记不清有多少个夜晚,在我翻阅纸张的指间滑落；记不清有多少支蜡烛,在我的凝视中化为灰烬.逝者如斯,我时时刻刻会听见自己对生命承诺的余音,感到岁月的流转在渐渐稀释我的年少无知,我愿自己是一只上足了发条的时钟,在昼夜不停的流转中留下自己充实的每一刻.如果人类不好好保护我们这个赖以生存的地球,终有一天,风沙的肆虐与垃圾的堆积会吞没我们美丽的家园.我向全世界的人们呼吁：让我们从现在开始,从我做起,手挽手,肩并肩共同保护建设我们的家园吧!正所谓“学海无涯”.我们正像一群群鱼儿在茫茫的知识之海中跳跃、 嬉戏,在知识之海中出生、成长、生活.我们离不开这维持生活的“海水”,如果跳\n出这个“海洋”,到“陆地”上去生活,我们就会被无情的“太阳”晒死.岭上娇艳的鲜花,怎敌她美丽的容颜?山间清澈的小溪,怎比她纯洁的心灵?我拽着春姑娘的衣裙,春姑娘把我带到了绿色的世界里.我把卷子摊在课桌上,恨不得敲一阵锣,叫大家都来看看我这光彩的分数.“上下五千年,龙的看火不灭；古有愚公志,而今从头越…… ”站在新世纪的门槛上,我们的追求就是让祖国灿烂的喜悦飞扬在美好的明天……美丽是平凡的,平凡得让你感觉不到她的存在；美丽是平淡的,平淡得只剩下温馨的回忆；美丽又是平静的,平静得只有你费尽心能失"];
    
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:@"wsxedc"];
    attach.bounds = CGRectMake(0, 0, 15, 15);
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
    
   
    
    NSMutableAttributedString *string2 = [[NSMutableAttributedString alloc] initWithString:@"记不清有多少个夜晚,在我翻阅纸张的指间滑落；记不清有多少支蜡烛,在我的凝视中化为灰烬.逝者如斯,我时时刻刻会听见自己对生命承诺的余音,感到岁月的流转在渐渐稀释我的年少无知,我愿自己是一只上足了发条的时钟,在昼夜不停的流转中留下自己充实的每一刻.如果人类不好好保护我们这个赖以生存的地球,终有一天,风沙的肆虐与垃圾的堆积会吞没我们美丽的家园.我向全世界的人们呼吁：让我们从现在开始,从我做起,手挽手,肩并肩共同保护建设我们的家园吧!正所谓“学海无涯”.我们正像一群群鱼儿在茫茫的知识之海中跳跃、 嬉戏,在知识之海中出生、成长、生活.我们离不开这维持生活的“海水”,如果跳出"];

    
    
    

    
    [string appendAttributedString:attachString];
    [string appendAttributedString:string2];
    
    NSMutableParagraphStyle * style = [NSMutableParagraphStyle new];
    style.lineSpacing = 10;
//    style.alignment = NSTextAlignmentCenter;
    style.firstLineHeadIndent = 20;
    style.baseWritingDirection = NSWritingDirectionLeftToRight;
    
    style.paragraphSpacingBefore = 10;
    [string addAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor],
                            NSParagraphStyleAttributeName:style,
                            NSBackgroundColorAttributeName:[UIColor yellowColor],
                            NSUnderlineStyleAttributeName:[NSNumber numberWithInt:NSUnderlineStyleSingle],
//                            NSBaselineOffsetAttributeName:[NSNumber numberWithInt:1],
                            NSStrokeWidthAttributeName:[NSNumber numberWithInt:3],
                            NSStrokeColorAttributeName:[UIColor redColor],
                            NSExpansionAttributeName:[NSNumber numberWithInt:0]}range:NSMakeRange(0, string.length)];
    
    


    tv.attributedText = string;
    [self.view addSubview:tv];
    // Do any additional setup after loading the view.
}



@end
