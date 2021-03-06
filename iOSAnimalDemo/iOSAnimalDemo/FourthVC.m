//
//  FourthVC.m
//  iOSAnimalDemo
//
//  Created by 刘泽 on 16/6/24.
//  Copyright © 2016年 liuze. All rights reserved.
//

#import "FourthVC.h"

@interface FourthVC ()

@property (nonatomic,strong)NSMutableArray *btnArray;
@property (nonatomic,strong)UIButton *homeBtn;

@end

@implementation FourthVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _btnArray=[[NSMutableArray alloc] init];
    
    [self createBtn:@[@"1",@"2",@"3",@"4",@"5"]];
    
    _homeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _homeBtn.frame=CGRectMake(30, 400, 38, 38);
    [_homeBtn setBackgroundImage:[UIImage imageNamed:@"chooser-button-tab"] forState:UIControlStateNormal];
    [_homeBtn addTarget:self action:@selector(startAnimation1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_homeBtn];
    NSLog(@"初始----%@",[_homeBtn.layer valueForKeyPath:@"position"]);
}

-(void)startAnimation1{
    _homeBtn.selected=!_homeBtn.selected;
    if (_homeBtn.selected) {
        [self showBtn];
    }else{
        [self hiddenBtn];
    }
    
}

- (void)showBtn
{
    for (int i = 0; i < _btnArray.count; i++) {
        
        UIButton *btn = _btnArray[i];
        
        CGPoint startPoint = CGPointMake(49, 419);
        
        CGPoint endPoint = CGPointMake(49, 419 - 60 * (_btnArray.count - i));
        
        CABasicAnimation *positionAnimal = [CABasicAnimation animationWithKeyPath:@"position"];
        
        positionAnimal.duration = .3;
        
        positionAnimal.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        
        positionAnimal.fromValue = [NSValue valueWithCGPoint:startPoint];
        
        positionAnimal.toValue = [NSValue valueWithCGPoint:endPoint];
        
//        positionAnimal.beginTime = CACurrentMediaTime() + (0.3 * _btnArray.count * i);
           positionAnimal.beginTime = CACurrentMediaTime() + (0.3/(float)_btnArray.count * (float)i);
        
        positionAnimal.fillMode = kCAFillModeForwards;
        
        positionAnimal.removedOnCompletion = NO;
        
        [btn.layer addAnimation:positionAnimal forKey:@"positionAnimaltion"];
        
        btn.layer.position = endPoint;
                                       
        
        //scale animation
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.duration=.3;
        scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        scaleAnimation.fromValue = @(0);
        scaleAnimation.toValue = @(1);
        scaleAnimation.beginTime = CACurrentMediaTime() + (0.3/(float)_btnArray.count * (float)i);
        scaleAnimation.fillMode = kCAFillModeForwards;
        scaleAnimation.removedOnCompletion = NO;
        
        [btn.layer addAnimation:scaleAnimation forKey:@"transformscale"];
        btn.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
        
    }
}

- (void)hiddenBtn
{
    int index = 0;
    for (int  i = (int)_btnArray.count-1; i>=0; i--) {
        UIButton *btn=_btnArray[i];
        //        btn.transform=CGAffineTransformIdentity;
        //CGPoint startPoint = CGPointMake(49, 419);
        CGPoint startPoint = CGPointFromString([NSString stringWithFormat:@"%@",[btn.layer valueForKeyPath:@"position"]]);
        CGPoint endPoint =CGPointMake(49, 419);
        //position animation
        CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        positionAnimation.duration=.3;
        positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:startPoint];
        positionAnimation.toValue = [NSValue valueWithCGPoint:endPoint];
        positionAnimation.beginTime = CACurrentMediaTime() + (.3/(float)_btnArray.count * (float)index);
        positionAnimation.fillMode = kCAFillModeForwards;
        positionAnimation.removedOnCompletion = NO;
        
        [btn.layer addAnimation:positionAnimation forKey:@"positionAnimation"];
        //btn.layer.position=startPoint;
        
        //scale animation
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.duration=.3;
        scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        scaleAnimation.fromValue = @(1);
        scaleAnimation.toValue = @(0);
        scaleAnimation.beginTime = CACurrentMediaTime() + (0.3/(float)_btnArray.count * (float)index);
        scaleAnimation.fillMode = kCAFillModeForwards;
        scaleAnimation.removedOnCompletion = NO;
        
        [btn.layer addAnimation:scaleAnimation forKey:@"transformscale"];
        btn.transform = CGAffineTransformMakeScale(1.f, 1.f);
        index++;
    }
}
-(void)createBtn:(NSArray *)btnImageName{
    
    for (int i = 0 ; i < btnImageName.count; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(30, 400, 38, 38);
        btn.backgroundColor=[UIColor lightGrayColor];
        btn.layer.cornerRadius=19;
        [btn setTitle:btnImageName[i] forState:UIControlStateNormal];
        btn.tag=i+1;
//        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        [_btnArray addObject:btn];
    }
    
}

@end
