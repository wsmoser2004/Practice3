//
//  SpirographViewController.m
//  Spirograph
//
//  Created by Michael Toth on 2/20/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import "SpirographViewController.h"

@interface SpirographViewController ()

@end

@implementation SpirographViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.numStepsBox setText:@"2400"];
    [self.stepSizeBox setText:@".04"];
    
    [self.lSlider setMinimumValue:.01];
    [self.lSlider setMaximumValue:.99];
    
    [self.kSlider setMinimumValue:.01];
    [self.kSlider setMaximumValue:.99];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showingKeyboard:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hidingKeyboard:) name:UIKeyboardDidHideNotification object:nil];
    
}

- (void)showingKeyboard:(NSNotification *)arg
{
    CGSize keyboardSize =
        [[[arg userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGRect newFrame = self.view.frame;
    newFrame.origin.y -= keyboardSize.height;
    self.view.frame = newFrame;
}

- (void)hidingKeyboard:(NSNotification *)arg
{
    CGSize keyboardSize =
        [[[arg userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect newFrame = self.view.frame;
    newFrame.origin.y += keyboardSize.height;
    self.view.frame = newFrame;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.numStepsBox resignFirstResponder];
    [self.stepSizeBox resignFirstResponder];
    return YES;
}

- (void)viewDidLayoutSubviews
{
    [[self scrollView] setContentSize:CGSizeMake(560, 280)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)redraw:(id)sender
{
    self.spiroView.l = self.lSlider.value;
    self.spiroView.k = self.kSlider.value;
    self.spiroView.numberOfSteps = [self.numStepsBox.text intValue];
    self.spiroView.stepSize = [self.stepSizeBox.text floatValue];
    
    CGFloat offset = [self.scrollView contentOffset].x;
    
    if (offset == 0)
        [self.harminoView setNeedsDisplay];
    else
        [self.spiroView setNeedsDisplay];
}

@end
