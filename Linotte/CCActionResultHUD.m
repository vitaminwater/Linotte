//
//  CCActionResultHUD.m
//  Linotte
//
//  Created by stant on 25/09/14.
//  Copyright (c) 2014 CCSAS. All rights reserved.
//

#import "CCActionResultHUD.h"

@interface CCActionResultHUD()

@property(nonatomic, strong)UIImageView *imageView;
@property(nonatomic, strong)UILabel *label;

@end

@implementation CCActionResultHUD

- (id)initWithImage:(UIImage *)image text:(NSString *)text
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.layer.cornerRadius = 10;
        self.clipsToBounds = YES;
        
        [self setupImageView:image];
        [self setupLabel:text];
        [self setupLayout];
    }
    return self;
}

- (void)setupImageView:(UIImage *)image
{
    _imageView = [UIImageView new];
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.image = image;
    [self addSubview:_imageView];
}

- (void)setupLabel:(NSString *)text
{
    _label = [UILabel new];
    _label.translatesAutoresizingMaskIntoConstraints = NO;
    _label.font = [UIFont fontWithName:@"Futura-Book" size:20];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.textColor = [UIColor whiteColor];
    _label.numberOfLines = 0;
    _label.text = text;
    [self addSubview:_label];
}

- (void)setupLayout
{
    NSDictionary *views = NSDictionaryOfVariableBindings(_imageView, _label);
    
    NSArray *verticalContraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_imageView]-[_label]-|" options:0 metrics:nil views:views];
    [self addConstraints:verticalContraints];
    
    for (UIView *view in views.allValues) {
        NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[view]-|" options:0 metrics:nil views:@{@"view" : view}];
        [self addConstraints:horizontalConstraints];
    }
}

#pragma mark - class methods

+ (void)showActionResultWithImage:(UIImage *)image text:(NSString *)text delay:(NSTimeInterval)delay
{
    CCActionResultHUD *actionResultHUD = [[CCActionResultHUD alloc] initWithImage:image text:text];
    actionResultHUD.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *view = [UIApplication sharedApplication].delegate.window.rootViewController.view;
    [view addSubview:actionResultHUD];
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:actionResultHUD attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [view addConstraint:centerXConstraint];
    
    NSLayoutConstraint *centerYContraint = [NSLayoutConstraint constraintWithItem:actionResultHUD attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [view addConstraint:centerYContraint];
    
    actionResultHUD.alpha = 0;
    [UIView animateWithDuration:0.2 animations:^{
        actionResultHUD.alpha = 1;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.2 animations:^{
            actionResultHUD.alpha = 0;
        } completion:^(BOOL finished) {
            [actionResultHUD removeFromSuperview];
        }];
    });
}

@end
