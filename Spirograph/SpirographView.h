//
//  SpirographView.h
//  Spirograph
//
//  Created by Moser, Wesley on 2/21/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpirographView : UIView

@property (nonatomic) CGFloat l;
@property (nonatomic) CGFloat k;
@property (nonatomic) NSUInteger numberOfSteps;
@property (nonatomic) CGFloat stepSize;

@end
