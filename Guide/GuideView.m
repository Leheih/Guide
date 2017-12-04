//
//  GuedeView.m
//  Guide
//
//  Created by 中再融 on 2017/12/1.
//  Copyright © 2017年 贾俊伟. All rights reserved.
//

#import "GuideView.h"



@interface GuideView ()

@property (nonatomic,strong) UIView *hudView;
@end

@implementation GuideView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

/**
 添加新手引导蒙层
 */
- (void)showGuideViewWithView:(UIView *)updateView {

    // 在window上添加蒙层
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.hudView];
    
    // path1和path2所包围的区域重叠的部分才会显示  主要利用了下面的mask属性
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds];
    CGRect rect = [updateView convertRect:updateView.bounds toView:window];
    
    // 判断亮起的视图外边距
    CGFloat x;
    CGFloat y;
    CGFloat width;
    CGFloat height;
    if (self.space) {
        
        x = rect.origin.x - self.space;
        y = rect.origin.y - self.space;
        width = rect.size.width + self.space * 2;
        height = rect.size.height + self.space * 2;
    } else if (self.spaceInsets.left) {
        
        NSLog(@"---------");
        x = rect.origin.x - self.spaceInsets.left;
        y = rect.origin.y - self.spaceInsets.bottom;
        width = rect.size.width + self.spaceInsets.left + self.spaceInsets.right;
        height = rect.size.height + self.spaceInsets.top + self.spaceInsets.bottom;
    } else {
        
        x = rect.origin.x;
        y = rect.origin.y;
        width = rect.size.width;
        height = rect.size.height;
    }
    
  
    // path1包围区域包含了整个屏幕 path2设置的路径包含的区域将会是最终显示的区域    bezierPathByReversingPath是路径逆向，起点终点互换位置  如果此处设置为圆形则设置clockwise:NO 表示逆时针  此处不理解为何如此
    UIBezierPath *path2 = [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(x, y, width, height) cornerRadius:self.cornerRadius] bezierPathByReversingPath];
    
    [path1 appendPath:path2];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path1.CGPath;
    // 此属性是重点
    self.hudView.layer.mask = shapeLayer;
}

- (void)hiddenGuideView {
    NSLog(@"---");
    [self.hudView removeFromSuperview];
}


#pragma mark - 懒加载
- (UIView *)hudView {

    if (_hudView == nil) {

        _hudView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _hudView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.8];
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenGuideView)];
        [_hudView addGestureRecognizer:tapGes];
    }
    return _hudView;
}


@end
