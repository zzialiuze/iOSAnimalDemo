//
//  ThirdVC.m
//  iOSAnimalDemo
//
//  Created by 刘泽 on 16/6/24.
//  Copyright © 2016年 liuze. All rights reserved.
//

#import "ThirdVC.h"

@interface ThirdVC ()



@end

@implementation ThirdVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //绘制不规则图形
    
    [self drawShape];
    
    
    //雷达波纹效果
    [self bowenAction];
    
    
}

- (void)drawShape
{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 400, 1)];
    
    lineView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:lineView];
    
    UIView *shapeView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 300, 200)];
    [self.view addSubview:shapeView];
    
    
    CGPoint point1= CGPointMake(10, 80);
    CGPoint point2= CGPointMake(10, 200);
    CGPoint point3= CGPointMake(300, 200);
    CGPoint point4= CGPointMake(300, 80);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //移动到某个点，也就是起始点
    [path moveToPoint:point1];
    
    [path addLineToPoint:point2];
    
    [path addLineToPoint:point3];
    
    [path addLineToPoint:point4];
    
    //画二元曲线，一般和moveToPoint配合使用
    
    
    /**
     *  endPoint:曲线的终点
     
        controlPoint:画曲线的基准点
     */
    [path addQuadCurveToPoint:point1 controlPoint:CGPointMake(150, -30)];
    
    
    

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.path = path.CGPath;
    
    //填充颜色
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    //边框颜色
    shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    
    [shapeView.layer addSublayer:shapeLayer];
    
    
    
    //添加动画
    CABasicAnimation *pathAnimal = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    pathAnimal.duration = 3;
    
    pathAnimal.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    pathAnimal.fromValue = @(0.0);
    
    pathAnimal.toValue = @(1.0);
    
    pathAnimal.autoreverses = NO;
    
    [shapeLayer addAnimation:pathAnimal forKey:nil];

    
    
}


- (void)bowenAction
{
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(30, 300, 100, 100)];
    
    [self.view addSubview:testView];
    
    testView.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //pulseLayer 波纹
    CAShapeLayer *pulseLayer = [CAShapeLayer layer];
    
    pulseLayer.frame = testView.layer.bounds;
    
    pulseLayer.path = [UIBezierPath bezierPathWithOvalInRect:pulseLayer.bounds].CGPath;
    
    
    //填充色
    pulseLayer.fillColor = [UIColor redColor].CGColor;
    
    //透明度
    pulseLayer.opacity = 0.0;
    
    
    //可以复制的layer
    CAReplicatorLayer *replicationLayer = [CAReplicatorLayer layer];
    
    replicationLayer.frame = testView.bounds;
    
    //创建副本的数量(包括源对象)
    replicationLayer.instanceCount = 4;
    
    //复制副本之间的延迟
    replicationLayer.instanceDelay = 1;
    
    [replicationLayer addSublayer:pulseLayer];
    
    [testView.layer addSublayer:replicationLayer];
    
    //透明度动画
    CABasicAnimation *opacityAnimal = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimal.fromValue = @(0.3);
    opacityAnimal.toValue = @(0.0);
    
    
    //scale
    
    CABasicAnimation *scaleAnimal = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimal.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.0, 0.0, 0.0)];
    scaleAnimal.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 0.0)];
    
    CAAnimationGroup *groupAnimal = [CAAnimationGroup animation];
    
    groupAnimal.animations = @[opacityAnimal,scaleAnimal];
    
    groupAnimal.duration = 4.0;
    
    groupAnimal.autoreverses = NO;
    
    groupAnimal.repeatCount = HUGE;
    
    [pulseLayer addAnimation:groupAnimal forKey:@"groupAnimation"];
    
    
    
}



@end
