//
//  CCListListViewModel.m
//  Linotte
//
//  Created by stant on 13/09/14.
//  Copyright (c) 2014 CCSAS. All rights reserved.
//

#import "CCListListViewModel.h"

#import <RestKit/RestKit.h>

#import "CCListViewContentProvider.h"

#import "CCList.h"

@implementation CCListListViewModel

@synthesize provider;

#pragma mark CCListViewModelProtocol methods

- (void)loadListItems
{
    NSManagedObjectContext *managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[CCList entityName]];
    
    NSArray *lists = [managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    
    for (CCList *list in lists) {
        [self.provider addList:list];
    }
}

#pragma mark CCModelChangeMonitorDelegate methods

- (void)addList:(CCList *)list
{
    [self.provider addList:list];
}

- (void)removeList:(CCList *)list
{
    [self.provider removeList:list];
}

- (void)updateList:(CCList *)list
{
    
}

- (BOOL)address:(CCAddress *)address movedToList:(CCList *)list
{
    return NO;
}

- (BOOL)address:(CCAddress *)address movedFromList:(CCList *)list
{
    return NO;
}

@end
