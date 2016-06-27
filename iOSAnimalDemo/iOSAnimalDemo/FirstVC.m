//
//  FirstVC.m
//  iOSAnimalDemo
//
//  Created by 刘泽 on 16/6/24.
//  Copyright © 2016年 liuze. All rights reserved.
//

#import "FirstVC.h"

@interface FirstVC ()

@property (nonatomic, strong) UIView *testView;

@end

static CGFloat view_w=100;


@implementation FirstVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _testView=[[UIView alloc] init];
    //_testView.image=[UIImage imageNamed:@"WeiboshareImage"];
    _testView.frame=CGRectMake(0, 200, view_w, view_w);
    _testView.backgroundColor=[UIColor redColor];
    [self.view addSubview:_testView];
    
    NSArray *array=@[@"缩放",@"弹性",@"平移"];
    for (int i = 0; i<array.count; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(10+60*i, 500, 50, 40);
        btn.tag=i+1;
        btn.backgroundColor=[UIColor redColor];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
}



-(void)startAnimation:(UIButton *)btn
{
    switch (btn.tag) {
        case 1:
        {
//            CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//            scaleAnimation.duration=.3;
//            scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//            scaleAnimation.fromValue = @(1);
//            scaleAnimation.toValue = @(1.5);
//            scaleAnimation.fillMode = kCAFillModeForwards;
//            scaleAnimation.removedOnCompletion = YES;
//            [_testView.layer addAnimation:scaleAnimation forKey:@"transformscale"];
            
            
            
            [UIView animateWithDuration:0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [_testView.layer setValue:@(0.1) forKeyPath:@"transform.scale"];
                
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.23 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    [_testView.layer setValue:@(1.2) forKeyPath:@"transform.scale"];
                    
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.09 delay:0.02 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                        [_testView.layer setValue:@(.9) forKeyPath:@"transform.scale"];
                        
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:0.05 delay:0.02 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            [_testView.layer setValue:@(1.0) forKeyPath:@"transform.scale"];
                            
                        } completion:^(BOOL finished) {
                            
                        }];
                    }];
                }];
            }];
            
            
            [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                
                [btn.layer setValue:@(1.3) forKeyPath:@"transform.scale"];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    
                    [btn.layer setValue:@(1.0) forKeyPath:@"transform.scale"];
                } completion:^(BOOL finished) {
                    
                }];
            }];
            
        }
            break;
        case 2:
        {
            [_testView.layer setValue:@(0) forKeyPath:@"transform.translation.x"];
            
            [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [_testView.layer setValue:@(150) forKeyPath:@"transform.translation.x"];
                
            } completion:^(BOOL finished) {
                
                
                
            }];
            
        }
            break;
        case 3:
        {
            [_testView.layer setValue:@(0) forKeyPath:@"position.x"];
            
            [UIView animateWithDuration:1.3 animations:^{
                
                [_testView.layer setValue:@(140) forKeyPath:@"position.x"];
                
            }];

            
        }
            break;
            
        default:
            break;
    }
}







@end
