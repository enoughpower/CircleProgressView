//
//  EPCircleProgressView.h
//  Quartz2D
//
//  Created by autobot on 16/2/22.
//  Copyright © 2016年 autobot. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, EPCircleProgressStyle) {
    EPCircleProgressStyleSquare,               //不带圆角
    EPCircleProgressStyleRound,               //带圆角
    EPCircleProgressStyleSquareText,        //不带圆角显示百分比
    EPCircleProgressStyleRoundText,        //带圆角显示百分比
    EPCircleProgressStyleSector                 //扇形
};


@interface EPCircleProgressView : UIView
//进度条颜色
@property (nonatomic, strong)UIColor* LineColor;
//进度条宽度
@property (nonatomic, assign)CGFloat LineWidth;
//当前进度
@property (nonatomic, assign)CGFloat progress;
//显示的百分比颜色
@property (nonatomic, strong)UIColor *textColor;
//进度条样式
@property (nonatomic, assign)EPCircleProgressStyle style;


- (instancetype)initWithFrame:(CGRect)frame Style:(EPCircleProgressStyle)style;


@end
