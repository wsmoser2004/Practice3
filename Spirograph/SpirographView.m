//
//  SpirographView.m
//  Spirograph
//
//  Created by Moser, Wesley on 2/21/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import "SpirographView.h"

@implementation SpirographView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGFloat r = 120;
    
    CGFloat t = _stepSize;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    CGFloat offsetWidth = [self bounds].size.width / 2.0;
    CGFloat offsetHeight = [self bounds].size.height / 2.0;
    
    for (int i = 0; i < _numberOfSteps; i++)
    {
        CGFloat x = r * ((1 - _k) * cos(t) + _l * _k * cos(((1 - _k) / _k) * t));
        CGFloat y = r * ((1 - _k) * sin(t) - _l * _k * sin(((1 - _k) / _k) * t));
        
        if (i == 0)
            [path moveToPoint:CGPointMake(x + offsetWidth, y + offsetHeight)];
        else
            [path addLineToPoint:CGPointMake(x + offsetWidth, y + offsetHeight)];
        
        t += _stepSize;
    }
    
    [path stroke];
}
@end
