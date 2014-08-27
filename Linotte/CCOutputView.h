//
//  CCOutputView.h
//  Linotte
//
//  Created by stant on 12/05/14.
//  Copyright (c) 2014 CCSAS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CCOutputViewDelegate.h"
#import "CCOutputConfirmEntryViewDelegate.h"
#import "CCAddressSettingsView.h"

@interface CCOutputView : UIView<UITabBarDelegate, CCOutputConfirmEntryViewDelegate, CCAddressSettingsViewDelegate>

@property(nonatomic, readonly)NSString *currentColor;

@property(nonatomic, weak)id <CCOutputViewDelegate>delegate;

- (id)initWithDelegate:(id<CCOutputViewDelegate>)delegate;
- (void)updateValues;
- (void)showIsNewMessage;
- (void)showSettingsView;

@end
