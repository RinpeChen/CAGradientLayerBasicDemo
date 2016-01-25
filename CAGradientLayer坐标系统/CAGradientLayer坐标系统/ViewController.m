//
//  ViewController.m
//  CAGradientLayer坐标系统
//
//  Created by RinpeChen on 16/1/23.
//  Copyright © 2016年 miaoqu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 创建渐变色图层
    self.gradientLayer             = [CAGradientLayer layer];
    self.gradientLayer.frame       = CGRectMake(0, 0, 200, 200);
    self.gradientLayer.position    = self.view.center;
    self.gradientLayer.borderWidth = 1;
    
    self.gradientLayer.colors = @[
                                  (id)[UIColor redColor].CGColor,
                                  (id)[UIColor greenColor].CGColor,
                                  (id)[UIColor blueColor].CGColor
                                  ];
    
    // 设置渐变方向(0~1)
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(1, 1);
    
    // 设置渐变色的起始位置和终止位置(颜色的分割点)
    self.gradientLayer.locations = @[@(0.f), @(0.25), @(1.f)];
    
    // 添加图层
    [self.view.layer addSublayer:self.gradientLayer];
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(startAnimation) userInfo:nil repeats:YES];
}

- (void)startAnimation
{
    // 通过修改分割点来实现隐式动画
    self.gradientLayer.locations = @[@(arc4random() % 100 / 100.0), @(arc4random() % 100 / 100.0), @(arc4random() % 100 / 100.0)];
}

@end
