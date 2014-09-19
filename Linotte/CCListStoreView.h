//
//  CCListStoreView.h
//  Linotte
//
//  Created by stant on 09/09/14.
//  Copyright (c) 2014 CCSAS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CCListStoreViewDelegate.h"

@interface CCListStoreView : UIView<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property(nonatomic, assign)id<CCListStoreViewDelegate> delegate;

@end