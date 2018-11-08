//
//  NSManagedObject+NSManagedObject_Simulate.m
//  InternalUmrah
//
//  Created by Mohammed Mir on 08/11/2018.
//  Copyright © 2018 Mohammed Mir. All rights reserved.
//

#import "NSManagedObject+Imitator.h"

@implementation NSManagedObject (Immitator)
- (void)imitateToTarget:(NSManagedObject *)target
{
    NSEntityDescription *entityDescription = self.objectID.entity;
    NSArray *attributeKeys = entityDescription.attributesByName.allKeys;
    NSDictionary *attributeKeysAndValues = [self dictionaryWithValuesForKeys:attributeKeys];
    [target setValuesForKeysWithDictionary:attributeKeysAndValues];
}

- (instancetype)imitateAssociated
{
    NSManagedObject *result = [NSEntityDescription
                               insertNewObjectForEntityForName:self.objectID.entity.name
                               inManagedObjectContext:self.managedObjectContext];
    
    [self immitateToTarget:result];
    return result;
}

- (instancetype)imitateUnassociated
{
    NSManagedObject *result = [[NSManagedObject alloc]
                               initWithEntity:self.entity
                               insertIntoManagedObjectContext:nil];
    [self imitateToTarget:result];
    return result;
}
@end
