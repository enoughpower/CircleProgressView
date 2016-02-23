//
//  EPCircleProgressView.m
//  Quartz2D
//
//  Created by autobot on 16/2/22.
//  Copyright © 2016年 autobot. All rights reserved.
//

#import "EPCircleProgressView.h"

@interface EPCircleProgressView ()
@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat radius;
@property (nonatomic, assign)BOOL showed;
@property (nonatomic, strong)UILabel *progressLabel;
@end

@implementation EPCircleProgressView

- (instancetype)initWithFrame:(CGRect)frame Style:(EPCircleProgressStyle)style;
{
    if (self = [super initWithFrame:frame]) {
        _style = style;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.x = self.bounds.size.width /2;
    self.y = self.bounds.size.height /2;
    self.radius = self.bounds.size.width >= self.bounds.size.height ? self.bounds.size.height/2 :self.bounds.size.width/2;
    self.progressLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _radius*1.5, _radius/2)];
    self.progressLabel.center = CGPointMake(self.x, self.y);
    self.progressLabel.text = [NSString stringWithFormat:@"%02d%%",0];
    self.progressLabel.font = [UIFont systemFontOfSize:_radius/3];
    self.progressLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_progressLabel];
    self.progressLabel.hidden = YES;
    if (self.style == EPCircleProgressStyleSquareText || self.style == EPCircleProgressStyleRoundText) {
        self.progressLabel.hidden = NO;
    }
    
}

- (void)drawRect:(CGRect)rect
{
    if (self.progress < 0 || self.progress >1) {
        return;
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (self.style == EPCircleProgressStyleRound || self.style == EPCircleProgressStyleRoundText) {
        CGContextSetLineCap(context, kCGLineCapRound);
    }else {
        CGContextSetLineCap(context, kCGLineCapButt);
    }
    CGContextSetStrokeColorWithColor(context, _LineColor.CGColor);
    if (self.style == EPCircleProgressStyleSector) {
        CGContextSetLineWidth(context, 1);//线的宽度
        CGContextMoveToPoint(context, _x, _y);
        CGContextAddArc(context,_x,_y, self.radius,-M_PI_2,-M_PI_2+_progress*M_PI*2,0);
        CGContextSetFillColorWithColor(context, _LineColor.CGColor);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFill);
    }else {
        CGContextSetLineWidth(context, _LineWidth);//线的宽度
        CGContextAddArc(context,_x,_y, self.radius-_LineWidth/2,-M_PI_2,-M_PI_2+_progress*M_PI*2,0);
        CGContextSetFillColorWithColor(context, _LineColor.CGColor);
        CGContextDrawPath(context, kCGPathStroke);
        self.progressLabel.text = [NSString stringWithFormat:@"%.2f%%",(self.progress*100)];
        self.progressLabel.textColor = self.textColor;
    }
    
    
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    if (!_LineColor) {
        _LineColor = [UIColor blueColor];
    }
    if (!_LineWidth) {
        _LineWidth = self.radius / 10;
    }
    if (!_textColor) {
        _textColor = _LineColor;
    }
    [self setNeedsDisplay];
}
- (void)setLineColor:(UIColor *)LineColor
{
    _LineColor = LineColor;
    [self setNeedsDisplay];

}
- (void)setLineWidth:(CGFloat)LineWidth
{
    _LineWidth = LineWidth;
    [self setNeedsDisplay];

}
- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    [self setNeedsDisplay];

}
- (void)setStyle:(EPCircleProgressStyle)style
{
    _style = style;
    [self setNeedsDisplay];
}






@end
