//
//  CCActionResultHUD.h
//  Linotte
//
//  Created by stant on 25/09/14.
//  Copyright (c) 2014 CCSAS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCActionResultHUD : UIView

+ (void)showActionResultWithImage:(UIImage *)image text:(NSString *)text delay:(NSTimeInterval)delay;

@end