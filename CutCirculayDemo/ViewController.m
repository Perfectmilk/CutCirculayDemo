//
//  ViewController.m
//  CutCirculayDemo
//
//  Created by 李广鹏 on 16/6/3.
//  Copyright © 2016年 李广鹏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"keai"]];
    imageView.frame = CGRectMake(100, 100, self.view.frame.size.width - 200, self.view.frame.size.width - 200);
    [self.view addSubview:imageView];
    
    //    [self CutcircularWithView:imageView];
    [self setLayerAndBezierPathCutCircularWithView:imageView];
    
}
#pragma mark -  通过设置layer 切圆角
- (void)setLayerCutCirculayWithView:(UIView *) view
{
    view.layer.masksToBounds = YES;
    // 设置圆角半径
    view.layer.cornerRadius = 5.0f;
}

#pragma mark - 通过layer和bezierPath 设置圆角
- (void)setLayerAndBezierPathCutCircularWithView:(UIView *) view
{
    // 创建BezierPath 并设置角 和 半径 这里只设置了 左上 和 右上
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = view.bounds;
    layer.path = path.CGPath;
    view.layer.mask = layer;
}

#pragma mark - 通过Graphics 和 BezierPath 设置圆角
- (void)setGraphicsCutCirculayWithView:(UIImageView *) view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:view.bounds cornerRadius:5] addClip];
    [view drawRect:view.bounds];
    view.image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束
    UIGraphicsEndImageContext();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
