//
//  ViewController.m
//  iOS_樱花飞舞动画01
//
//  Created by 高宇 on 16/11/21.
//  Copyright © 2016年 高宇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"樱花树2"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    //樱花飘落
    CAEmitterLayer *snowEmitterLayer = [CAEmitterLayer layer];
    snowEmitterLayer.emitterPosition = CGPointMake(100, -30);
    snowEmitterLayer.emitterSize = CGSizeMake(self.view.frame.size.width * 2, 0);
    snowEmitterLayer.emitterMode = kCAEmitterLayerOutline;
    snowEmitterLayer.emitterShape = kCAEmitterLayerLine;
    
    
    CAEmitterCell *snowCell = [CAEmitterCell emitterCell];
    snowCell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"樱花瓣2"].CGImage);
//    花瓣缩放比例
    snowCell.scale = 0.02;
    snowCell.scaleRange = 0.5;
//    每秒产生的花瓣数量
    snowCell.birthRate =7;
    snowCell.lifetime = 80;
//    每秒花瓣变透明的速度
    snowCell.alphaSpeed = -0.01;
//    秒速“五”厘米
    snowCell.velocity = 40;
    snowCell.velocityRange = 60;
//    花瓣掉落的角度范围
    snowCell.emissionRange = M_PI;
//    花瓣旋转的速度
    snowCell.spin = M_PI_4;
//    阴影的不透明度
    snowEmitterLayer.shadowOpacity = 1;
//    阴影化开的程度（就像墨水滴在宣纸上化开那样）
    snowEmitterLayer.shadowRadius = 8;
//    阴影的偏移量
    snowEmitterLayer.shadowOffset = CGSizeMake(3, 3);
//    阴影的颜色
    snowEmitterLayer.shadowColor = [UIColor whiteColor].CGColor;
    
    snowEmitterLayer.emitterCells = @[snowCell];
    [imageView.layer addSublayer:snowEmitterLayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
