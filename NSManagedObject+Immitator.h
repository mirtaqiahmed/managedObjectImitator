//
//  NSManagedObject+NSManagedObject_Simulate.h
//  InternalUmrah
//
//  Created by Mohammed Mir on 08/11/2018.
//  Copyright © 2018 Mohammed Mir. All rights reserved.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSManagedObject (Immitator)
- (instancetype)immitateUnassociated;
- (instancetype)immitateAssociated;
@end

NS_ASSUME_NONNULL_END
