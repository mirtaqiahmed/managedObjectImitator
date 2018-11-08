//
//  NSManagedObject+NSManagedObject_Simulate.m
//  InternalUmrah
//
//  Created by Mohammed Mir on 08/11/2018.
//  Copyright © 2018 Mohammed Mir. All rights reserved.
//

#import "NSManagedObject+Immitator.h"

@implementation NSManagedObject (Immitator)
- (void)immitateToTarget:(NSManagedObject *)target
{
    NSEntityDescription *entityDescription = self.objectID.entity;
    NSArray *attributeKeys = entityDescription.attributesByName.allKeys;
    NSDictionary *attributeKeysAndValues = [self dictionaryWithValuesForKeys:attributeKeys];
    [target setValuesForKeysWithDictionary:attributeKeysAndValues];
}

- (instancetype)immitateAssociated
{
    NSManagedObject *result = [NSEntityDescription
                               insertNewObjectForEntityForName:self.objectID.entity.name
                               inManagedObjectContext:self.managedObjectContext];
    
    [self immitateToTarget:result];
    return result;
}

- (instancetype)immitateUnassociated
{
    NSManagedObject *result = [[NSManagedObject alloc]
                               initWithEntity:self.entity
                               insertIntoManagedObjectContext:nil];
    [self immitateToTarget:result];
    return result;
}
@end
