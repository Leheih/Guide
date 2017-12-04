//
//  GuedeView.h
//  Guide
//
//  Created by 中再融 on 2017/12/1.
//  Copyright © 2017年 贾俊伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideView : UIView

/**
 展示新特性引导蒙板

 @param updateView 有新特性的view
 */
- (void)showGuideViewWithView:(UIView *)updateView;
/** 设置边距  上下左右默认都是这个 */
@property (nonatomic,assign) CGFloat space;
/** 设置边距 */
@property (nonatomic,assign) UIEdgeInsets spaceInsets;
/** 设置圆角 */
@property (nonatomic,assign) CGFloat cornerRadius;

@end
