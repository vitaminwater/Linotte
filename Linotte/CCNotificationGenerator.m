//
//  CCNotificationGenerator.m
//  Linotte
//
//  Created by stant on 14/05/14.
//  Copyright (c) 2014 CCSAS. All rights reserved.
//

#import "CCNotificationGenerator.h"

#import <RestKit/RestKit.h>

#import "CCAddress.h"
#import "CCCategory.h"

@implementation CCNotificationGenerator

- (void)didEnterGeohash:(NSArray *)geohash
{
    NSManagedObjectContext *managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[CCAddress entityName]];
    
    NSDate *date = [[NSDate date] dateByAddingTimeInterval:-3600 * 24];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"geohash IN %@ && (lastnotif = nil || lastnotif < %@)", geohash, date];
    [fetchRequest setPredicate:predicate];
    
    NSArray *results = [managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    
    for (CCAddress *address in results) {
        CCCategory *category = [address.categories.allObjects firstObject];
        NSDictionary *userInfo = @{@"addressId" : address.identifier};
        UILocalNotification *localNotification = [UILocalNotification new];
        
        if (category == nil)
            localNotification.alertBody = [NSString stringWithFormat:@"Vous êtes proche de %@", address.name];
        else
            localNotification.alertBody = [NSString stringWithFormat:@"Vous êtes proche de %@, %@", address.name, category.name];
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.userInfo = userInfo;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        
        address.lastnotif = [NSDate date];
    }
    [UIApplication sharedApplication].applicationIconBadgeNumber = [results count];
    [managedObjectContext saveToPersistentStore:NULL];
}

#pragma mark - singelton method

+ (instancetype)sharedInstance
{
    static id instance = nil;
    
    if (instance == nil)
        instance = [self new];
    
    return instance;
}

@end
