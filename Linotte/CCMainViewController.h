//
//  CCMainViewController.h
//  Linotte
//
//  Created by stant on 07/05/14.
//  Copyright (c) 2014 CCSAS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CCListViewControllerDelegate.h"

#import "CCAddViewControllerDelegate.h"

#import "CCSplashViewControllerDelegate.h"

@interface CCMainViewController : UIViewController<CCListViewControllerDelegate, CCAddViewControllerDelegate, CCSplashViewControllerDelegate>

@end
