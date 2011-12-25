//
//  Book.h
//  CoreData
//
//  Created by Xubing Zhang on 11-12-25.
//  Copyright 2011 Ad-Sage. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Author;

@interface Book :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * Title;
@property (nonatomic, retain) NSSet* WrottenBy;

@end


@interface Book (CoreDataGeneratedAccessors)
- (void)addWrottenByObject:(Author *)value;
- (void)removeWrottenByObject:(Author *)value;
- (void)addWrottenBy:(NSSet *)value;
- (void)removeWrottenBy:(NSSet *)value;

@end

