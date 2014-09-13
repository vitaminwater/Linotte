//
//  CCListItems.h
//  Linotte
//
//  Created by stant on 10/09/14.
//  Copyright (c) 2014 CCSAS. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    CCListItemTypeAddress,
    CCListItemTypeList,
} CCListItemType;

@class CLLocation;
@class CLHeading;

@class CCAddress;
@class CCList;

NSArray *geohashLimit(CLLocation *location, NSUInteger digits);

@interface CCListItem : NSObject

@property(nonatomic, strong)NSString *name;
@property(nonatomic, assign)BOOL farAway;
@property(nonatomic, strong)CLLocation *currentLocation;

@property(nonatomic, readonly)CCListItemType type;

- (double)distanceFromLocation:(CLLocation *)currentLocation;
- (double)angleFromLocation:(CLLocation *)currentLocation heading:(CLHeading *)currentHeading;

@end

@interface CCListItemAddress : CCListItem

@property(nonatomic, strong)CCAddress *address;

@end

@interface CCListItemList : CCListItem

@property(nonatomic, strong)CCList *list;

@end
