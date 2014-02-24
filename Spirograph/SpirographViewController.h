//
//  SpirographViewController.h
//  Spirograph
//
//  Created by Michael Toth on 2/20/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HarmonigraphView.h"
#import "SpirographView.h"

@interface SpirographViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet HarmonigraphView *harminoView;
@property (weak, nonatomic) IBOutlet SpirographView *spiroView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISlider *lSlider;
@property (weak, nonatomic) IBOutlet UISlider *kSlider;
@property (weak, nonatomic) IBOutlet UITextField *numStepsBox;
@property (weak, nonatomic) IBOutlet UITextField *stepSizeBox;

- (IBAction)redraw:(id)sender;
@end
