//
//  ViewController.m
//  ButtonLargerHitArea
//
//  Created by drops on 16/1/31.
//  Copyright © 2016年 TXW. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+LargerHitArea.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)clickButton:(id)sender {
    NSLog(@"%@ be clicked", sender);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.button setBackgroundColor:[UIColor grayColor]];
    //扩大点击响应区域，负数增大，正数减小
    UIEdgeInsets edgeInsets = {-200, -200, -200, -200};
    [self.button setHitEdgeInsets:edgeInsets];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
