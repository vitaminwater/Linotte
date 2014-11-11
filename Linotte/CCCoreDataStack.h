//
//  CCCoreDataStack.h
//  Linotte
//
//  Created by stant on 21/10/14.
//  Copyright (c) 2014 CCSAS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSManagedObjectContext;

@interface CCCoreDataStack : NSObject

- (NSManagedObjectContext *)managedObjectContext;
- (NSManagedObjectContext *)childManagedObjectContext;
- (void)saveChildManagedObjectContext:(NSManagedObjectContext *)childManagedObjectContext;

- (void)saveContext;

+ (instancetype)sharedInstance;

@end