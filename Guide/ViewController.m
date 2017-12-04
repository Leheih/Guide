//
//  ViewController.m
//  Guide
//
//  Created by 中再融 on 2017/12/1.
//  Copyright © 2017年 贾俊伟. All rights reserved.
//

#import "ViewController.h"
#import "GuideController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *guideBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 60)];
    [guideBtn setTitle:@"跳转到引导界面" forState:UIControlStateNormal];
    [guideBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [guideBtn addTarget:self action:@selector(guideBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:guideBtn];
}


- (void)guideBtnClick {
    
    GuideController * guideVC = [GuideController new];
    [self.navigationController pushViewController:guideVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
