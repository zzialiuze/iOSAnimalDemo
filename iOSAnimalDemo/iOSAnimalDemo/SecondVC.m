//
//  SecondVC.m
//  iOSAnimalDemo
//
//  Created by 刘泽 on 16/6/24.
//  Copyright © 2016年 liuze. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self animalWithFloat:.8];
    
    [self startAnimation2];
    
}

- (void)animalWithFloat:(CGFloat)toValue
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 100, 100) cornerRadius:50];
    
    //先画一个圆
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    
    layer.fillColor = [UIColor clearColor].CGColor;
    
    layer.strokeColor = [UIColor orangeColor].CGColor;
    
    layer.lineWidth = 6.0f;
    
    [self.view.layer addSublayer:layer];
    
    
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue=[NSNumber numberWithFloat:0.0f];
    animation.toValue=[NSNumber numberWithFloat:toValue];
    animation.duration = 6.0;
    animation.repeatCount=HUGE;//永久重复动画
    //animation.delegate=self;
    //removedOnCompletion：默认为YES，代表动画执行完毕后就从图层上移除，图形会恢复到动画执行前的状态。如果想让图层保持显示动画执行后的状态，那就设置为NO，不过还要设置fillMode为kCAFillModeForwards
    //fillMode：决定当前对象在非active时间段的行为.比如动画开始之前,动画结束之后
    //autoreverses:动画结束时是否执行逆动画
    //timingFunction:设定动画的速度变化
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion=NO;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [layer addAnimation:animation forKey:@"animation"];
}

- (void)startAnimation2
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 50, 50)];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(25, 25) radius:25 startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:YES];
    
    [self.view addSubview:view];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    layer.path = path.CGPath;
    
    layer.fillColor = [UIColor clearColor].CGColor;
    
    layer.strokeColor = [UIColor orangeColor].CGColor;
    
    layer.lineWidth = 3.0f;
    [view.layer addSublayer:layer];
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue=@(0);
    animation.toValue=@(M_PI*2);
    animation.duration=.6;
    animation.repeatCount=HUGE;//永久重复动画
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion=NO;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [view.layer addAnimation:animation forKey:@"animation"];
    
    
    
}









@end
