//
//  GuideController.m
//  Guide
//
//  Created by 中再融 on 2017/12/1.
//  Copyright © 2017年 贾俊伟. All rights reserved.
//

#import "GuideController.h"
#import "GuideView.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface GuideController ()

@property (nonatomic,strong) UILabel *updateLb;


@end

@implementation GuideController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"新手引导页面";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.updateLb];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    GuideView *guide = [[GuideView alloc] initWithFrame:self.view.bounds];
    guide.space = 5.0;
    guide.cornerRadius = 4.0;
    guide.spaceInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    [guide showGuideViewWithView:self.updateLb];
    [self.view addSubview:guide];
}

- (UILabel *)updateLb {
    
    if (_updateLb == nil) {
        
        _updateLb = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH * 0.3, HEIGHT * 0.3, WIDTH * 0.4, 50)];
        _updateLb.text = @"看见我了吗";
        _updateLb.textColor = [UIColor whiteColor];
        _updateLb.backgroundColor = [UIColor purpleColor];
    }
    return _updateLb;
}

@end
